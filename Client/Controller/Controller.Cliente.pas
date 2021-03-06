unit Controller.Cliente;

interface

uses
  Model.Cliente, DAO.Cliente, System.SysUtils, Generics.Collections;

type
  TClienteController = class
    public
      constructor Create;
      destructor Destroy; override;
      function Salvar(oCliente: TCliente; var sErro: string): Boolean;
      function Excluir(iCodigo: Integer; out sErro: String): Boolean;
      function Pesquisar(iCidade: Integer; out sErro: String): TObjectList<TCliente>;
  end;
implementation

{ TClienteController }

constructor TClienteController.Create;
begin
  DaoCliente := TDaoCliente.Create;
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(DaoCliente);
  inherited;
end;

function TClienteController.Excluir(iCodigo: Integer;
  out sErro: String): Boolean;
begin
  Result := DaoCliente.Excluir(iCodigo, sErro);
end;

function TClienteController.Pesquisar(iCidade: Integer;
  out sErro: String): TObjectList<TCliente>;
begin
  Result := DaoCliente.Pesquisar(iCidade, sErro);
end;

function TClienteController.Salvar(oCliente: TCliente;
  var sErro: string): Boolean;
begin
  Result := DaoCliente.Salvar(oCliente, sErro);
end;

end.

