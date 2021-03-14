unit bookingsRegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DB, pngimage, ExtCtrls;

type
  TfrmBookingRegister = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    btnRegister: TButton;
    GroupBox1: TGroupBox;
    gbClient: TGroupBox;
    edtName: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtTime: TComboBox;
    edtDate: TDateTimePicker;
    Button2: TButton;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtClientName: TEdit;
    edtTelephone: TEdit;
    edtServiceType: TEdit;
    DataSource1: TDataSource;
    Label8: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fillNames;
    function findNumber: Boolean;
    function findBooking: Boolean;
    procedure open();
    procedure close();
    procedure insert();
  end;

var
  frmBookingRegister: TfrmBookingRegister;

implementation

uses data;

{$R *.dfm}

procedure TfrmBookingRegister.fillNames;
begin
  DataModule2.tbEmployee.First;

  while not(DataModule2.tbEmployee.Eof) do
  begin
    edtName.Items.Add(DataModule2.tbEmployeeNames.Value);
    DataModule2.tbEmployee.Next;
  end;
end;

function TfrmBookingRegister.findNumber;
var name : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  name := edtName.Text;
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbEmployee.Locate('Names', name, SearchOptions);
  findNumber := found;
end;

procedure TfrmBookingRegister.FormCreate(Sender: TObject);
begin
  fillNames;
  edtDate.Date := Date;
end;

function TfrmBookingRegister.findBooking;
var found : Boolean;
    SearchOptions : TLocateOptions;
    today: TDateTime;
    time: String;
    id: String;
    day: word;
    month: word;
    year: word;
    foundNum: boolean;
begin
  today := edtDate.DateTime;
  decodeDate(today, year, month, day);
  today := encodeDate(year, month, day);
  foundNum := findNumber;
  id := DataModule2.tbEmployeeID.Value;
  time := edtTime.Text;
  found := DataModule2.tbBookings.Locate('Dates;Time;Emp_ID', VarArrayOf([today,time, id]), SearchOptions);
  findBooking := found;
end;

procedure TfrmBookingRegister.open;
begin
  ShowMessage('Now enter the Client Information and press the Register button.');
  gbClient.Enabled := true;
  btnRegister.Enabled := true;
end;

procedure TfrmBookingRegister.btnRegisterClick(Sender: TObject);
begin
  insert;
  DataModule2.connect;
  close();
end;

procedure TfrmBookingRegister.Button2Click(Sender: TObject);
begin
  if NOT(findBooking = true) then
    open
  else
    showMessage('There is already an appointment made for this hairdresser at the date and time chosen');
end;

procedure TfrmBookingRegister.close;
begin
  showMessage('The Appointment was successfully registered.');
  edtClientName.Clear;
  edtTelephone.Clear;
  edtServiceType.Clear;
  edtName.Text := 'Select Hairdresser';
  edtTime.Text := 'Select Time';
  gbClient.Enabled := false;
  btnRegister.Enabled := false;
end;

procedure TfrmBookingRegister.insert;
var today: TDate;
  day: word;
  month: word;
  year: word;
begin
  DecodeDate(edtDate.Date, year, month, day);
  today := encodeDate(year, month, day);

  if findNumber = true then
  begin
    DataModule2.tbBookings.Insert;
    DataModule2.tbBookingsDates.Value := today;
    DataModule2.tbBookingsTime.Value := edtTime.Text;
    DataModule2.tbBookingsEmp_ID.Value := DataModule2.tbEmployeeID.Value;
    DataModule2.tbBookingsWho.Value := edtClientName.Text;
    DataModule2.tbBookingsWho_Telephone.Value := edtTelephone.Text;
    DataModule2.tbBookingsType.Value := edtServiceType.Text;
    DataModule2.tbBookings.post;
  end;

end;

end.
