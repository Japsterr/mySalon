unit allSaleDaily;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, DB, RpCon, RpConDS, RpDefine,
  RpRave, ComCtrls, RpRender, RpRenderPDF, RpBase, RpSystem;

type
  TfrmAllSaleDaily = class(TForm)
    Label1: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    RvProject1: TRvProject;
    RvDailySales: TRvDataSetConnection;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtDate: TDateTimePicker;
    Button1: TButton;
    lblDate: TLabel;
    RvSystem1: TRvSystem;
    RvRenderPDF1: TRvRenderPDF;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAllSaleDaily: TfrmAllSaleDaily;

implementation

uses data, ShellAPI;

{$R *.dfm}

procedure TfrmAllSaleDaily.Button1Click(Sender: TObject);
var tempDate: TDateTime;
  dateString: String;
  day: word;
  month: word;
  year: word;
begin
  tempDate := edtDate.Date;
  decodeDate(tempDate, year, month, day);
  tempDate := encodeDate(year, month, day);

  DataModule2.qSaleDaily.Active := false;
  DataModule2.qSaleDaily.Parameters.ParamByName('date').Value := tempDate;
  DataModule2.qSaleDaily.Active := true;

  lblDate.Caption := DateToStr(edtDate.Date);

  DBGrid1.Refresh;
end;

procedure TfrmAllSaleDaily.FormCreate(Sender: TObject);
var today: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  edtDate.Date := Date;
  today := Date;
  decodeDate(today, year, month, day);
  today := EncodeDate(year, month, day);

  DataModule2.qSaleDaily.Parameters.ParamByName('date').Value := today;
  DataModule2.qSaleDaily.Active := true;

  lblDate.Caption := DateToStr(edtDate.Date);

end;

procedure TfrmAllSaleDaily.SpeedButton1Click(Sender: TObject);
var tempDate: TDateTime;
  dateString: String;
  day: word;
  month: word;
  year: word;
begin
  tempDate := edtDate.DateTime;
  decodeDate(tempDate, year, month, day);
  tempDate := encodeDate(year, month, day);
  dateString := DateToStr(tempDate);

  RvProject1.Open;
  RvProject1.SetParam('salonName', DataModule2.tbAdminBus_Name.Value);
  RvProject1.SetParam('date', dateString);
  RvProject1.SetParam('telephone', DataModule2.tbAdminTelephone.Value);
  RvSystem1.DefaultDest := rdFile;
  RvSystem1.DoNativeOutput := False;
  RvSystem1.RenderObject := RvRenderPDF1;
  RvSystem1.OutputFileName := 'c:\\Salon\Saved Reports\\DailySale.pdf';
  RvSystem1.SystemSetups := RvSystem1.SystemSetups - [ssAllowSetup];
  RvProject1.Engine := RvSystem1;
  RvProject1.Execute;

  Shellexecute(Handle,'open','c:\\Salon\Saved Reports\\DailySale.pdf',nil,nil,SW_SHOWNORMAL);
end;

end.
