object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  ClientHeight = 397
  ClientWidth = 477
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tabControl: TcxPageControl
    Left = 0
    Top = 0
    Width = 477
    Height = 397
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tabLista
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 393
    ClientRectLeft = 4
    ClientRectRight = 473
    ClientRectTop = 24
    object tabLista: TcxTabSheet
      Caption = 'Lista'
      ImageIndex = 0
      object gbFuncaoLista: TcxGroupBox
        Left = 0
        Top = 299
        Align = alBottom
        PanelStyle.Active = True
        Style.BorderStyle = ebsUltraFlat
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        TabOrder = 0
        Height = 70
        Width = 469
        object imgAdicionar: TImage
          Left = 387
          Top = 13
          Width = 50
          Height = 50
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Center = True
          Picture.Data = {
            0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
            000000200806000000737A7AF40000036F494441545885BDD74DA855551407F0
            9F878B9988C8431E1221224D821029A341656DCC8890A06810F168D0275E4C0A
            82A84344DA514C2347270A9A38E9631025D4A07C1D8A8615220D444AC4F4D120
            449E200F1169B0F7C1ED79F7FAEE7B7EFCE1C03EEBACBDD6DA6B9FBDF67F2D32
            22CAA6DFC303D88CBBB1162B50601A2770180D0E55A19E19C5EEA2111CAFC4AB
            7811B78D18EF591CC0DE2AD4A7161440D9F40BF4B1535CE94230830F5055A1BE
            30720065D35F81CFF1D8008387C4341F15535F6039D6E0213C9ADE73FC8127AB
            509F9C3380B2E98F63127765E233D88B4FAB509F191474367F192650E2F6ECD3
            296CAE427D74680069E53F635D26FE1AAF54A1FEEF6A8E8704B247DCC61653B8
            BF0AF5895901A43DFF165BB209EF624715EAF9F8EE06F21C3E432F898EE0BEF6
            941499EECB1DE7EF54A1BE26E75085FA005EC0A5245A272E0C290329F57F632C
            C9BF117F9A8146CBA6BF3CE9E7D853857ADFB040CAA6FF115E4BAF17706715EA
            E36D06B665CEA7B1758E951758D979965E6D02DE128B152CC69B50A4BD7F2953
            DC5F85FADF398CCD1B69CFDFCB441365D35F5660035627E1457C72BD9D67F802
            ED695A8A2D051ECE147EAD423D75A3BCA72C1CCC449B7AB827134C7627A5F3DC
            C5A0FDBE6588EE4C15EA8BD97B83E7D3787D2196D0167F0D30F00FCE759ED303
            F4DE1EA0770ECF76F48E65E335852B2F9A91AED06B44EEA3570C55BB4968C944
            8B2537C167EEE3424F2C0E1B92E08E0113F6E2D60146DEE8C87E494F17473AEF
            B98F933DFC8EA79320E0FD5CBB0AF5AEAEC554BABB014C56A1DE3120802E4236
            3E5CE0A74CB0B16CFAAB4630B220944D7F319EC84493057E73B946F7B0F54605
            8067309EC6E7F17D5185FA922BCBEFF6C48AAE2BCAA6BF44760DE3AB2AD4D3ED
            31AC5DAED12BF071D9E444E6BA60B748E589D7F16E1221A9423D2D72B8164F89
            956D18CE8B24237F0E0E534EAC687B26DA5F85FA18B329D977AE64C225765D23
            259B1029D9E224FA13F7B694AC4B4AC744529A33E28592D2A5629AB7B94CFDA6
            F06015EAE3ADDE205ABE0A3F9A4DCBF788B4FCEC088E5B5ABE3AFB34854D57A5
            E59991317C89473A9F66F083786D1F13FF0562655C2B36268F9BDD981C1639E6
            89AEAFB95AB36D626BD635382A66B00F3BE7D59A750219C7EB228918B53EB4CD
            E98783DAB179059005D2C346B13D5F2FA67C4CFCC1CEE2A498EA49F368CFFF07
            4F710D7670F60BAC0000000049454E44AE426082}
          OnClick = imgAdicionarClick
        end
      end
      object tabControlLista: TcxPageControl
        Left = 0
        Top = 0
        Width = 469
        Height = 300
        Align = alTop
        TabOrder = 1
        Properties.ActivePage = tabListaCliente
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 296
        ClientRectLeft = 4
        ClientRectRight = 465
        ClientRectTop = 24
        object tabListaCliente: TcxTabSheet
          Caption = 'Clientes'
          ImageIndex = 1
          object dbgCliente: TDBGrid
            Left = 0
            Top = 33
            Width = 461
            Height = 239
            Align = alClient
            DataSource = dsCliente
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = dbgClienteDblClick
          end
          object gbFiltroCidade: TcxGroupBox
            Left = 0
            Top = 0
            Align = alTop
            PanelStyle.Active = True
            TabOrder = 1
            Height = 33
            Width = 461
            object Label1: TLabel
              Left = 5
              Top = 10
              Width = 99
              Height = 13
              Caption = 'Pesquisa por cidade:'
            end
            object cbbFiltroCidades: TcxComboBox
              Left = 110
              Top = 6
              Properties.Items.Strings = (
                'Todas')
              Properties.OnChange = cbbFiltroCidadesPropertiesChange
              TabOrder = 0
              Text = 'Todas'
              Width = 251
            end
          end
        end
        object tabLsitaCidade: TcxTabSheet
          Caption = 'Cidades'
          ImageIndex = 0
          object dbgCidade: TDBGrid
            Left = 0
            Top = 0
            Width = 461
            Height = 272
            Align = alClient
            DataSource = dsCidade
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = dbgCidadeDblClick
          end
        end
      end
    end
    object tabCadastro: TcxTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object tabControlCadastro: TcxPageControl
        Left = 0
        Top = 0
        Width = 469
        Height = 300
        Align = alTop
        TabOrder = 0
        Properties.ActivePage = tabCadCliente
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 296
        ClientRectLeft = 4
        ClientRectRight = 465
        ClientRectTop = 24
        object tabCadCliente: TcxTabSheet
          Caption = 'Clientes'
          ImageIndex = 0
          object lbEmail: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 44
            Width = 441
            Height = 13
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Email:'
            ExplicitWidth = 28
          end
          object lbNome: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 0
            Width = 441
            Height = 13
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Nome:'
            ExplicitWidth = 31
          end
          object lbTelefone: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 88
            Width = 441
            Height = 13
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Telefone:'
            ExplicitWidth = 46
          end
          object lbCidadeCliente: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 132
            Width = 441
            Height = 13
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Cidade:'
            ExplicitWidth = 37
          end
          object edtEmail: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 57
            Width = 441
            Height = 21
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            TabOrder = 0
          end
          object edtFone: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 101
            Width = 441
            Height = 21
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            TabOrder = 1
          end
          object edtNome: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 13
            Width = 441
            Height = 21
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            TabOrder = 2
          end
          object cbbCidadeCliente: TcxComboBox
            AlignWithMargins = True
            Left = 10
            Top = 145
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            Properties.OnChange = cbbFiltroCidadesPropertiesChange
            TabOrder = 3
            Width = 441
          end
        end
        object tabCadCidade: TcxTabSheet
          Caption = 'Cidades'
          ImageIndex = 1
          object lbCidade: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 0
            Width = 441
            Height = 13
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Nome:'
            ExplicitWidth = 31
          end
          object lbEstado: TLabel
            AlignWithMargins = True
            Left = 10
            Top = 44
            Width = 441
            Height = 13
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Estado:'
            ExplicitWidth = 37
          end
          object edtCidade: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 13
            Width = 441
            Height = 21
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            TabOrder = 0
          end
          object edtEstado: TEdit
            AlignWithMargins = True
            Left = 10
            Top = 57
            Width = 441
            Height = 21
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alTop
            TabOrder = 1
          end
        end
      end
      object gbFuncaoCad: TcxGroupBox
        Left = 0
        Top = 299
        Align = alBottom
        PanelStyle.Active = True
        TabOrder = 1
        DesignSize = (
          469
          70)
        Height = 70
        Width = 469
        object imgExcluir: TImage
          AlignWithMargins = True
          Left = 354
          Top = 13
          Width = 50
          Height = 50
          Anchors = [akRight, akBottom]
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
          Visible = False
          OnClick = imgExcluirClick
          ExplicitLeft = 268
          ExplicitTop = 245
        end
        object imgSalvar: TImage
          AlignWithMargins = True
          Left = 410
          Top = 13
          Width = 50
          Height = 50
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
          OnClick = imgSalvarClick
          ExplicitLeft = 330
          ExplicitTop = 255
        end
      end
    end
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 84
    Top = 352
  end
  object dsCidade: TDataSource
    DataSet = cdsCidade
    Left = 268
    Top = 352
  end
  object cdsCidade: TClientDataSet
    PersistDataPacket.Data = {
      590000009619E0BD010000001800000003000000000003000000590002496404
      00010000000000044E6F6D650100490000000100055749445448020002006400
      0645737461646F01004900000001000557494454480200020002000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 220
    Top = 352
    object cdsCidadeId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
    object cdsCidadeNome: TStringField
      DisplayWidth = 60
      FieldName = 'Nome'
      Size = 100
    end
    object cdsCidadeEstado: TStringField
      DisplayWidth = 5
      FieldName = 'Estado'
      Size = 2
    end
  end
  object cdsCliente: TClientDataSet
    PersistDataPacket.Data = {
      8C0000009619E0BD0100000018000000050000000000030000008C0002496404
      00010000000000044E6F6D650100490000000100055749445448020002003200
      05456D61696C010049000000010005574944544802000200320004466F6E6501
      0049000000010005574944544802000200140006436964616465010049000000
      01000557494454480200020032000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 347
    object cdsClienteId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
    object cdsClienteNome: TStringField
      DisplayWidth = 18
      FieldName = 'Nome'
      Size = 50
    end
    object cdsClienteEmail: TStringField
      DisplayWidth = 20
      FieldName = 'Email'
      Size = 50
    end
    object cdsClienteFone: TStringField
      DisplayWidth = 10
      FieldName = 'Fone'
    end
    object cdsClienteCidade: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Cidade'
      Calculated = True
    end
  end
end
