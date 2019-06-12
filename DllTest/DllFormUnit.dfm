object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'DllForm'
  ClientHeight = 403
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 48
    Top = 40
    Width = 45
    Height = 16
    Caption = #22995#21517#65306
  end
  object Label2: TLabel
    Left = 328
    Top = 40
    Width = 45
    Height = 16
    Caption = #24615#21035#65306
  end
  object Label3: TLabel
    Left = 18
    Top = 78
    Width = 75
    Height = 16
    Caption = #20986#29983#24180#26376#65306
  end
  object Button1: TButton
    Left = 320
    Top = 136
    Width = 193
    Height = 73
    Caption = #20851#38381
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 88
    Top = 32
    Width = 121
    Height = 24
    TabOrder = 1
    Text = 'Edit1'
  end
  object ComboBox1: TComboBox
    Left = 368
    Top = 32
    Width = 145
    Height = 24
    ItemHeight = 16
    TabOrder = 2
    Items.Strings = (
      #30007
      #22899)
  end
  object DateTimePicker1: TDateTimePicker
    Left = 88
    Top = 70
    Width = 186
    Height = 24
    Date = 43625.928389872690000000
    Time = 43625.928389872690000000
    TabOrder = 3
  end
end
