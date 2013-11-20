object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = bBuscarTodos
  Caption = 'Cambiar Forma Pago'
  ClientHeight = 506
  ClientWidth = 723
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
    Top = 203
    Width = 723
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 41
    ExplicitWidth = 278
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitWidth = 608
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
      Left = 536
      Top = 2
      Width = 185
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitLeft = 600
      ExplicitTop = 16
      ExplicitHeight = 41
      object BitBtn1: TBitBtn
        Left = 104
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Cerrar'
        DoubleBuffered = True
        Kind = bkClose
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BitBtn1Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 723
    Height = 162
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitWidth = 608
    ExplicitHeight = 232
    object dbGOperacionInv: TDBGrid
      Left = 2
      Top = 2
      Width = 719
      Height = 158
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
    Top = 206
    Width = 723
    Height = 300
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitWidth = 608
    object dbGFormasPago: TDBGrid
      Left = 2
      Top = 43
      Width = 719
      Height = 255
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
      Width = 719
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 4
      ExplicitWidth = 604
      object Label2: TLabel
        Left = 14
        Top = 12
        Width = 108
        Height = 13
        Caption = 'Total Formas de Pago:'
      end
      object lTotalFormaPago: TLabel
        Left = 128
        Top = 12
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
    Left = 512
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 480
    Top = 104
  end
end
