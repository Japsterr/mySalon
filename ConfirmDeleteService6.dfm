object frmConfirmDeleteService6: TfrmConfirmDeleteService6
  Left = 0
  Top = 0
  Caption = 'Confir Delete'
  ClientHeight = 202
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 16
    Width = 425
    Height = 25
    Caption = 'Are you sure you want to delete this Service?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 72
    Width = 192
    Height = 41
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkYes
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 255
    Top = 72
    Width = 192
    Height = 41
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkNo
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = DataModule2.tbServiceSix
    Left = 608
    Top = 8
  end
end
