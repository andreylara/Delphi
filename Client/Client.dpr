program Client;

uses
  Vcl.Forms,
  View.Principal in 'View\View.Principal.pas' {FrmPrincipal},
  Model.Dados in 'Model\Model.Dados.pas' {dm: TDataModule},
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  uLogin in 'uLogin.pas',
  Controller.Cliente in 'Controller\Controller.Cliente.pas',
  Controller.Cidade in 'Controller\Controller.Cidade.pas',
  Model.Cliente in 'Model\Model.Cliente.pas',
  DAO.Cliente in 'dao\DAO.Cliente.pas',
  Model.Cidade in 'Model\Model.Cidade.pas',
  DAO.Cidade in 'DAO\DAO.Cidade.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.Run;

end.
