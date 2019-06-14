unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSock, StdCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TButton;
    lbl2: TLabel;
    edt2: TEdit;
    btn2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    function WinSockInit: BOOL; 
    procedure WinSockUnInit;

    function GetLocalHostName: string;
    function GetIpAddress: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  WSAData: TWSAData;

const
  Version: Word = $0202;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.btn1Click(Sender: TObject);
begin
  edt1.Text := GetLocalHostName;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  edt1.Text := GetLocalHostName;
  edt2.Text := GetIpAddress;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  WinSockInit;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  WinSockUnInit;
end;

function TForm1.GetIpAddress: string;
type
  TapInAddr = array [0..10] of PInAddr;
  PapInAddr = ^TapInAddr;

var
  RemoteHost : PHostEnt;
  InAddr: PapInAddr;
  HostName: array [0..255] of Char;
  i: Integer;
begin
  gethostname(HostName, SizeOf(HostName));
  RemoteHost := gethostbyname(HostName);
  if RemoteHost = nil then
  begin
    Result := '127.0.0.1';
    Exit;
  end;
  InAddr := PapInAddr(RemoteHost^.h_addr_list);
  i := 0;
  while InAddr^[i] <> nil do
  begin
    Result := StrPas(inet_ntoa(InAddr^[i]^));
    Inc(i);
  end;
end;

function TForm1.GetLocalHostName: string;
var
  HostName: array [0..255] of Char;
begin
  gethostname(HostName,SizeOf(HostName));
  Result := HostName;
end;

function TForm1.WinSockInit: BOOL;
begin
  if WSAStartup(Version, WSAData) = ERROR_SUCCESS then
  begin
//    ShowMessage('WinSock库记载成功！');
    Result := True;
  end
  else
  begin
    ShowMessage('WinSock库记载失败！');
    if WSAIsBlocking = True then
      WSACancelBlockingCall;
    WSACleanup;
  end;
  
end;

procedure TForm1.WinSockUnInit;
begin
  if WSACleanup = ERROR_SUCCESS then
  begin
//    ShowMessage('释放winsock库成功');
  end
  else
  begin
    ShowMessage('释放winsock库失败');
    Exit;
  end;
end;

end.
