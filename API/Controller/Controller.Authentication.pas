unit Controller.Authentication;

interface

uses
  System.SysUtils,
  Horse,
  JOSE.Core.JWT,
  JOSE.Core.JWS,
  JOSE.Core.JWK,
  JOSE.Core.JWA,
  JOSE.Types.JSON,
  Horse.BasicAuthentication;

var
  FCompact: string;

procedure BuildToken;
function VerifyToken(Usuario, Senha: String): Boolean;
procedure Authentication(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  JOSE.Core.Builder, Vcl.Dialogs;

procedure BuildToken;
var
  LToken: TJWT;
  LAlg: TJOSEAlgorithmId;
  Key: String;
begin
  LToken := TJWT.Create;
  Key := '';
  try
    LToken.Claims.Subject := 'Andrey Lara';
    LToken.Claims.IssuedAt := Now;
    LToken.Claims.Expiration := Now + 1;
    LToken.Claims.Issuer := 'Visual Software';

    LToken.Claims.SetClaimOfType<string>('usuario', 'Andrey');
    LToken.Claims.SetClaimOfType<string>('senha', '123');
    LAlg := TJOSEAlgorithmId.HS256;

    Key := TJSONUtils.ToJSON(LToken.Claims.JSON.GetValue('usuario')) + TJSONUtils.ToJSON(LToken.Claims.JSON.GetValue('senha'));
    FCompact := TJOSE.SerializeCompact(Key, LAlg, LToken);
  finally
    LToken.Free;
  end;
end;

function VerifyToken(Usuario, Senha: String): Boolean;
var
  LToken: TJWT;
  Key: String;
begin
  Result := False;
  Key := '"' + Usuario +'""' + Senha + '"';
  LToken := TJOSE.Verify(Key, FCompact);

  if Assigned(LToken) then
  begin
    try
      Result := LToken.Verified;
    finally
      LToken.Free;
    end;
  end;
end;

procedure Authentication(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  erro: string;
  body: TJsonValue;
  Usuario, Senha: string;
begin
  try
    try
      body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.body), 0)
        as TJsonValue;

      Usuario := body.GetValue<string>('usuario', '');
      Senha := body.GetValue<string>('senha', '');

      body.Free;

      if erro <> '' then
        raise Exception.Create(erro);

    except
      on ex: Exception do
      begin
        Res.Send(ex.Message).Status(400);
        exit;
      end;
    end;
    BuildToken;
    VerifyToken(Usuario, Senha);
  finally
  end;
end;
end.
