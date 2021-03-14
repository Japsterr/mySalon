unit allEmpMonth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, Buttons, StdCtrls, RpCon, RpConDS, RpDefine,
  RpRave, RpRender, RpRenderPDF, RpBase, RpSystem;

type
  TfrmAllEmpMonth = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    RvProject1: TRvProject;
    RvEmpMonthlyTotal: TRvDataSetConnection;
    SpeedButton1: TSpeedButton;
    RvSystem1: TRvSystem;
    RvRenderPDF1: TRvRenderPDF;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAllEmpMonth: TfrmAllEmpMonth;

implementation

uses data, ShellAPI;

{$R *.dfm}

procedure TfrmAllEmpMonth.Button1Click(Sender: TObject);
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

procedure TfrmAllEmpMonth.SpeedButton1Click(Sender: TObject);
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
  RvSystem1.OutputFileName := 'c:\\Salon\Saved Reports\\EmpMonthlyTotal.pdf';
  RvSystem1.SystemSetups := RvSystem1.SystemSetups - [ssAllowSetup];
  RvProject1.Engine := RvSystem1;
  RvProject1.Execute;

  Shellexecute(Handle,'open','c:\\Salon\Saved Reports\\EmpMonthlyTotal.pdf',nil,nil,SW_SHOWNORMAL);
end;

end.
