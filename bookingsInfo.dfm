object frmBookingInfo: TfrmBookingInfo
  Left = 0
  Top = 0
  Caption = 'Bookings Information'
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 196
    Top = 15
    Width = 409
    Height = 45
    Caption = 'Appointment Information'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblDate: TLabel
    Left = 353
    Top = 66
    Width = 93
    Height = 25
    Caption = '8/10/2011'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 104
    Width = 753
    Height = 337
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Dates'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Time'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Names'
        Title.Caption = 'Hairdresser'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Type'
        Title.Caption = 'Type of Service'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Who'
        Title.Caption = 'Client'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Who_Telephone'
        Title.Caption = 'Client Telephone'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 48
    Top = 456
    Width = 289
    Height = 121
    Caption = 'Pick Date'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 27
      Top = 32
      Width = 31
      Height = 18
      Caption = 'Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtDate: TDateTimePicker
      Left = 75
      Top = 24
      Width = 186
      Height = 26
      Date = 40763.638715636580000000
      Time = 40763.638715636580000000
      TabOrder = 0
    end
    object Button1: TButton
      Left = 48
      Top = 64
      Width = 192
      Height = 41
      Caption = 'Go To'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 561
    Top = 520
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
    TabOrder = 2
  end
  object DataSource1: TDataSource
    DataSet = DataModule2.qBookings
    Left = 736
    Top = 8
  end
end
