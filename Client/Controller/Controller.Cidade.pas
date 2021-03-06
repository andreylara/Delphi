unit Controller.Cidade;

interface

uses
  Model.Cidade, DAO.Cidade, System.SysUtils, Generics.Collections;

type
  TCidadeController = class
    public
      constructor Create;
      destructor Destroy; override;
      function Salvar(oCidade: TCidade; var sErro: string): Boolean;
      function Excluir(iCodigo: Integer; out sErro: String): Boolean;
      function Pesquisar(out sErro: String): TObjectList<TCidade>;
  end;
implementation

{ TCidadeController }

constructor TCidadeController.Create;
begin
  DaoCidade := TDaoCidade.Create;
end;

destructor TCidadeController.Destroy;
begin
  FreeAndNil(DaoCidade);
  inherited;
end;

function TCidadeController.Excluir(iCodigo: Integer;
  out sErro: String): Boolean;
begin
  Result := DaoCidade.Excluir(iCodigo, sErro);
end;

function TCidadeController.Pesquisar(out sErro: String): TObjectList<TCidade>;
begin
  Result := DaoCidade.Pesquisar(sErro);
end;

function TCidadeController.Salvar(oCidade: TCidade;
  var sErro: string): Boolean;
begin
  Result := DaoCidade.Salvar(oCidade, sErro);
end;

end.

