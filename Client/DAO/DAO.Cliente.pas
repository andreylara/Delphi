unit DAO.Cliente;

interface

uses
  Model.Cliente, System.JSON, REST.Types, System.SysUtils, System.StrUtils,
  Generics.Collections;

type
  TDaoCliente = class
    private
      procedure GetClientes;
      procedure GetClientesCidade(iCidade: Integer);
      procedure GetClientesCidadeErro(Sender: TObject);
    public
      function Pesquisar(iCidade: Integer; out sErro: String): TObjectList<TCliente>;
      function Salvar(oCliente: TCliente; out sErro: String): Boolean;
      function Excluir(iCodigo: Integer; out sErro: String): Boolean;
  end;

var
  DaoCliente: TDaoCliente;
  FListaClientes: TObjectList<TCliente>;

implementation

uses
  Model.Dados;

{ TDaoCliente }

function TDaoCliente.Pesquisar(iCidade: Integer; out sErro: String): TObjectList<TCliente>;
begin
  FListaClientes := TObjectList<TCliente>.Create;
  try
    if iCidade = 0 then
      GetClientes
    else
      GetClientesCidade(iCidade);

    Result := FListaClientes;
  except
    on ex: exception do
      sErro := 'Erro ao acessar o servidor: ' + ex.Message;
  end;
end;

procedure TDaoCliente.GetClientes;
var
  JSON: string;
  arrayClientes: TJSONArray;
  i: integer;
  oCliente: TCliente;
begin
  dm.ReqClienteGet.Execute;
  if dm.ReqClienteGet.Response.StatusCode <> 200 then
    raise Exception.Create('Nenhum cliente encontrado!');

  try
    FListaClientes := TObjectList<TCliente>.Create;
    JSON := dm.ReqClienteGet.Response.JSONValue.ToString();
    arrayClientes := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSON),
      0) as TJSONArray;

    for i := 0 to arrayClientes.Size - 1 do
    begin
      oCliente := TCliente.Create();
      oCliente.Id := arrayClientes.Get(i).GetValue<integer>('id', 0);
      oCliente.Nome := arrayClientes.Get(i).GetValue<string>('nome', '');
      oCliente.Email := arrayClientes.Get(i).GetValue<string>('email', '');
      oCliente.Fone := arrayClientes.Get(i).GetValue<string>('fone', '');
      oCliente.Cidade := arrayClientes.Get(i).GetValue<integer>('cidade', 0);
      FListaClientes.Add(oCliente);
    end;
  finally
    arrayClientes.Free;
  end;
end;

procedure TDaoCliente.GetClientesCidade(iCidade: Integer);
var
  JSON: string;
  arrayClientes: TJSONArray;
  i: integer;
  oCliente: TCliente;
begin
  dm.ReqClienteCidadeGet.Resource := 'cliente/cidade/' + iCidade.ToString;
  dm.ReqClienteCidadeGet.Execute;

  if dm.ReqClienteCidadeGet.Response.StatusCode <> 200 then
    raise Exception.Create('Nenhum cliente encontrado para a cidade selecionada!');

  try
    JSON := dm.ReqClienteCidadeGet.Response.JSONValue.ToString();
    arrayClientes := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSON),
      0) as TJSONArray;

    for i := 0 to arrayClientes.Size - 1 do
    begin
      oCliente := TCliente.Create();
      oCliente.Id := arrayClientes.Get(i).GetValue<integer>('id', 0);
      oCliente.Nome := arrayClientes.Get(i).GetValue<string>('nome', '');
      oCliente.Email := arrayClientes.Get(i).GetValue<string>('email', '');
      oCliente.Fone := arrayClientes.Get(i).GetValue<string>('fone', '');
      oCliente.Cidade := arrayClientes.Get(i).GetValue<integer>('cidade', 0);
      FListaClientes.Add(oCliente);
    end;
  finally
    arrayClientes.Free;
  end;
end;

procedure TDaoCliente.GetClientesCidadeErro(Sender: TObject);
begin
  if Assigned(Sender) and (Sender is exception) then
     raise Exception.Create(exception(Sender).Message);
end;

function TDaoCliente.Salvar(oCliente: TCliente; out sErro: String): Boolean;
var
  jsonBody: TJSONObject;
  sVerbo: TRESTRequestMethod;
begin
  try
    try
      Result := false;
      sErro := '';
      if oCliente.Id = 0 then
        sVerbo := rmPost
      else
        sVerbo := rmPUT;

      jsonBody := TJSONObject.Create;
      jsonBody.AddPair('nome', oCliente.Nome);
      jsonBody.AddPair('email', oCliente.Email);
      jsonBody.AddPair('fone', oCliente.Fone);
      jsonBody.AddPair('cidade', oCliente.Cidade.ToString);

      if sVerbo = rmPUT then
        jsonBody.AddPair('id', oCliente.Id.ToString);

      dm.ReqClientePostPut.Params.Clear;
      dm.ReqClientePostPut.Body.ClearBody;
      dm.ReqClientePostPut.Method := sVerbo;
      dm.ReqClientePostPut.Body.Add(jsonBody.ToString,
        ContentTypeFromString('application/json'));
      dm.ReqClientePostPut.Execute;

      if (dm.ReqClientePostPut.Response.StatusCode <> 200) and
        (dm.ReqClientePostPut.Response.StatusCode <> 201) then
      begin
        sErro := 'Erro ao salvar dados: ';
        Exit;
      end;

      Result := True;
    except
      on ex: exception do
        sErro := 'Erro inesperado: ' + ex.Message;
    end;
  finally
    jsonBody.Free;
  end;
end;

function TDaoCliente.Excluir(iCodigo: Integer; out sErro: String): Boolean;
begin
  try
    Result := false;
    sErro := '';

    dm.ReqClienteDelete.Resource := 'cliente/' + iCodigo.ToString;
    dm.ReqClienteDelete.Execute;

    if (dm.ReqClienteDelete.Response.StatusCode <> 200) then
    begin
      sErro := 'Erro ao excluir dados: ';
      Exit;
    end;

    Result := True;
  except
    on ex: exception do
      sErro := 'Erro inesperado : ' + ex.Message;
  end;
end;

end.
