object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 285
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gbLogin: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 0
    DesignSize = (
      405
      285)
    Height = 285
    Width = 405
    object lbSenha: TLabel
      AlignWithMargins = True
      Left = 32
      Top = 113
      Width = 341
      Height = 24
      Margins.Left = 30
      Margins.Top = 10
      Margins.Right = 30
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 0
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 108
      ExplicitWidth = 62
    end
    object lbUsuario: TLabel
      AlignWithMargins = True
      Left = 32
      Top = 52
      Width = 341
      Height = 24
      Margins.Left = 30
      Margins.Top = 50
      Margins.Right = 30
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 0
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 74
    end
    object imgLogin: TImage
      Left = 323
      Top = 197
      Width = 50
      Height = 50
      Margins.Left = 30
      Margins.Right = 30
      Anchors = [akRight, akBottom]
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
      OnClick = imgLoginClick
    end
    object edtUsuario: TEdit
      AlignWithMargins = True
      Left = 32
      Top = 76
      Width = 341
      Height = 27
      Margins.Left = 30
      Margins.Top = 0
      Margins.Right = 30
      Margins.Bottom = 0
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 0
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Andrey'
      ExplicitTop = 71
    end
    object edtSenha: TEdit
      AlignWithMargins = True
      Left = 32
      Top = 137
      Width = 341
      Height = 27
      Margins.Left = 30
      Margins.Top = 0
      Margins.Right = 30
      Margins.Bottom = 10
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 0
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = #1
      TabOrder = 1
      Text = '123'
      ExplicitLeft = 34
      ExplicitTop = 127
    end
  end
end
