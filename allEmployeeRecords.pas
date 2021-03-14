unit allEmployeeRecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, Buttons, StdCtrls, RpCon, RpConDS, RpDefine,
  RpRave, RpRender, RpRenderPDF, RpBase, RpFiler, RpSystem;

type
  TfrmAllEmployeeRecords = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    RvProject1: TRvProject;
    RvEmpoyeeRecords: TRvDataSetConnection;
    SpeedButton1: TSpeedButton;
    RvSystem1: TRvSystem;
    RvRenderPDF1: TRvRenderPDF;
    Open: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAllEmployeeRecords: TfrmAllEmployeeRecords;

implementation

uses data, shellAPI;

{$R *.dfm}

procedure TfrmAllEmployeeRecords.Button1Click(Sender: TObject);
var tempDate: TDateTime;
  dateString: String;
  day: word;
  month: word;
  year: word;
begin
  tempDate := Date;
  decodeDate(tempDate, year, month, day);
  tempDate := encodeDate(year, month, day);
  dateString := DateToStr(tempDate);

  RvProject1.Open;
  RvProject1.SetParam('salonName', DataModule2.tbAdminBus_Name.Value);
  RvProject1.SetParam('date', dateString);
  RvProject1.Execute;
  RvProject1.Close;
end;

procedure TfrmAllEmployeeRecords.FormCreate(Sender: TObject);
begin
  DataSource1.DataSet := DataModule2.tbEmployee;
end;

procedure TfrmAllEmployeeRecords.SpeedButton1Click(Sender: TObject);
var tempDate: TDateTime;
  dateString: String;
  day: word;
  month: word;
  year: word;
begin
  tempDate := Date;
  decodeDate(tempDate, year, month, day);
  tempDate := encodeDate(year, month, day);
  dateString := DateToStr(tempDate);

  RvProject1.Open;
  RvProject1.SetParam('salonName', DataModule2.tbAdminBus_Name.Value);
  RvProject1.SetParam('date', dateString);
  RvSystem1.DefaultDest := rdFile;
  RvSystem1.DoNativeOutput := False;
  RvSystem1.RenderObject := RvRenderPDF1;
  RvSystem1.OutputFileName := 'c:\\Salon\Saved Reports\\Employees.pdf';
  RvSystem1.SystemSetups := RvSystem1.SystemSetups - [ssAllowSetup];
  RvProject1.Engine := RvSystem1;
  RvProject1.Execute;

  Shellexecute(Handle,'open','c:\\Salon\Saved Reports\\Employees.pdf',nil,nil,SW_SHOWNORMAL);

end;

end.
