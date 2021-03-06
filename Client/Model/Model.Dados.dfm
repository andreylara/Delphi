object dm: Tdm
  OldCreateOrder = False
  Height = 276
  Width = 376
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost:9000/'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 72
    Top = 32
  end
  object ReqClienteGet: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = 'cliente'
    Timeout = 90000
    SynchronizedEvents = False
    Left = 176
    Top = 32
  end
  object ReqClientePostPut: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <>
    Resource = 'cliente'
    Timeout = 90000
    SynchronizedEvents = False
    Left = 176
    Top = 96
  end
  object ReqClienteDelete: TRESTRequest
    Client = RESTClient
    Method = rmDELETE
    Params = <>
    Resource = 'cliente'
    Timeout = 90000
    SynchronizedEvents = False
    Left = 176
    Top = 160
  end
  object ReqAuthentication: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <>
    Resource = 'login'
    Timeout = 90000
    SynchronizedEvents = False
    Left = 72
    Top = 96
  end
  object ReqCidadePostPut: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <>
    Resource = 'cidade'
    Timeout = 90000
    SynchronizedEvents = False
    Left = 280
    Top = 96
  end
  object ReqCidadeGet: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = 'cidade'
    Timeout = 90000
    SynchronizedEvents = False
    Left = 280
    Top = 32
  end
  object ReqCidadeDelete: TRESTRequest
    Client = RESTClient
    Method = rmDELETE
    Params = <>
    Resource = 'cidade'
    Timeout = 90000
    SynchronizedEvents = False
    Left = 280
    Top = 160
  end
  object ReqClienteCidadeGet: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = 'cliente'
    Timeout = 90000
    SynchronizedEvents = False
    Left = 176
    Top = 216
  end
end
