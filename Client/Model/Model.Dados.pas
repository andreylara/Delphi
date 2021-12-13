unit Model.Dados;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, IPPeerClient;

type
  Tdm = class(TDataModule)
    RESTClient: TRESTClient;
    ReqClienteGet: TRESTRequest;
    ReqClientePostPut: TRESTRequest;
    ReqClienteDelete: TRESTRequest;
    ReqAuthentication: TRESTRequest;
    ReqCidadePostPut: TRESTRequest;
    ReqCidadeGet: TRESTRequest;
    ReqCidadeDelete: TRESTRequest;
    ReqClienteCidadeGet: TRESTRequest;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

end.
