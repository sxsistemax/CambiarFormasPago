unit uDetallePago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, JvComponentBase, JvEnterTab;

type
  TfrDetallePago = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    dbTipoPago: TDBLookupComboBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    dbBancoTarjeta: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    bAceptar: TButton;
    JvEnterAsTab1: TJvEnterAsTab;
    dbInstitucion: TDBLookupComboBox;
    dbTarjeta: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbTipoPagoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frDetallePago: TfrDetallePago;

Procedure MostrarDetalle;

implementation

uses uTablasConBlobAdministrativo, uPrincipal;

{$R *.dfm}

Procedure MostrarDetalle;
Begin
  with TfrDetallePago.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
End;

procedure TfrDetallePago.dbTipoPagoExit(Sender: TObject);
begin
  Case Integer(dbTipoPago.KeyValue) of
    1   : begin
            dbBancoTarjeta.Visible := False;
            dbInstitucion.Visible := True;
            dbTarjeta.Visible := False;
          end;
    2,3 : begin
            dbBancoTarjeta.Visible := False;
            dbInstitucion.Visible := False;
            dbTarjeta.Visible := True;
          end;
    4,5,6: Begin
            ShowMessage( 'Este tipo de pago no puede ser utilizado por esta aplicación.');
            dbTipoPago.SetFocus;
          End;
    else
          begin
            dbBancoTarjeta.Visible := True;
            dbInstitucion.Visible := False;
            dbTarjeta.Visible := False;
          end;
  End


end;

procedure TfrDetallePago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmAdministrativo.tbFormaPago.State = dsEdit then
  begin
    if dmAdministrativo.tbFormaPagoTipoPago.Value in [4,5,6] then
    begin

      dmAdministrativo.tbFormaPago.Cancel;

      Exit;
    end
    else
      dmAdministrativo.tbFormaPago.Post;
  end;
end;

end.
