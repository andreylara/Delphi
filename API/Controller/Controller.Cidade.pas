unit Controller.Cidade;

interface

uses Horse, System.JSON, System.SysUtils, Model.Cidade,
  FireDAC.Comp.Client, Data.DB, DataSet.Serialize;

var
  FCompact: string;

procedure Registry;

implementation

procedure ListarCidades(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cid: TCidade;
  qry: TFDQuery;
  erro: string;
  arrayCidades: TJSONArray;
begin
  try
    cid := TCidade.Create;
  except
    Res.Send('Erro ao conectar com o banco!').Status(500);
    exit;
  end;

  try
    qry := cid.ListarCidade('', erro);

    arrayCidades := qry.ToJSONArray();

    Res.Send<TJSONArray>(arrayCidades);
  finally
    qry.Free;
    cid.Free;
  end;
end;

procedure ListarCidadeID(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cid: TCidade;
  objCidades: TJSONObject;
  qry: TFDQuery;
  erro: string;
begin
  try
    cid := TCidade.Create;
    cid.Id := Req.Params['id'].ToInteger;
  except
    Res.Send('Erro ao conectar com o banco!').Status(500);
    exit;
  end;

  try
    qry := cid.ListarCidade('', erro);

    if qry.RecordCount > 0 then
    begin
      objCidades := qry.ToJSONObject;
      Res.Send<TJSONObject>(objCidades)
    end
    else
      Res.Send('Ciadade não encontrada!').Status(404);
  finally
    qry.Free;
    cid.Free;
  end;
end;

procedure AddCidade(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cid: TCidade;
  objCidade: TJSONObject;
  erro: string;
  body: TJsonValue;
begin
  try
    cid := TCidade.Create;
  except
    Res.Send('Erro ao conectar com o banco!').Status(500);
    exit;
  end;

  try
    try
      body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.body), 0)
        as TJsonValue;

      cid.NOME := body.GetValue<string>('nome', '');
      cid.ESTADO := body.GetValue<string>('estado', '');
      cid.Inserir(erro);

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

    objCidade := TJSONObject.Create;
    objCidade.AddPair('id', cid.Id.ToString);

    Res.Send<TJSONObject>(objCidade).Status(201);
  finally
    cid.Free;
  end;
end;

procedure DeleteCidade(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cid: TCidade;
  objCidade: TJSONObject;
  erro: string;
begin
  try
    cid := TCidade.Create;
  except
    Res.Send('Erro ao conectar com o banco!').Status(500);
    exit;
  end;

  try
    try
      cid.Id := Req.Params['id'].ToInteger;

      if NOT cid.Excluir(erro) then
        raise Exception.Create(erro);

    except
      on ex: Exception do
      begin
        Res.Send(ex.Message).Status(400);
        exit;
      end;
    end;

    objCidade := TJSONObject.Create;
    objCidade.AddPair('id', cid.Id.ToString);

    Res.Send<TJSONObject>(objCidade);
  finally
    cid.Free;
  end;
end;

procedure EditarCidade(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  cid: TCidade;
  objCidade: TJSONObject;
  erro: string;
  body: TJsonValue;
begin
  try
    cid := TCidade.Create;
  except
    Res.Send('Erro ao conectar com o banco!').Status(500);
    exit;
  end;

  try
    try
      body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.body), 0)
        as TJsonValue;

      cid.Id := body.GetValue<integer>('id', 0);
      cid.NOME := body.GetValue<string>('nome', '');
      cid.ESTADO := body.GetValue<string>('estado', '');
      cid.Editar(erro);

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

    objCidade := TJSONObject.Create;
    objCidade.AddPair('id', cid.Id.ToString);

    Res.Send<TJSONObject>(objCidade).Status(200);
  finally
    cid.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/cidade', ListarCidades);
  THorse.Get('/cidade/:id', ListarCidadeID);
  THorse.Post('/cidade', AddCidade);
  THorse.Put('/cidade', EditarCidade);
  THorse.Delete('/cidade/:id', DeleteCidade);
end;

end.
