object frDetallePago: TfrDetallePago
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pago'
  ClientHeight = 192
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 156
    Width = 388
    Height = 36
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object bAceptar: TButton
      Left = 307
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 388
    Height = 156
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object Label2: TLabel
      Left = 15
      Top = 56
      Width = 51
      Height = 13
      Caption = 'Tipo Pago:'
      FocusControl = dbTipoPago
    end
    object Label1: TLabel
      Left = 15
      Top = 24
      Width = 61
      Height = 13
      Caption = 'Monto Pago:'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 15
      Top = 96
      Width = 71
      Height = 13
      Caption = 'Banco Tarjeta:'
      FocusControl = dbBancoTarjeta
    end
    object Label4: TLabel
      Left = 15
      Top = 128
      Width = 33
      Height = 13
      Caption = 'Detalle'
      FocusControl = DBEdit3
    end
    object dbTipoPago: TDBLookupComboBox
      Left = 88
      Top = 56
      Width = 227
      Height = 21
      DataField = 'NombreTipoPago'
      DataSource = Form1.dsFromaPago
      TabOrder = 1
      OnEnter = dbTipoPagoEnter
      OnExit = dbTipoPagoExit
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 21
      Width = 134
      Height = 21
      DataField = 'MontoPago'
      DataSource = Form1.dsFromaPago
      TabOrder = 0
    end
    object dbBancoTarjeta: TDBEdit
      Left = 88
      Top = 93
      Width = 281
      Height = 21
      DataField = 'BancoTarjeta'
      DataSource = Form1.dsFromaPago
      TabOrder = 4
    end
    object DBEdit3: TDBEdit
      Left = 88
      Top = 125
      Width = 281
      Height = 21
      DataField = 'Detalle'
      DataSource = Form1.dsFromaPago
      TabOrder = 5
    end
    object dbInstitucion: TDBLookupComboBox
      Left = 88
      Top = 93
      Width = 281
      Height = 21
      DataField = 'Institucion'
      DataSource = Form1.dsFromaPago
      TabOrder = 2
      Visible = False
    end
    object dbTarjeta: TDBLookupComboBox
      Left = 88
      Top = 93
      Width = 281
      Height = 21
      DataField = 'Tarjeta'
      DataSource = Form1.dsFromaPago
      TabOrder = 3
      Visible = False
    end
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 280
    Top = 8
  end
end
