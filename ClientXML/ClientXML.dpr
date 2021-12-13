program ClientXML;

uses
  Vcl.Forms,
  uProduto in 'uProduto.pas',
  ViewPrincipal in 'ViewPrincipal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
