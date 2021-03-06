unit uLogin;

interface

uses System.Classes, uUtil_FD;

type
  TLogin = class;

  Login = class(TComponent)
  private
    class var FLogin: Login;
  public
    constructor Create(AOWner: TComponent); override;
    destructor Destroy; override;
    class function GetInstance: Login;

    procedure Authentication(Login: TLogin; out erro: string);
  end;

  TLogin = class(TVsObject)
  private
    FUsuario: string;
    FSenha: string;
  public
    property Usuario: string read FUsuario write FUsuario;
    property Senha: string read FSenha write FSenha;
  end;

var
  Instance: TLogin;

implementation

uses
  Forms, SysUtils, System.JSON, REST.Types, Model.Dados;


{ TLogin }

procedure Login.Authentication(Login: TLogin;out erro: string);
var
  jsonBody: TJSONObject;
begin
  try
    try
      erro := '';

      jsonBody := TJSONObject.Create;
      jsonBody.AddPair('usuario', Login.Usuario);
      jsonBody.AddPair('senha', Login.Senha);

      dm.ReqAuthentication.Params.Clear;
      dm.ReqAuthentication.Body.ClearBody;
      dm.ReqAuthentication.Method := rmPost;
      dm.ReqAuthentication.Body.Add(jsonBody.ToString,
        ContentTypeFromString('application/json'));
      dm.ReqAuthentication.Execute;

      if (dm.ReqAuthentication.Response.StatusCode <> 200) then
      begin
        erro := 'Erro na autenticação: ';
        Exit;
      end;
    except
      on ex: exception do
        erro := 'Erro inesperado: ' + ex.Message;
    end;
  finally
    jsonBody.Free;
  end;
end;

constructor Login.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor Login.Destroy;
begin
  inherited;
end;

class function Login.GetInstance: Login;
begin
  if FLogin = nil then
    FLogin := Login.Create(nil);
  Result := FLogin;
end;

end.
