unit DAO.Cidade;

interface

uses
  Model.Cidade, System.JSON, REST.Types, System.SysUtils, System.StrUtils,
  Generics.Collections;

type
  TDaoCidade = class
    private
      procedure GetCidades;
    public
      function Pesquisar(out sErro: String): TObjectList<TCidade>;
      function Salvar(oCidade: TCidade; out sErro: String): Boolean;
      function Excluir(iCodigo: Integer; out sErro: String): Boolean;
  end;

var
  DaoCidade: TDaoCidade;
  FListaCidades: TObjectList<TCidade>;

implementation

uses
  Model.Dados;

{ TDaoCidade }

function TDaoCidade.Pesquisar(out sErro: String): TObjectList<TCidade>;
begin
  FListaCidades := TObjectList<TCidade>.Create;
  try
    GetCidades;

    Result := FListaCidades;
  except
    on ex: exception do
      sErro := 'Erro ao acessar o servidor: ' + ex.Message;
  end;
end;

procedure TDaoCidade.GetCidades;
var
  JSON: string;
  arrayCidades: TJSONArray;
  i: integer;
  oCidade: TCidade;
begin
  dm.ReqCidadeGet.Execute;
  if dm.ReqCidadeGet.Response.StatusCode <> 200 then
    raise Exception.Create('Nenhuma cidade encontrada!');

  try
    JSON := dm.ReqCidadeGet.Response.JSONValue.ToString();
    arrayCidades := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSON),
      0) as TJSONArray;

    for i := 0 to arrayCidades.Size - 1 do
    begin
      oCidade := TCidade.Create();
      oCidade.Id := arrayCidades.Get(i).GetValue<integer>('id', 0);
      oCidade.Nome := arrayCidades.Get(i).GetValue<string>('nome', '');
      oCidade.Estado := arrayCidades.Get(i).GetValue<string>('estado', '');
      FListaCidades.Add(oCidade);
    end;
  finally
    arrayCidades.Free;
  end;
end;

function TDaoCidade.Excluir(iCodigo: Integer; out sErro: String): Boolean;
begin
  try
    Result := false;
    sErro := '';

    dm.ReqCidadeDelete.Resource := 'cidade/' + iCodigo.ToString;
    dm.ReqCidadeDelete.Execute;

    if (dm.ReqCidadeDelete.Response.StatusCode <> 200) then
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

function TDaoCidade.Salvar(oCidade: TCidade; out sErro: String): Boolean;
var
  jsonBody: TJSONObject;
  sVerbo: TRESTRequestMethod;
begin
  try
    try
      Result := false;
      sErro := '';

      if oCidade.Id = 0 then
        sVerbo := rmPost
      else
        sVerbo := rmPUT;

      jsonBody := TJSONObject.Create;
      jsonBody.AddPair('nome', oCidade.Nome);
      jsonBody.AddPair('estado', oCidade.Estado);

      if sVerbo = rmPUT then
        jsonBody.AddPair('id', oCidade.Id.ToString);

      dm.ReqCidadePostPut.Params.Clear;
      dm.ReqCidadePostPut.Body.ClearBody;
      dm.ReqCidadePostPut.Method := sVerbo;
      dm.ReqCidadePostPut.Body.Add(jsonBody.ToString,
        ContentTypeFromString('application/json'));
      dm.ReqCidadePostPut.Execute;

      if (dm.ReqCidadePostPut.Response.StatusCode <> 200) and
        (dm.ReqCidadePostPut.Response.StatusCode <> 201) then
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

end.
