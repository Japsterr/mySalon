unit expired;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB;

type
  TfrmExpired = class(TForm)
    Memo1: TMemo;
    edtKey: TEdit;
    radOneMonth: TRadioButton;
    radSixMonth: TRadioButton;
    radOneYear: TRadioButton;
    Button1: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function testOneMonthKey(key: String): Boolean;
    function testSixMonthKey(key: String): Boolean;
    function testOneYearKey(key: String): Boolean;
    function testKey(): Boolean;
    function findKey(key: String): Boolean;
    procedure insert();
    procedure lockKeys();
  end;

var
  frmExpired: TfrmExpired;

implementation

uses data, main;

{$R *.dfm}

function TfrmExpired.testOneMonthKey(key: string): Boolean;
begin
  if (key[1] >= 'a') and (key[1] <= 'g') then
    if (key[2] >= 'a') and (key[2] <= 'g') then
      if (key[3] >= 'a') and (key[3] <= 'g') then
          if (key[4] >= '0') and (key[4] <= '6') then
            if (key[5] >= '0') and (key[5] <= '6') then
              if (key[6] >=  'm') and (key[6] <= 's') then
                if (key[7] >= 'm') and (key[7] <= 's') then
                  if (key[8] >= 'm') and (key[8] <= 's') then
                    if (key[9] >= 'u') and (key[9] <= 'z') then
                      if (key[10] >= 'u') and (key[10] <= 'z') then
                        testOneMonthKey := true
                      else
                        testOneMonthKey := false
                    else
                      testOneMonthKey := false
                  else
                    testOneMonthKey := false
                else
                  testOneMonthKey := false
              else
                testOneMonthKey := false
            else
              testOneMonthKey := false
          else
            testOneMonthKey := false
      else
        testOneMonthKey := false
    else
      testOneMonthKey := false
  else
  testOneMonthKey := false;
end;

function TfrmExpired.testSixMonthKey(key: string): Boolean;
begin
  if (key[1] >= 'e') and (key[1] <= 'k') then
    if (key[2] >= 'e') and (key[2] <= 'k') then
      if (key[3] >= 'P') and (key[3] <= 'V') then
          if (key[4] >= 'P') and (key[4] <= 'V') then
            if (key[5] >= '0') and (key[5] <= '6') then
              if (key[6] >=  '0') and (key[6] <= '6') then
                if (key[7] >= 'a') and (key[7] <= 'g') then
                  if (key[8] >= 'a') and (key[8] <= 'g') then
                    if (key[9] >= 'a') and (key[9] <= 'g') then
                      if (key[10] >= '4') and (key[10] <= '8') then
                        testSixMonthKey := true
                      else
                        testSixMonthKey := false
                    else
                      testSixMonthKey := false
                  else
                    testSixMonthKey := false
                else
                  testSixMonthKey := false
              else
                testSixMonthKey := false
            else
              testSixMonthKey := false
          else
            testSixMonthKey := false
      else
        testSixMonthKey := false
    else
      testSixMonthKey := false
  else
  testSixMonthKey := false;

end;

function TfrmExpired.testOneYearKey(key: string): Boolean;
begin
  if (key[1] >= '4') and (key[1] <= '9') then
    if (key[2] >= '4') and (key[2] <= '9') then
      if (key[3] >= 'U') and (key[3] <= 'Z') then
          if (key[4] >= 'U') and (key[4] <= 'Z') then
            if (key[5] >= 'U') and (key[5] <= 'Z') then
              if (key[6] >=  'i') and (key[6] <= 'o') then
                if (key[7] >= 'i') and (key[7] <= 'o') then
                  if (key[8] >= 'C') and (key[8] <= 'I') then
                    if (key[9] >= 'C') and (key[9] <= 'I') then
                      if (key[10] >= 'C') and (key[10] <= 'I') then
                        testOneYearKey := true
                      else
                        testOneYearKey := false
                    else
                      testOneYearKey := false
                  else
                    testOneYearKey := false
                else
                  testOneYearKey := false
              else
                testOneYearKey := false
            else
              testOneYearKey := false
          else
            testOneYearKey := false
      else
        testOneYearKey := false
    else
      testOneYearKey := false
  else
  testOneYearKey := false;
end;

function TfrmExpired.testKey;
begin
  if radOneMonth.Checked then
    testKey := testOneMonthKey(edtKey.Text)
  else if radSixMonth.Checked then
       testKey := testSixMonthKey(edtKey.Text)
       else
        testKey := testOneYearKey(edtKey.Text);
end;

procedure TfrmExpired.Button1Click(Sender: TObject);
begin
  insert();
  DataModule2.connect;
end;

function TfrmExpired.findKey(key: string): Boolean;
var found : Boolean;
    SearchOptions : TLocateOptions;
begin
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbKey.Locate('code', key, SearchOptions);
  findKey := found;
end;

procedure TfrmExpired.insert;
var key: String;
  tempDate: TDateTime;
  regDate: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  tempDate := Date;
  decodeDate(tempDate, year, month, day);
  tempDate := EncodeDate(year, month, day);
  regDate := DataModule2.tbAdminDate_Due.Value;
  if tempDate < regDate then
    tempDate := regDate;

  key := edtKey.Text;

  if radOneMonth.Checked then
  begin
    if testOneMonthKey(key) then
    begin
      if not(findKey(key)) then
      begin
        DataModule2.tbAdmin.Edit;
        DataModule2.tbAdminDate_Due.Value := tempDate + 32;
        DataModule2.tbAdmin.Post;

        DataModule2.tbKey.Insert;
        DataModule2.tbKeycode.Value := key;
        DataModule2.tbKey.Post;
        showMessage('Thanks for your registration.');
        frmExpired.Close;
      end
      else
        showMessage('Sorry you have already used this key');
    end
   else
      showMessage('Sorry the registration key you entered are invalid.');
end;

  if radSixMonth.Checked then
  begin
    if testSixMonthKey(key) then
    begin
      if not(findKey(key)) then
      begin
        DataModule2.tbAdmin.Edit;
        DataModule2.tbAdminDate_Due.Value := tempDate + 190;
        DataModule2.tbAdmin.Post;

        DataModule2.tbKey.Insert;
        DataModule2.tbKeycode.Value := key;
        DataModule2.tbKey.Post;
        showMessage('Thanks for your registration.');
        frmExpired.Close;
      end
      else
        showMessage('Sorry you have already used this key');
    end
   else
      showMessage('Sorry the registration key you entered are invalid.');
end;

  if radOneYear.Checked then
  begin
    if testOneYearKey(key) then
    begin
      if not(findKey(key)) then
      begin
        DataModule2.tbAdmin.Edit;
        DataModule2.tbAdminDate_Due.Value := tempDate + 370;
        DataModule2.tbAdmin.Post;

        DataModule2.tbKey.Insert;
        DataModule2.tbKeycode.Value := key;
        DataModule2.tbKey.Post;
        showMessage('Thanks for your registration.');
        frmExpired.Close;
      end
      else
        showMessage('Sorry you have already used this key');
    end
   else
      showMessage('Sorry the registration key you entered are invalid.');
end;

end;

procedure TfrmExpired.lockKeys;
begin

end;

end.
