unit Model.Cliente;

interface

uses
  System.SysUtils, Generics.Collections;

type
  TCliente = class;

  TCliente = class
  private
    FFone: String;
    FEmail: String;
    FID: Integer;
    FNome: String;
    FCidade: Integer;
    procedure SetNome(const Value: String);
  protected
  public
    property ID: Integer read FID write FID;
    property Nome: String read FNome write SetNome;
    property Email: String read FEmail write FEmail;
    property Fone: String read FFone write FFone;
    property Cidade: Integer read FCidade write FCidade;
  end;

implementation

{ TCliente }

procedure TCliente.SetNome(const Value: String);
begin
  if Value = EmptyStr then
    raise Exception.Create('Nome n?o informado!');
  FNome := Value;
end;

end.
