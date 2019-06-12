unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    lst1: TListBox;
    btn1: TButton;
  private
    procedure ThreadsDone(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

  TFooThread = class(TThread)
    protected
      procedure Execute; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TFooThread }
const
  MaxSize = 128;

var
  ThreadID : Integer = 0;
  GlobalArray : array[1..MaxSize] of Integer;

procedure TFooThread.Execute;
begin
  OnTerminate := ThreadsDone;

end;

end.
