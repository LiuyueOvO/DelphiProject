program MyThreadPro;

uses
  Forms,
  MyThreadMain in 'MyThreadMain.pas' {Form1},
  TNumThreadUnit in 'TNumThreadUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
