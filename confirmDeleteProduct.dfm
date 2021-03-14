object frmConfirmProduct: TfrmConfirmProduct
  Left = 0
  Top = 0
  Caption = 'Delete Confirmation'
  ClientHeight = 162
  ClientWidth = 643
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
    Left = 106
    Top = 16
    Width = 430
    Height = 25
    Caption = 'Are you sure you want to delete this Product?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn2: TBitBtn
    Left = 384
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
    TabOrder = 0
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
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object DataSource1: TDataSource
    DataSet = DataModule2.tbEmployee
    Left = 608
    Top = 8
  end
end
