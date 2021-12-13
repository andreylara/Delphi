unit Model.Cidade;

interface

uses
  System.SysUtils;

type
  TCidade = class
  private
    FID: Integer;
    FNome: String;
    FEstado: String;
    procedure SetNome(const Value: String);
  protected
  public
    property ID: Integer read FID write FID;
    property Nome: String read FNome write SetNome;
    property Estado: String read FEstado write FEstado;
  end;

implementation

{ TCliente }

procedure TCidade.SetNome(const Value: String);
begin
  if Value = EmptyStr then
    raise Exception.Create('Nome não informado!');
  FNome := Value;
end;

end.
