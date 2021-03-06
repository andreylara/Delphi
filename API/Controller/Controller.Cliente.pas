unit Controller.Cliente;

interface

uses Horse, System.JSON, System.SysUtils, Model.Cliente,
  FireDAC.Comp.Client, Data.DB, DataSet.Serialize;

var
  FCompact: string;

procedure Registry;

implementation

procedure ListarClientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cli: TCliente;
  qry: TFDQuery;
  erro: string;
  arrayClientes: TJSONArray;
begin
  try
    cli := TCliente.Create;
  except
    Res.Send('Erro ao conectar com o banco!').Status(500);
    exit;
  end;

  try
    qry := cli.ListarCliente('', erro);

    arrayClientes := qry.ToJSONArray();

    Res.Send<TJSONArray>(arrayClientes);

  finally
    qry.Free;
    cli.Free;
  end;
end;

procedure ListarClienteID(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cli: TCliente;
  objClientes: TJSONObject;
  qry: TFDQuery;
  erro: string;
begin
  try
    cli := TCliente.Create;
    cli.Id := Req.Params['id'].ToInteger;
  except
    Res.Send('Erro ao conectar com o banco!').Status(500);
    exit;
  end;

  try
    qry := cli.ListarCliente('', erro);

    if qry.RecordCount > 0 then
    begin
      objClientes := qry.ToJSONObject;
      Res.Send<TJSONObject>(objClientes)
    end
    else
      Res.Send('Cliente n?o encontrado!').Status(404);
  finally
    qry.Free;
    cli.Free;
  end;
end;

procedure ListarClienteCidade(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cli: TCliente;
  arrayClientes: TJSONArray;
  qry: TFDQuery;
  erro: string;
begin
  try
    cli := TCliente.Create;
    cli.Cidade := Req.Params['cidade'].ToInteger;
  except
    Res.Send('Erro ao conectar com o banco!').Status(500);
    exit;
  end;

  try
    qry := cli.ListarCliente('', erro);

    if qry.RecordCount > 0 then
    begin
      arrayClientes := qry.ToJSONArray();
      Res.Send<TJSONArray>(arrayClientes);
    end
    else
      Res.Send('Cliente n?o encontrado!').Status(404);
  finally
    qry.Free;
    cli.Free;
  end;
end;


procedure AddCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cli: TCliente;
  objCliente: TJSONObject;
  erro: string;
  body: TJsonValue;
begin
  try
    cli := TCliente.Create;
  except
    Res.Send('Erro ao conectar com o banco!').Status(500);
    exit;
  end;

  try
    try
      body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.body), 0)
        as TJsonValue;

      cli.NOME := body.GetValue<string>('nome', '');
      cli.EMAIL := body.GetValue<string>('email', '');
      cli.FONE := body.GetValue<string>('fone', '');
      cli.CIDADE := body.GetValue<integer>('cidade', 0);
      cli.Inserir(erro);

      body.Free;

      if erro <> '' then
        raise Exception.Create(erro);

    except
      on ex: Exception do
      begin
        Res.Send(ex.Message).Status(400);
        exit;
      end;
    end;

    objCliente := TJSONObject.Create;
    objCliente.AddPair('id', cli.Id.ToString);

    Res.Send<TJSONObject>(objCliente).Status(201);
  finally
    cli.Free;
  end;
end;

procedure DeleteCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cli: TCliente;
  objCliente: TJSONObject;
  erro: string;
begin
  try
    cli := TCliente.Create;
  except
    Res.Send('Erro ao conectar com o banco!').Status(500);
    exit;
  end;

  try
    try
      cli.Id := Req.Params['id'].ToInteger;

      if NOT cli.Excluir(erro) then
        raise Exception.Create(erro);

    except
      on ex: Exception do
      begin
        Res.Send(ex.Message).Status(400);
        exit;
      end;
    end;

    objCliente := TJSONObject.Create;
    objCliente.AddPair('id', cli.Id.ToString);

    Res.Send<TJSONObject>(objCliente);
  finally
    cli.Free;
  end;
end;

procedure EditarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cli: TCliente;
  objCliente: TJSONObject;
  erro: string;
  body: TJsonValue;
begin
  try
    cli := TCliente.Create;
  except
    Res.Send('Erro ao conectar com o banco!').Status(500);
    exit;
  end;

  try
    try
      body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.body), 0)
        as TJsonValue;

      cli.Id := body.GetValue<integer>('id', 0);
      cli.NOME := body.GetValue<string>('nome', '');
      cli.EMAIL := body.GetValue<string>('email', '');
      cli.FONE := body.GetValue<string>('fone', '');
      cli.CIDADE := body.GetValue<integer>('cidade', 0);
      cli.Editar(erro);

      body.Free;

      if erro <> '' then
        raise Exception.Create(erro);

    except
      on ex: Exception do
      begin
        Res.Send(ex.Message).Status(400);
        exit;
      end;
    end;

    objCliente := TJSONObject.Create;
    objCliente.AddPair('id', cli.Id.ToString);

    Res.Send<TJSONObject>(objCliente).Status(200);
  finally
    cli.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/cliente', ListarClientes);
  THorse.Get('/cliente/:id', ListarClienteID);
  THorse.Get('/cliente/cidade/:cidade', ListarClienteCidade);
  THorse.Post('/cliente', AddCliente);
  THorse.Put('/cliente', EditarCliente);
  THorse.Delete('/cliente/:id', DeleteCliente);
end;

end.
