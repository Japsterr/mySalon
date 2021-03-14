unit bookingsInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, DBGrids, DB;

type
  TfrmBookingInfo = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtDate: TDateTimePicker;
    Button1: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    lblDate: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure changeDay;
  end;

var
  frmBookingInfo: TfrmBookingInfo;

implementation

uses data;

{$R *.dfm}

procedure TfrmBookingInfo.FormCreate(Sender: TObject);
var today: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  today := Date;
  decodeDate(today, year, month, day);
  today := encodeDate(year, month, day);

  DataModule2.qBookings.Parameters.ParamByName('date').Value := today;
  DataModule2.qBookings.Active := true;
  lblDate.Caption := DateToStr(today);

  edtDate.Date := today;
end;

procedure TfrmBookingInfo.Button1Click(Sender: TObject);
begin
  changeDay;
end;

procedure TfrmBookingInfo.changeDay;
var today: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  today := edtDate.DateTime;
  decodeDate(today, year, month, day);
  today := encodeDate(year, month, day);

  DataModule2.qBookings.Active := false;
  DataModule2.qBookings.Parameters.ParamByName('date').Value := today;
  DataModule2.qBookings.Active := true;

  DBGrid1.Refresh;
  lblDate.Caption := DateToStr(today);
end;

end.
