object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = bBuscarTodos
  Caption = 'Cambiar Forma Pago'
  ClientHeight = 513
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 234
    Width = 725
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = -2
    ExplicitTop = 218
    ExplicitWidth = 723
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 725
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 41
      Height = 13
      Caption = 'Factura:'
    end
    object Factura: TEdit
      Left = 64
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnExit = bBuscarClick
    end
    object bBuscar: TButton
      Left = 191
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = bBuscarClick
    end
    object bBuscarTodos: TButton
      Left = 272
      Top = 6
      Width = 89
      Height = 25
      Caption = 'Buscar Todos'
      Default = True
      TabOrder = 2
      OnClick = bBuscarTodosClick
    end
    object Panel5: TPanel
      Left = 538
      Top = 2
      Width = 185
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object BitBtn1: TBitBtn
        Left = 104
        Top = 5
        Width = 75
        Height = 25
        Caption = '&Cerrar'
        DoubleBuffered = True
        Kind = bkClose
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object Configurar: TBitBtn
        Left = 16
        Top = 5
        Width = 82
        Height = 25
        Caption = 'Configurar'
        DoubleBuffered = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5C8BE73B191E5
          E6E5D0D8D46DAE8BC9D0CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFDFDD3D7D5F6F6F68EC0A755C28B7FB1976AB78F49BC7FAABEB3F3F3F3D4D8
          D6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFBDCEC66ACC9D7DB69B6CC1975DC69158
          C48E54C28A50C08667B18A5FB5874AB67CD4D8D6FFFFFFFFFFFFFFFFFFFFFFFF
          E0E4E273CEA46CCEA068CB9C64C99860C7945BC59057C38D53C1894FBF8561B6
          89F3F3F3FFFFFFFFFFFFFFFFFFC3CCC8B3C2BB7CCEAA73D1A76FCFA370CA9F8E
          C1A884C2A45FC7945AC58F56C38C6BB38EACBFB5CAD1CDFFFFFFF6F6F686D5B4
          80D6B27DD5AF7AD4AD7DC9A7DFE2E1FFFFFFFFFFFFC6D5CE62C8975DC69259C4
          8E55C28A75B292FCFCFCFDFDFDC5D5CE8BD2B583D7B480D6B1A9C0B6FFFFFFFF
          FFFFFFFFFFFFFFFFA1C8B565CA9960C89575BC98D2D9D5FFFFFFFFFFFFDEE0DF
          94CBB688D9B985D8B6ADBFB8FFFFFFFFFFFFFFFFFFFFFFFFB9C9C26CCDA068CB
          9C87B49FE5E6E5FFFFFFF5F6F695D9C091DCC08EDBBD8ADABB8DC3ADEBEBEBFF
          FFFFFFFFFFDFE2E17BCFA973D1A66FCFA36BCD9F81B89DFCFCFCFFFFFFB6D1C8
          AACDC194DCC290DCBF8DDBBD8FC3AFAEC0B9ABC0B786CDAE7DD5AF7AD4AC7DCA
          A799C6B2BACAC3FFFFFFFFFFFFFFFFFFEFEFEF9AD8C395DEC492DDC18FDCBF8C
          DBBC89D9B986D8B782D7B47FD6B18ABCA6F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
          C1D1CC9EE1CB9CD9C598DEC695DEC391DDC08EDBBE8BDABB8BD3B686D7B582D6
          B3D4D7D6FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8C2D3CEEFF0EFAECDC39AE0C89B
          CFBD97D6BF91DCC0B6C4BEE1E5E4C2D1CAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFB9D1CAA0DDCADFE1E0C7D5D098DAC2C5CECBFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FF
          FFFFFDFDFDF6F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = ConfigurarClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 725
    Height = 193
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object dbGOperacionInv: TDBGrid
      Left = 2
      Top = 2
      Width = 721
      Height = 189
      Hint = 'Haga clic en la columna TOTAL PRECIO para mostrar el detalle'
      Align = alClient
      DataSource = dsOperacionInv
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbGOperacionInvCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'FTI_DOCUMENTO'
          Title.Caption = 'DOCUMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FTI_FECHAEMISION'
          Title.Caption = 'FECHA EMISION'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FTI_TOTALNETO'
          Title.Caption = 'TOTAL PRECIO'
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FTI_FORMADEPAGO'
          Title.Alignment = taRightJustify
          Visible = False
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 237
    Width = 725
    Height = 276
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object dbGFormasPago: TDBGrid
      Left = 2
      Top = 43
      Width = 721
      Height = 231
      Align = alClient
      DataSource = dsFromaPago
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbGFormasPagoCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'MontoPago'
          Title.Alignment = taRightJustify
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NombreTipoPago'
          Width = 157
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BancoTarjeta'
          Width = 146
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Detalle'
          Width = 186
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TipoPago'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'RetencionIVA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'MontoMonedaVieja'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NoEsEfectivo'
          Visible = False
        end>
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 721
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 14
        Top = 16
        Width = 108
        Height = 13
        Caption = 'Total Formas de Pago:'
      end
      object lTotalFormaPago: TLabel
        Left = 128
        Top = 16
        Width = 6
        Height = 13
        Caption = '0'
      end
      object bConfirmarCambios: TButton
        Left = 336
        Top = 10
        Width = 115
        Height = 25
        Caption = 'Confirmar Cambios'
        TabOrder = 0
        Visible = False
        OnClick = bConfirmarCambiosClick
      end
      object bCancelarCambios: TButton
        Left = 457
        Top = 10
        Width = 136
        Height = 25
        Caption = 'Cancelar Cambios'
        TabOrder = 1
        Visible = False
        OnClick = bCancelarCambiosClick
      end
    end
  end
  object dsOperacionInv: TDataSource
    AutoEdit = False
    DataSet = dmAdministrativo.sOperacionInv
    Left = 424
  end
  object dsFromaPago: TDataSource
    DataSet = dmAdministrativo.tbFormaPago
    Left = 384
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 480
    Top = 104
  end
end
