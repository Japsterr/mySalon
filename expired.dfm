object frmExpired: TfrmExpired
  Left = 0
  Top = 0
  Caption = 'Expiry Date Notice'
  ClientHeight = 600
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
  object Memo1: TMemo
    Left = 27
    Top = 8
    Width = 737
    Height = 449
    Alignment = taCenter
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Your Registration Key has expired. '
      'Please enter a new Key to get full '
      'access of mySalon'
      ''
      'You can get a new Registration Key '
      'from our website smallcell.co.za or '
      'from your sales rep'
      ''
      'Thank You')
    ParentFont = False
    TabOrder = 0
  end
  object edtKey: TEdit
    Left = 355
    Top = 512
    Width = 89
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 1
    Text = 'Enter Key'
  end
  object radOneMonth: TRadioButton
    Left = 229
    Top = 480
    Width = 106
    Height = 17
    Caption = 'One Month'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    TabStop = True
  end
  object radSixMonth: TRadioButton
    Left = 355
    Top = 480
    Width = 102
    Height = 17
    Caption = 'Six Month'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object radOneYear: TRadioButton
    Left = 482
    Top = 480
    Width = 89
    Height = 17
    Caption = 'One Year'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object Button1: TButton
    Left = 27
    Top = 551
    Width = 192
    Height = 41
    Caption = 'Register Key'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 572
    Top = 551
    Width = 192
    Height = 41
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkCancel
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 6
  end
  object DataSource1: TDataSource
    Left = 760
    Top = 480
  end
end
