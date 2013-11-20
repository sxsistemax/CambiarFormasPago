unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, Grids, DBGrids, JvComponentBase, JvEnterTab,
  Buttons, JvExDBGrids, JvDBGrid;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Factura: TEdit;
    bBuscar: TButton;
    bBuscarTodos: TButton;
    Panel2: TPanel;
    dsOperacionInv: TDataSource;
    dbGOperacionInv: TDBGrid;
    dsFromaPago: TDataSource;
    Panel3: TPanel;
    dbGFormasPago: TDBGrid;
    Panel4: TPanel;
    Label2: TLabel;
    Splitter1: TSplitter;
    lTotalFormaPago: TLabel;
    bConfirmarCambios: TButton;
    bCancelarCambios: TButton;
    JvEnterAsTab1: TJvEnterAsTab;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bBuscarClick(Sender: TObject);
    procedure bBuscarTodosClick(Sender: TObject);
    procedure dbGOperacionInvCellClick(Column: TColumn);
    procedure SumarFormasPago( PrimerVez : boolean);
    procedure bConfirmarCambiosClick(Sender: TObject);
    procedure bCancelarCambiosClick(Sender: TObject);
    procedure ActivarBotones( Mostrar : boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbGFormasPagoCellClick(Column: TColumn);
  private
    { Private declarations }

  public
    { Public declarations }
    FTotalFormaPago : Double;
    FTotalFormaPagoActual : Double;
  end;

var
  Form1: TForm1;

implementation

uses uBaseDatosA2, uTablasConBlobAdministrativo, uDetallePago, uUtilidadesSPA;
{$R *.dfm}

procedure TForm1.ActivarBotones(Mostrar: boolean);
begin
  bConfirmarCambios.Visible := Mostrar;
  bCancelarCambios.Visible := Mostrar;
end;

procedure TForm1.bBuscarClick(Sender: TObject);
begin
  if Factura.Text = '' then
  Begin
    Exit;
  End;

  // Filtra por documento
  dmAdministrativo.sOperacionInv.Filter := 'FTI_DOCUMENTO = ''' + Factura.Text + ''' and FTI_TIPO = 11';
  dmAdministrativo.sOperacionInv.Filtered := True;

  try
    dmAdministrativo.sOperacionInv.Open;
  except on E: Exception do
  end;

  // Borra la tabla
  dmAdministrativo.tbFormaPago.EmptyTable;
end;

procedure TForm1.bBuscarTodosClick(Sender: TObject);
begin
  dmAdministrativo.sOperacionInv.Filtered := False;
  dmAdministrativo.sOperacionInv.Filter := 'FTI_TIPO = 11';
  dmAdministrativo.sOperacionInv.Filtered := True;

  try
    dmAdministrativo.sOperacionInv.Open;
  except on E: Exception do
    ShowException(E, E.StackInfo);
  end;

  // Borra la tabla
  dmAdministrativo.tbFormaPago.EmptyTable;
End;

procedure TForm1.bCancelarCambiosClick(Sender: TObject);
begin

  dmAdministrativo.CargarTablaFormasPago( dmAdministrativo.sOperacionInv,
    dmAdministrativo.sOperacionInvFTI_FORMADEPAGO);

  SumarFormasPago(True);
end;

procedure TForm1.bConfirmarCambiosClick(Sender: TObject);
begin
  SumarFormasPago(False);
  if (FTotalFormaPagoActual <> FTotalFormaPago) then
  begin
    ShowMessage( 'Las formas de pago no estan cuadradas');
    Exit;
  end;

  // Efectua los cambios
  dmAdministrativo.sOperacionInv.Edit;
  dmAdministrativo.GuardarFormasPago( dmAdministrativo.sOperacionInv,
    dmAdministrativo.sOperacionInvFTI_FORMADEPAGO);

  dmAdministrativo.sOperacionInv.Post;

  // Borra la tabla
  dmAdministrativo.tbFormaPago.EmptyTable;

  // Oculta los botones
  ActivarBotones(False);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.dbGOperacionInvCellClick(Column: TColumn);
begin
  // Carga la tabla de forma de pago

  dmAdministrativo.CargarTablaFormasPago( dmAdministrativo.sOperacionInv,
    dmAdministrativo.sOperacionInvFTI_FORMADEPAGO);

  SumarFormasPago(True);
end;

procedure TForm1.dbGFormasPagoCellClick(Column: TColumn);
begin
  if dmAdministrativo.tbFormaPagoTipoPago.Value in [4,5,6] then
  begin
    ShowMessage( 'Este tipo de pago no puede ser modificado');

    if dmAdministrativo.tbFormaPago.State = dsEdit then
        dmAdministrativo.tbFormaPago.Cancel;

    Exit;
  end;

  dmAdministrativo.tbFormaPago.Edit;

  MostrarDetalle;

  ActivarBotones(True);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  OpcionParametro;

  // Hace la verificación de sEmpresa.Dat
  if dmBasesDatos.ExisteSEmpresa then
  Begin
    dmAdministrativo.AbrirSEmpresa;

    if ModoPruebas then
      dmBasesDatos.ConectarDB(dmBasesDatos.RutaEjecucion + dmAdministrativo.sEmpresaFE_DIRDATOS.Value)
    else
      dmBasesDatos.ConectarDB(dmBasesDatos.RutaEjecucion + dmAdministrativo.sEmpresaFE_DIRDATOS.Value);
  End
  Else
  begin
    ShowMessage(
      'No se encontro el archivo sEmpresas.dat, no puede ejecutar el programa'
      );

     Halt(1);
  end;

end;

procedure TForm1.SumarFormasPago(PrimerVez: boolean);
var
  RegistroActual, i : integer;
begin
  RegistroActual := dmAdministrativo.tbFormaPago.RecNo;

  // Sumar el valor de la forma de pago
  FTotalFormaPagoActual := 0;
  dmAdministrativo.tbFormaPago.First;
  while not dmAdministrativo.tbFormaPago.Eof do
  begin
    FTotalFormaPagoActual := FTotalFormaPagoActual + dmAdministrativo.tbFormaPagoMontoPago.Value;
    dmAdministrativo.tbFormaPago.Next;
  end;

  if PrimerVez then
  Begin
    FTotalFormaPago := FTotalFormaPagoActual;
    RegistroActual := 1;
  End;

  lTotalFormaPago.Caption := FormatFloat('#,##0.00;(#,##0.00)', FTotalFormaPagoActual);

  //Ubica el registro en la posicion que estaba antes de sumar
  dmAdministrativo.tbFormaPago.First;
  for I := 1 to RegistroActual - 1 do
    dmAdministrativo.tbFormaPago.Next;


end;

end.
