unit uConfiguracion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, JvBaseDlg, JvSelectDirectory, StdCtrls, ExtCtrls,
  JvComponentBase, JvEnterTab;

type
  TfrConfiguracion = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    eDirectorioAyB: TEdit;
    dgSeleccionarDirectorio: TJvSelectDirectory;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    Label2: TLabel;
    bAceptar: TButton;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure SpeedButton1Click(Sender: TObject);
    procedure bAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frConfiguracion: TfrConfiguracion;

 Procedure ConfigurarApliacion;

implementation


uses uUtilidadesSPA, uBaseDatosA2;


{$R *.dfm}

Procedure ConfigurarApliacion;
begin
  With TfrConfiguracion.Create(Application) do
  begin
    eDirectorioAyB.Text := DirectorioAyB;
    ShowModal;
    Free;
  end;
end;

procedure TfrConfiguracion.bAceptarClick(Sender: TObject);
begin
  DirectorioAyB := eDirectorioAyB.Text;
  GuardarConfiguracion('DirectorioAyB', DirectorioAyB);
  Close;
end;

procedure TfrConfiguracion.SpeedButton1Click(Sender: TObject);
begin
  if dgSeleccionarDirectorio.Execute then
  begin
    eDirectorioAyB.Text := dgSeleccionarDirectorio.Directory;
  end;
end;

end.
