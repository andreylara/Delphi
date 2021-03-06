program API;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  Horse.BasicAuthentication,
  Controller.Cliente in 'Controller\Controller.Cliente.pas',
  Model.Connection in 'Model\Model.Connection.pas',
  Model.Cliente in 'Model\Model.Cliente.pas',
  Controller.Authentication in 'Controller\Controller.Authentication.pas',
  Controller.Cidade in 'Controller\Controller.Cidade.pas',
  Model.Cidade in 'Model\Model.Cidade.pas';

begin
  THorse.Use(Jhonson());

  THorse.Post('/login', Authentication);
  Controller.Cliente.Registry;
  Controller.Cidade.Registry;

  THorse.Listen(9000);

end.
