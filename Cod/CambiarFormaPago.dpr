program CambiarFormaPago;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uBaseDatosA2 in '..\..\CompartidosA2\uBaseDatosA2.pas' {dmBasesDatos: TDataModule},
  uTablasConBlobAdministrativo in '..\..\CompartidosA2\uTablasConBlobAdministrativo.pas' {dmAdministrativo: TDataModule},
  uDetallePago in 'uDetallePago.pas' {frDetallePago},
  uUtilidadesSPA in '..\..\CompartidosA2\uUtilidadesSPA.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Cambiar Forma de Pago';
  Application.CreateForm(TdmBasesDatos, dmBasesDatos);
  Application.CreateForm(TdmAdministrativo, dmAdministrativo);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
