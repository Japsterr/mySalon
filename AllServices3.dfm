object frmAllServices3: TfrmAllServices3
  Left = 0
  Top = 0
  Caption = 'Service Report'
  ClientHeight = 253
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 40
    Top = 24
    Width = 457
    Height = 201
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
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Names'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Active'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DataModule2.tbServiceThree
    Left = 568
    Top = 24
  end
end
