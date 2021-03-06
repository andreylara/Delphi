unit Model.Cidade;

interface

uses FireDAC.Comp.Client, Data.DB, System.SysUtils, Model.Connection;

type
  TCidade = class
    FId: Integer;
    FNome: string;
    FEstado: string;
  private
  public
    constructor Create;
    destructor destroy; override;
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Estado: string read FEstado write FEstado;

    function ListarCidade(orderBy: string; out erro: string): TFDQuery;
    function Inserir(out erro: string): Boolean;
    function Editar(out erro: string): Boolean;
    function Excluir(out erro: string): Boolean;
  end;

implementation

{ TCidade }

constructor TCidade.Create;
begin
  Model.Connection.Connect;
end;

destructor TCidade.destroy;
begin
  //Model.Connection.Disconect;
end;

function TCidade.Inserir(out erro: string): Boolean;
var
  qry: TFDQuery;
  vId: integer;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;

    with qry do
    begin
      Params.Clear;
      Active := false;
      sql.Clear;
      sql.Add('INSERT INTO TESTE_CIDADES(NOME, ESTADO)');
      sql.Add('VALUES(:NOME, :ESTADO)');

      ParamByName('NOME').Value := Nome;
      ParamByName('ESTADO').Value := Estado;

      ExecSQL;

      Id := vId;
    end;

    qry.Free;
    erro := '';
    Result := true;

  except
    on ex: exception do
    begin
      erro := 'Erro ao cadastrar cidade: ' + ex.Message;
      Result := false;
    end;
  end;
end;

function TCidade.Editar(out erro: string): Boolean;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;

    with qry do
    begin
      Active := false;
      sql.Clear;
      sql.Add('UPDATE TESTE_CIDADES SET NOME=:NOME, ESTADO=:ESTADO');
      sql.Add('WHERE ID=:ID');
      ParamByName('NOME').Value := Nome;
      ParamByName('ESTADO').Value := Estado;
      ParamByName('ID').Value := Id;
      ExecSQL;
    end;

    qry.Free;
    erro := '';
    Result := true;

  except
    on ex: exception do
    begin
      erro := 'Erro ao alterar cidade: ' + ex.Message;
      Result := false;
    end;
  end;
end;

function TCidade.Excluir(out erro: string): Boolean;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;

    with qry do
    begin
      Active := false;
      sql.Clear;
      sql.Add('DELETE FROM TESTE_CIDADES WHERE ID=:ID');
      ParamByName('ID').Value := Id;
      ExecSQL;
    end;

    qry.Free;
    erro := '';
    Result := true;

  except
    on ex: exception do
    begin
      erro := 'Erro ao excluir cidade: ' + ex.Message;
      Result := false;
    end;
  end;
end;

function TCidade.ListarCidade(orderBy: string; out erro: string): TFDQuery;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;

    with qry do
    begin
      Active := false;
      sql.Clear;
      sql.Add('SELECT ID, NOME, ESTADO');
      sql.Add('FROM TESTE_CIDADES');
      sql.Add('WHERE 1 = 1');

      if Id > 0 then
      begin
        sql.Add('AND ID = :ID');
        ParamByName('ID').Value := Id;
      end;

      if orderBy = '' then
        sql.Add('ORDER BY ID')
      else
        sql.Add('ORDER BY ' + orderBy);

      Active := true;
    end;

    erro := '';
    Result := qry;
  except
    on ex: exception do
    begin
      erro := 'Erro ao listar cidades: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

end.
