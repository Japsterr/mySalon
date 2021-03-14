unit bookingDelete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, pngimage, ExtCtrls, DB;

type
  TfrmBookingDelete = class(TForm)
    Label1: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    btnDelete: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtName: TComboBox;
    edtTime: TComboBox;
    edtDate: TDateTimePicker;
    Button2: TButton;
    gbClient: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblName: TLabel;
    lblTelephone: TLabel;
    lblService: TLabel;
    Image1: TImage;
    DataSource1: TDataSource;
    procedure Button2Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findEmployee: Boolean;
    function findBooking: Boolean;
    procedure display;
    procedure delete;
    procedure close;
    procedure fillNames;
  end;

var
  frmBookingDelete: TfrmBookingDelete;

implementation

uses data;

{$R *.dfm}

function TfrmBookingDelete.findEmployee;
var name : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  name := edtName.Text;
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbEmployee.Locate('Names', name, SearchOptions);
  findEmployee := found;
end;

procedure TfrmBookingDelete.FormCreate(Sender: TObject);
begin
  fillNames;
  edtDate.Date := Date;
end;

function TfrmBookingDelete.findBooking;
var found : Boolean;
    SearchOptions : TLocateOptions;
    today: TDateTime;
    time: String;
    id: String;
    day: word;
    month: word;
    year: word;
begin
  today := edtDate.Date;
  decodeDate(today, year, month, day);
  today := encodeDate(year, month, day);

  id := DataModule2.tbEmployeeID.Value;
  time := edtTime.Text;
  found := DataModule2.tbBookings.Locate('Dates;Time;Emp_ID', VarArrayOf([today,time, id]), SearchOptions);
  findBooking := found;
end;

procedure TfrmBookingDelete.display;
begin
  lblName.Caption := DataModule2.tbBookingsWho.Value;
  lblTelephone.Caption := DataModule2.tbBookingsWho_Telephone.Value;
  lblService.Caption := DataModule2.tbBookingsType.Value;
  btnDelete.Enabled := true;
  ShowMessage('Delete the Appointment by pressing the Delete button.');
end;

procedure TfrmBookingDelete.delete;
begin
  if MessageDlg('Are you sure you want to delete this Appointment?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  DataModule2.tbBookings .Delete;
  DataModule2.connect;
  MessageDlg('The Appointment has successfully been deleted.', mtInformation, [mbOk], 0);
  close;
  end;
end;

procedure TfrmBookingDelete.btnDeleteClick(Sender: TObject);
begin
  delete;
end;

procedure TfrmBookingDelete.Button2Click(Sender: TObject);
begin
  if (findEmployee = true) AND (findBooking = true) then
    display
  else
    showMessage('There is no appointment made for this hairdresser at the date and time chosen');
end;

procedure TfrmBookingDelete.close;
begin
  edtName.Text := 'Select Hairdresser';
  edtTime.Text := 'Select Time';
  edtDate.Date := Date;

  lblName.Caption := '';
  lblTelephone.Caption := '';
  lblService.Caption := '';

  btnDelete.Enabled := false;
end;

procedure TfrmBookingDelete.fillNames;
begin
  DataModule2.tbEmployee.First;

  while not(DataModule2.tbEmployee.Eof) do
  begin
    edtName.Items.Add(DataModule2.tbEmployeeNames.Value);
    DataModule2.tbEmployee.Next;
  end;
end;

end.
