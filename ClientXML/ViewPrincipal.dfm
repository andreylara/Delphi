object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 250
  Caption = 'Produtos'
  ClientHeight = 283
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  DesignSize = (
    424
    283)
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescricao: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 404
    Height = 13
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 0
    Align = alTop
    Caption = 'Descri'#231#227'o:'
    ExplicitWidth = 50
  end
  object lbValor: TLabel
    Left = 10
    Top = 54
    Width = 24
    Height = 13
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 0
    Align = alCustom
    Caption = 'Valor'
  end
  object imgExcluir: TImage
    AlignWithMargins = True
    Left = 348
    Top = 58
    Width = 30
    Height = 30
    Anchors = [akTop, akRight]
    Center = True
    Picture.Data = {
      0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
      000000200806000000737A7AF4000001C8494441545885AD973D4BC43018809F
      76280EC70D4EE2D4E91027B9511C520E117F82F84BC449FC1DE22F70127138C4
      4E7293388888532691436EB8B193C3A5D2EFBC49FBC2C1D1E4CDF3D0A4C91BA8
      8456D148ABE84EABE8A0DAE61B5A4553ADA27BADA271B52DA8741C030FC011F0
      0B1CC769F6D6137E003C01DBC00B701AA7D9BA2660E08FC061217F65245E0780
      E75192083AE0BD245AE03589C002F792B0C04B122170638163069A6B154D0782
      6398B72170097CDB06964838C031CC8B7C0D4C8067605790D8381D1EF0244EB3
      AFE257E02DE10B87FA3EE02C61FECF7DE035014F097CE18D021E12926884B70A
      0C2CD10AEF141848A2136E15E82961858B043C254470805038E008D812F6C5F4
      1D493A4AA6C065932986E800B32D425FB858A2EB33EC0B1749B46D4443C1AD12
      B545E8085FB1A91D6DD17A9497041CE14B2031BFA5AF44F1387681FFB079A5EF
      2677DFE4EE08724BD3911724AEF0599C661FC5875A457B660CA77A2230AFC4E5
      3C9FC569F6D9D4E8534F84C095033C69830398AD37415E635E87C0399B125902
      B7EEED0E120BE04C723111C38B61998E057012A7D9DA7635F3825B24FEE1D07C
      39CD257AC15B244AF0B684B1B99E4FFA80AB1266CCDAF5FC0F84F40DEBCA7FF7
      FD0000000049454E44AE426082}
    OnClick = imgExcluirClick
  end
  object imgSalvar: TImage
    AlignWithMargins = True
    Left = 384
    Top = 58
    Width = 30
    Height = 30
    Anchors = [akTop, akRight]
    Center = True
    Picture.Data = {
      0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
      000000200806000000737A7AF40000026E494441545885BD963F6814411487BF
      3B8E102458588848B0100B8B58A86821411CB0B410095E1A110B094C0A4D40C2
      31040B193925E815665284F8A748A1768A4240335898422D34A048CA1492422C
      8284202158ECACAE677666EFB27BAFBB796FDFEF9BF7DECC4D890E99B2722FD0
      072C68617EC6EBE50E89F7029F8039E0B3B2F274EC2B7540BC0CBC064E259637
      810650AB140D008C36894354F951A0B7D00A282BFB80F740774AC84A6133A0AC
      EC021E79C401A68A1CC271E088C7FF11A817D20265E571E02D903663BF80635A
      98C5DC2BA0ACEC262ABD6FC06F686116A1987B4003073DFE0F403DFE916B0B94
      95FDC01BD237B60E1CD5C27C891772AB80B2B2077810C8399E14CF1500B8051C
      F0F817803BCD8BB9B4C0DDED73A46F680D38AC85596A766CBB02CACA9DC04C20
      D7D856E290382ACACA1DC024D15F664D0BF32A23C35D609FC73F0F983467C989
      F7002F80936E7D1DA86A619EF99495956780E79E9055E0901666392DA0EC769E
      1487E8FE7EAAAC3CE711DF054CFB0081119F38447D9B69128FAD0B78ACAC3C9F
      F2ED24B0C793FB25703F004819E8F7F82BC06C3384B2720018F47CF703B8AC45
      6AEBFF01B84EF44209410C3AF1DDC05420EFB016E65B509DBF437895689A7DB6
      015C00AAC0594FDC132D4C358B38B8B3AB856900D702B115603620BE020C6715
      FF03E02026805AD6F8141BD2C27C6F0BC041D401D54A82843D0CDD1B41000771
      B30D8865E04AABE25B02242042ED886D13B8A48559CD0DC041D481B10C39EE69
      61E6DB11F7023888DBF84FC757B257AA75000731018CF0FF65B5015CD4C2AC15
      0AE0201AC010D1733A36A58579B71D7168F145A4ACDC0F9C0096F21007F80DC9
      A6ACA4B9415B990000000049454E44AE426082}
    OnClick = imgSalvarClick
  end
  object Label1: TLabel
    Left = 153
    Top = 54
    Width = 65
    Height = 13
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 0
    Align = alCustom
    Caption = 'Quantidades:'
  end
  object edtDescricao: TEdit
    AlignWithMargins = True
    Left = 10
    Top = 23
    Width = 404
    Height = 21
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 0
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 261
    Top = 250
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 339
    Top = 250
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Exportar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 10
    Top = 96
    Width = 404
    Height = 148
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsProduto
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtQuantidade: TEdit
    Left = 153
    Top = 67
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
  object edtValor: TcxCurrencyEdit
    Left = 10
    Top = 67
    TabOrder = 5
    Width = 121
  end
  object cdsProduto: TClientDataSet
    PersistDataPacket.Data = {
      720000009619E0BD010000001800000005000000000003000000720002496404
      000100000000000944657363726963616F010049000000010005574944544802
      00020050000556616C6F7208000400000000000A5175616E7469646164650800
      04000000000005546F74616C08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 232
    object cdsProdutoId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
    object cdsProdutoDescricao: TStringField
      DisplayWidth = 30
      FieldName = 'Descricao'
      Size = 80
    end
    object cdsProdutoValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    end
    object cdsProdutoQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object cdsProdutoTotal: TFloatField
      FieldName = 'Total'
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 56
    Top = 232
  end
end
