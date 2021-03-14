unit deleteDailySale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, StdCtrls, Grids, DBGrids;

type
  TfrmDeleteSale = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function firstDayWeek(): TDateTime;
    function firstDayMonth(): TDateTime;
    procedure removeDaily();
    procedure reduceDailyTotal();
    procedure reduceWeeklyTotal();
    procedure reduceMonthlyTotal();
    procedure reduceYearlyTotal();
    procedure reduceEmpDaily();
    procedure reduceEmpMonthly();
  end;

var
  frmDeleteSale: TfrmDeleteSale;

implementation

uses data, addStock;

{$R *.dfm}

function TfrmDeleteSale.firstDayWeek(): TDateTime;
var monday: TDateTime;
  today: TDateTime;
  dayNum: Integer;
begin
  today := DataModule2.qSaleDailyDates.Value;
  dayNum := DayOfWeek(today);
  if dayNum = 1 then
    monday := date - 6
  else if dayNum = 2 then
    monday := date
  else if dayNum = 3 then
    monday := date - 1
  else if dayNum = 4 then
    monday := date - 2
  else if dayNum = 5 then
    monday := date - 3
  else if dayNum = 6 then
    monday := date - 4
  else if dayNum = 7 then
    monday := date - 5;

  firstDayWeek := monday;
end;

procedure TfrmDeleteSale.Button1Click(Sender: TObject);
begin
  removeDaily();

  DBGrid1.Refresh;
end;

function TfrmDeleteSale.firstDayMonth(): TDateTime;
var today: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  today := DataModule2.qSaleDailyDates.Value;
  decodeDate(today, year, month, day);
  today := encodeDate(year, month, 1);
  firstDayMonth := today;
end;

procedure TfrmDeleteSale.removeDaily;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
    date : TDateTime;
begin

end;

procedure TfrmDeleteSale.reduceDailyTotal;

begin

end;

procedure TfrmDeleteSale.reduceWeeklyTotal;

begin

end;

procedure TfrmDeleteSale.reduceMonthlyTotal;
begin

end;

procedure TfrmDeleteSale.reduceYearlyTotal;
begin

end;

procedure TfrmDeleteSale.reduceEmpDaily;
begin

end;

procedure TfrmDeleteSale.reduceEmpMonthly;
begin

end;

end.
