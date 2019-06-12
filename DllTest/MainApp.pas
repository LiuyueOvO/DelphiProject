unit MainApp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type

  TShowDllForm = function(aHandle: THandle; pTitle: pChar):Integer;stdcall;

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//  function ShowMyDialog(aHandle: THandle; nFlag: Integer):Integer;stdcall;external 'myDll.dll';
  function ShowDllForm(aHandle: THandle; pTitle: pChar):ShortString;stdcall;external 'myDll.dll';
//  function ShowDllFormLess(aHandle: THandle; pTitle: pChar):Integer;stdcall;external 'myDll.dll';
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
//  ShowMyDialog(Application.Handle, 3);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Msg : ShortString;
begin
  Msg := ShowDllForm(Application.Handle, '模态窗体');
  ShowMessage(Msg);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
//  ShowDllFormLess(Application.Handle, '非模态窗体');
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  libHandle: THandle;
  ShowDllForm: TShowDllForm;
begin
  libHandle := LoadLibrary('myDll.dll');
  try
    @ShowDllForm := GetProcAddress(libHandle, 'ShowDllForm');
    ShowDllForm(Application.Handle, '我是dll中的模态子窗体显示调用');
  finally
    FreeLibrary(libHandle);
  end;
end;

end.
