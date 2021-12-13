unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxGDIPlusClasses,
  Vcl.ExtCtrls, Vcl.StdCtrls, cxGroupBox, System.JSON, REST.Types;

type
  TFrmLogin = class(TForm)
    gbLogin: TcxGroupBox;
    edtUsuario: TEdit;
    lbSenha: TLabel;
    edtSenha: TEdit;
    lbUsuario: TLabel;
    imgLogin: TImage;
    procedure imgLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses
  uLogin, View.Principal;

{$R *.dfm}

procedure TFrmLogin.imgLoginClick(Sender: TObject);
var
  erro: string;
  AFrm: TFrmPrincipal;
  User: TLogin;
begin
  erro := '';
  User := TLogin.Create;
  User.Usuario := edtUsuario.Text;
  User.Senha := edtSenha.Text;
  Login.GetInstance.Authentication(User, erro);
  if erro <> '' then
    ShowMessage(erro)
  else
  begin
    AFrm := TFrmPrincipal.Create(Application);
    Self.hide;
    AFrm.ShowModal;
  end;
end;

end.
