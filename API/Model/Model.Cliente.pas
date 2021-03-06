unit Model.Cliente;

interface

uses FireDAC.Comp.Client, Data.DB, System.SysUtils, Model.Connection;

type
  TCliente = class
    FId: Integer;
    FNome: string;
    FEmail: string;
    FFone: string;
    FCidade: Integer;
  private
  public
    constructor Create;
    destructor destroy; override;
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Email: string read FEmail write FEmail;
    property Fone: string read FFone write FFone;
    property Cidade: Integer read FCidade write FCidade;

    function ListarCliente(orderBy: string; out erro: string): TFDQuery;
    function Inserir(out erro: string): Boolean;
    function Editar(out erro: string): Boolean;
    function Excluir(out erro: string): Boolean;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  Model.Connection.Connect;
end;

destructor TCliente.destroy;
begin
  //Model.Connection.Disconect;
end;

function TCliente.Inserir(out erro: string): Boolean;
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
      sql.Add('INSERT INTO TESTE_CLIENTES(NOME, EMAIL, FONE, CIDADE)');
      sql.Add('VALUES(:NOME, :EMAIL, :FONE, :CIDADE)');

      ParamByName('NOME').Value := Nome;
      ParamByName('EMAIL').Value := Email;
      ParamByName('FONE').Value := Fone;
      ParamByName('CIDADE').Value := Cidade;

      ExecSQL;

      Id := vId;
    end;

    qry.Free;
    erro := '';
    Result := true;

  except
    on ex: exception do
    begin
      erro := 'Erro ao cadastrar cliente: ' + ex.Message;
      Result := false;
    end;
  end;
end;

function TCliente.Editar(out erro: string): Boolean;
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
      sql.Add('UPDATE TESTE_CLIENTES SET NOME=:NOME, EMAIL=:EMAIL, FONE=:FONE, CIDADE=:CIDADE');
      sql.Add('WHERE ID=:ID');
      ParamByName('NOME').Value := Nome;
      ParamByName('EMAIL').Value := Email;
      ParamByName('FONE').Value := Fone;
      ParamByName('CIDADE').Value := Cidade;
      ParamByName('ID').Value := Id;
      ExecSQL;
    end;

    qry.Free;
    erro := '';
    Result := true;

  except
    on ex: exception do
    begin
      erro := 'Erro ao alterar cliente: ' + ex.Message;
      Result := false;
    end;
  end;
end;

function TCliente.Excluir(out erro: string): Boolean;
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
      sql.Add('DELETE FROM TESTE_CLIENTES WHERE ID=:ID');
      ParamByName('ID').Value := Id;
      ExecSQL;
    end;

    qry.Free;
    erro := '';
    Result := true;

  except
    on ex: exception do
    begin
      erro := 'Erro ao excluir cliente: ' + ex.Message;
      Result := false;
    end;
  end;
end;

function TCliente.ListarCliente(orderBy: string; out erro: string): TFDQuery;
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
      sql.Add('SELECT CLI.ID, CLI.NOME, EMAIL, FONE, CIDADE');
      sql.Add('FROM TESTE_CLIENTES CLI');
      sql.Add('LEFT JOIN TESTE_CIDADES CID ON CIDADE = CID.ID');
      sql.Add('WHERE 1 = 1');

      if Cidade > 0 then
      begin
        sql.Add('AND CIDADE = :CIDADE');
        ParamByName('CIDADE').Value := Cidade;
      end;

      if Id > 0 then
      begin
        sql.Add('AND CLI.ID = :ID');
        ParamByName('ID').Value := Id;
      end;

      if orderBy = '' then
        sql.Add('ORDER BY CLI.ID')
      else
        sql.Add('ORDER BY ' + orderBy);

      Active := true;
    end;

    erro := '';
    Result := qry;
  except
    on ex: exception do
    begin
      erro := 'Erro ao listar clientes: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

end.
