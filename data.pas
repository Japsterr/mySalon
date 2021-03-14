unit data;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule2 = class(TDataModule)
    database: TADOConnection;
    tbEmployee: TADOTable;
    tbProduct: TADOTable;
    qAllProducts: TADOQuery;
    tbServiceIndex: TADOTable;
    tbServiceOne: TADOTable;
    tbServiceTwo: TADOTable;
    tbServiceThree: TADOTable;
    tbServiceFour: TADOTable;
    tbServiceFive: TADOTable;
    tbServiceSix: TADOTable;
    tbServiceSeven: TADOTable;
    tbServiceEight: TADOTable;
    tbServiceNine: TADOTable;
    tbServiceTen: TADOTable;
    tbSaleTemp: TADOTable;
    tbSaleDaily: TADOTable;
    tbTotalDaily: TADOTable;
    tbTotalWeek: TADOTable;
    tbTotalMonth: TADOTable;
    tbTotalYear: TADOTable;
    tbEmpTotalDaily: TADOTable;
    tbEmpTotalWeek: TADOTable;
    tbEmpTotalMonth: TADOTable;
    tbAdmin: TADOTable;
    tbKey: TADOTable;
    qSaleDaily: TADOQuery;
    qEmpTotalDaily: TADOQuery;
    qEmpTotalWeek: TADOQuery;
    qEmpTotalMonth: TADOQuery;
    qAllProductsID: TWideStringField;
    qAllProductsNames: TWideStringField;
    qAllProductsCost: TFloatField;
    qAllProductsPrice: TFMTBCDField;
    qAllProductsStock: TIntegerField;
    qAllProductsActive: TBooleanField;
    qEmpTotalDailyID: TWideStringField;
    qEmpTotalDailyNames: TWideStringField;
    qEmpTotalDailySurname: TWideStringField;
    qEmpTotalDailySalary: TFloatField;
    qEmpTotalDailyEmployeeCommission: TFloatField;
    qEmpTotalDailyPhone: TWideStringField;
    qEmpTotalDailyDates: TDateTimeField;
    qEmpTotalDailyEmp_ID: TWideStringField;
    qEmpTotalDailyTotal: TFMTBCDField;
    qEmpTotalDailyEmpTotalDailyCommission: TFMTBCDField;
    qEmpTotalMonthID: TWideStringField;
    qEmpTotalMonthNames: TWideStringField;
    qEmpTotalMonthSurname: TWideStringField;
    qEmpTotalMonthSalary: TFloatField;
    qEmpTotalMonthEmployeeCommission: TFloatField;
    qEmpTotalMonthPhone: TWideStringField;
    qEmpTotalMonthStart_Date: TDateTimeField;
    qEmpTotalMonthEmp_ID: TWideStringField;
    qEmpTotalMonthEnd_Date: TDateTimeField;
    qEmpTotalMonthTotal: TFMTBCDField;
    qEmpTotalMonthEmpTotalMonthCommission: TFMTBCDField;
    qEmpTotalWeekNames: TWideStringField;
    qEmpTotalWeekSurname: TWideStringField;
    qEmpTotalWeekStart_Date: TDateTimeField;
    qEmpTotalWeekEnd_Date: TDateTimeField;
    qEmpTotalWeekTotal: TFloatField;
    qEmpTotalWeekEmpTotalWeekCommission: TFloatField;
    tbBookings: TADOTable;
    qBookings: TADOQuery;
    qBookingsNames: TWideStringField;
    qBookingsDates: TDateTimeField;
    qBookingsTime: TWideStringField;
    qBookingsWho: TWideStringField;
    qBookingsWho_Telephone: TWideStringField;
    qBookingsType: TWideStringField;
    qSaleDailyID: TWideStringField;
    qSaleDailyNames: TWideStringField;
    qSaleDailySurname: TWideStringField;
    qSaleDailySalary: TFloatField;
    qSaleDailyCommission: TFloatField;
    qSaleDailyPhone: TWideStringField;
    qSaleDailyDates: TDateTimeField;
    qSaleDailyTime: TWideStringField;
    qSaleDailyEmp_ID: TWideStringField;
    qSaleDailySer_ID: TWideStringField;
    qSaleDailySer_Name: TWideStringField;
    qSaleDailySale_Amount: TIntegerField;
    qSaleDailyTotal_Price: TFloatField;
    qSaleDailyTotal_Comission: TFloatField;
    tbEmployeeID: TWideStringField;
    tbEmployeeNames: TWideStringField;
    tbEmployeeSurname: TWideStringField;
    tbEmployeeSalary: TFloatField;
    tbEmployeeCommission: TFloatField;
    tbEmployeePhone: TWideStringField;
    tbServiceIndexID: TWideStringField;
    tbServiceIndexNames: TWideStringField;
    tbServiceIndexActive: TBooleanField;
    tbServiceThreeID: TWideStringField;
    tbServiceThreeNames: TWideStringField;
    tbServiceThreePrice: TFloatField;
    tbServiceThreeActive: TBooleanField;
    tbServiceFourID: TWideStringField;
    tbServiceFourNames: TWideStringField;
    tbServiceFourPrice: TFloatField;
    tbServiceFourActive: TBooleanField;
    tbServiceFiveID: TWideStringField;
    tbServiceFiveNames: TWideStringField;
    tbServiceFivePrice: TFloatField;
    tbServiceFiveActive: TBooleanField;
    tbServiceSevenID: TWideStringField;
    tbServiceSevenNames: TWideStringField;
    tbServiceSevenPrice: TFloatField;
    tbServiceSevenActive: TBooleanField;
    tbServiceSixID: TWideStringField;
    tbServiceSixNames: TWideStringField;
    tbServiceSixPrice: TFloatField;
    tbServiceSixActive: TBooleanField;
    tbServiceEightID: TWideStringField;
    tbServiceEightNames: TWideStringField;
    tbServiceEightPrice: TFloatField;
    tbServiceEightActive: TBooleanField;
    tbServiceNineID: TWideStringField;
    tbServiceNineNames: TWideStringField;
    tbServiceNinePrice: TFloatField;
    tbServiceNineActive: TBooleanField;
    tbAdminID: TWideStringField;
    tbAdminNames: TWideStringField;
    tbAdminSurname: TWideStringField;
    tbAdminBus_Name: TWideStringField;
    tbAdminTelephone: TWideStringField;
    tbAdminDate_Due: TDateTimeField;
    tbAdminRegistered: TBooleanField;
    tbAdminSetup: TBooleanField;
    tbKeycode: TWideStringField;
    tbServiceTenID: TWideStringField;
    tbServiceTenNames: TWideStringField;
    tbServiceTenPrice: TFloatField;
    tbServiceTenActive: TBooleanField;
    tbBookingsDates: TDateTimeField;
    tbBookingsTime: TWideStringField;
    tbBookingsEmp_ID: TWideStringField;
    tbBookingsWho: TWideStringField;
    tbBookingsWho_Telephone: TWideStringField;
    tbBookingsType: TWideStringField;
    tbTotalDailyDates: TDateTimeField;
    tbTotalDailyTotal: TFloatField;
    tbTotalDailyCommission: TFloatField;
    tbTotalWeekStart_Date: TDateTimeField;
    tbTotalWeekEnd_Date: TDateTimeField;
    tbTotalWeekTotal: TFloatField;
    tbTotalWeekCommission: TFloatField;
    tbTotalMonthStart_Date: TDateTimeField;
    tbTotalMonthEnd_Date: TDateTimeField;
    tbTotalMonthTotal: TFloatField;
    tbTotalMonthCommission: TFloatField;
    tbTotalYearStart_Date: TDateTimeField;
    tbTotalYearEnd_Date: TDateTimeField;
    tbTotalYearTotal: TFloatField;
    tbTotalYearCommission: TFloatField;
    tbEmpTotalDailyDates: TDateTimeField;
    tbEmpTotalDailyEmp_ID: TWideStringField;
    tbEmpTotalDailyTotal: TFloatField;
    tbEmpTotalDailyCommission: TFloatField;
    tbEmpTotalWeekStart_Date: TDateTimeField;
    tbEmpTotalWeekEmp_ID: TWideStringField;
    tbEmpTotalWeekEnd_Date: TDateTimeField;
    tbEmpTotalWeekTotal: TFloatField;
    tbEmpTotalWeekCommission: TFloatField;
    tbServiceOneID: TWideStringField;
    tbServiceOneNames: TWideStringField;
    tbServiceOnePrice: TFloatField;
    tbServiceOneActive: TBooleanField;
    tbServiceTwoID: TWideStringField;
    tbServiceTwoNames: TWideStringField;
    tbServiceTwoPrice: TFloatField;
    tbServiceTwoActive: TBooleanField;
    tbEmpTotalMonthStart_Date: TDateTimeField;
    tbEmpTotalMonthEmp_ID: TWideStringField;
    tbEmpTotalMonthEnd_Date: TDateTimeField;
    tbEmpTotalMonthTotal: TFloatField;
    tbEmpTotalMonthCommission: TFloatField;
    tbProductID: TWideStringField;
    tbProductNames: TWideStringField;
    tbProductCost: TFloatField;
    tbProductPrice: TFloatField;
    tbProductStock: TIntegerField;
    tbProductActive: TBooleanField;
    tbSaleTempDates: TDateTimeField;
    tbSaleTempTime: TWideStringField;
    tbSaleTempEmp_ID: TWideStringField;
    tbSaleTempSer_ID: TWideStringField;
    tbSaleTempSer_Name: TWideStringField;
    tbSaleTempPrice: TFloatField;
    tbSaleTempAmount: TIntegerField;
    tbSaleTempCommision: TFloatField;
    tbSaleDailyDates: TDateTimeField;
    tbSaleDailyTime: TWideStringField;
    tbSaleDailyEmp_ID: TWideStringField;
    tbSaleDailySer_ID: TWideStringField;
    tbSaleDailySer_Name: TWideStringField;
    tbSaleDailySale_Amount: TIntegerField;
    tbSaleDailyTotal_Price: TFloatField;
    tbSaleDailyTotal_Comission: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setupShow();
    procedure checkDate();
    procedure clearTable(ID: String);
    procedure connect();
  end;

var
  DataModule2: TDataModule2;

implementation

uses RegisterService, EditService, DeleteService, setupOne, main, notice,
  expired, setupFour;

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  setupShow;
  checkDate();
end;

procedure TDataModule2.setupShow;
begin
  if DataModule2.tbAdminSetup.Value = false then
  begin
    frmSetupOne := TfrmSetupOne.Create(self);
    frmSetupOne.ShowModal;
    frmSetupOne.Free;
  end;
end;

procedure TDataModule2.checkDate;
var tempDate: TDateTime;
  regDate: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  regDate := DataModule2.tbAdminDate_Due.Value;
  tempDate := Date;
  decodeDate(tempDate, year, month, day);
  tempDate := encodeDate(year, month, day);

  if tempDate = regDate then
  begin
    frmNotice := TfrmNotice.Create(self);
    frmNotice.ShowModal;
    frmNotice.Free;
  end;
end;

procedure TDataModule2.clearTable(ID: string);
begin
  if ID = 'S01' then
  begin
    tbServiceOne.First;
    while not(tbServiceOne.Eof) do
    begin
      tbServiceOne.Edit;
      tbServiceOneNames.Value := '';;
      tbServiceOnePrice.Value := 0.00;
      tbServiceOneActive.Value := false;
      tbServiceOne.Post;
      tbServiceOne.Next;
    end;
  end
  else if ID = 'S02' then
  begin
    tbServiceTwo.First;
    while not(tbServiceTwo.Eof) do
    begin
      tbServiceTwo.Edit;
      tbServiceTwoNames.Value := '';
      tbServiceTwoPrice.Value := 0.00;
      tbServiceTwoActive.Value := false;
      tbServiceTwo.Post;
      tbServiceTwo.Next;
    end;
  end
  else if ID = 'S03' then
  begin
    tbServiceThree.First;
    while not(tbServiceThree.Eof) do
    begin
      tbServiceThree.Edit;
      tbServiceThreeNames.Value := '';
      tbServiceThreePrice.Value := 0.00;
      tbServiceThreeActive.Value := false;
      tbServiceThree.Post;
      tbServiceThree.Next;
    end;
  end
  else if ID = 'S04' then
  begin
    tbServiceFour.First;
    while not(tbServiceFour.Eof) do
    begin
      tbServiceFour.Edit;
      tbServiceFourNames.Value := '';
      tbServiceFourPrice.Value := 0.00;
      tbServiceFourActive.Value := false;
      tbServiceFour.Post;
      tbServiceFour.Next;
    end;
  end
  else if ID = 'S05' then
  begin
    tbServiceFive.First;
    while not(tbServiceFive.Eof) do
    begin
      tbServiceFive.Edit;
      tbServiceFiveNames.Value := '';
      tbServiceFivePrice.Value := 0.00;
      tbServiceFiveActive.Value := false;
      tbServiceFive.Post;
      tbServiceFive.Next;
    end;
  end
  else if ID = 'S06' then
  begin
    tbServiceSix.First;
    while not(tbServiceSix.Eof) do
    begin
      tbServiceSix.Edit;
      tbServiceSixNames.Value := '';
      tbServiceSixPrice.Value := 0.00;
      tbServiceSixActive.Value := false;
      tbServiceSix.Post;
      tbServiceSix.Next;
    end;
  end
  else if ID = 'S07' then
  begin
    tbServiceSeven.First;
    while not(tbServiceSeven.Eof) do
    begin
      tbServiceSeven.Edit;
      tbServiceSevenNames.Value := '';
      tbServiceSevenPrice.Value := 0.00;
      tbServiceSevenActive.Value := false;
      tbServiceSeven.Post;
      tbServiceSeven.Next;
    end;
  end
  else if ID = 'S08' then
  begin
    tbServiceEight.First;
    while not(tbServiceEight.Eof) do
    begin
      tbServiceEight.Edit;
      tbServiceEightNames.Value := '';
      tbServiceEightPrice.Value := 0.00;
      tbServiceEightActive.Value := false;
      tbServiceEight.Post;
      tbServiceEight.Next;
    end;
  end
  else if ID = 'S09' then
  begin
    tbServiceNine.First;
    while not(tbServiceNine.Eof) do
    begin
      tbServiceNine.Edit;
      tbServiceNineNames.Value := '';
      tbServiceNinePrice.Value := 0.00;
      tbServiceNineActive.Value := false;
      tbServiceNine.Post;
      tbServiceNine.Next;
    end;
  end
  else if ID = 'S10' then
  begin
    tbServiceTen.First;
    while not(tbServiceTen.Eof) do
    begin
      tbServiceTen.Edit;
      tbServiceTenNames.Value := '';
      tbServiceTenPrice.Value := 0.00;
      tbServiceTenActive.Value := false;
      tbServiceTen.Post;
      tbServiceTen.Next;
    end;
  end;
end;

procedure TDataModule2.connect;
begin
  database.Connected := false;
  database.Connected := true;

  tbEmployee.Active := true;
  tbServiceIndex.Active := true;
  tbProduct.Active := true;
  tbServiceOne.Active := true;
  tbServiceTwo.Active := true;
  tbServiceThree.Active := true;
  tbServiceFour.Active := true;
  tbServiceFive.Active := true;
  tbServiceSix.Active := true;
  tbServiceSeven.Active := true;
  tbServiceEight.Active := true;
  tbServiceNine.Active := true;
  tbServiceTen.Active := true;
  tbAdmin.Active := true;
  tbKey.Active := true;
  tbSaleTemp.Active := true;
  tbSaleDaily.Active := true;
  tbTotalDaily.Active := true;
  tbTotalWeek.Active := true;
  tbTotalMonth.Active := true;
  tbTotalYear.Active := true;
  tbEmpTotalDaily.Active := true;
  tbEmpTotalWeek.Active := true;
  tbEmpTotalMonth.Active := true;
  qAllProducts.Active := true;
  qSaleDaily.Active := true;
  qEmptotalDaily.Active := true;
  qEmpTotalWeek.Active := true;
  qEmpTotalMonth.Active := true;
  tbBookings.Active := true;
end;

end.
