unit uConfiguracion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, JvBaseDlg, JvSelectDirectory, StdCtrls, ExtCtrls;

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
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frConfiguracion: TfrConfiguracion;

implementation

{$R *.dfm}

procedure TfrConfiguracion.SpeedButton1Click(Sender: TObject);
begin
  if dgSeleccionarDirectorio.Execute(self) then
  begin
    eDirectorioAyB.Text := dgSeleccionarDirectorio.Directory;
  end;
end;

end.
