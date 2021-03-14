unit bookingEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DB, pngimage, ExtCtrls;

type
  TfrmBookingEdit = class(TForm)
    Label1: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    btnEdit: TButton;
    gbHairdresser: TGroupBox;
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
    edtClientName: TEdit;
    edtTelephone: TEdit;
    edtServiceType: TEdit;
    DataSource1: TDataSource;
    Image1: TImage;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findBooking: Boolean;
    function findEmployee: Boolean;
    procedure fillName;
    procedure display;
    procedure close;
    procedure edit;
  end;

var
  frmBookingEdit: TfrmBookingEdit;

implementation

uses data;

{$R *.dfm}

function TfrmBookingEdit.findBooking;
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

function TfrmBookingEdit.findEmployee;
var name : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  name := edtName.Text;
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbEmployee.Locate('Names', name, SearchOptions);
  findEmployee := found;
end;

procedure TfrmBookingEdit.FormCreate(Sender: TObject);
begin
  fillName;
  edtDate.Date := Date;
end;

procedure TfrmBookingEdit.fillName;
begin
  DataModule2.tbEmployee.First;

  while not(DataModule2.tbEmployee.Eof) do
  begin
    edtName.Items.Add(DataModule2.tbEmployeeNames.Value);
    DataModule2.tbEmployee.Next;
  end;
end;

procedure TfrmBookingEdit.display;
begin
  ShowMessage('Edit the client details and press the Edit button.');
  edtClientName.Text := DataModule2.tbBookingsWho.Value;
  edtTelephone.Text := DataModule2.tbBookingsWho_Telephone.Value;
  edtServiceType.Text := DataModule2.tbBookingsType.Value;
  btnEdit.Enabled := true;
  gbHairdresser.Enabled  := false;
  gbClient.Enabled := true;
end;

procedure TfrmBookingEdit.btnEditClick(Sender: TObject);
begin
  edit;
  close;
end;

procedure TfrmBookingEdit.Button2Click(Sender: TObject);
begin
  if (findEmployee = true) AND (findBooking = true) then
    display
  else
    showMessage('There is no appointment made for this hairdresser at the date and time chosen');
end;

procedure TfrmBookingEdit.close;
begin
  ShowMessage('The appointment is successfully Edited.');
  gbHairdresser.Enabled := true;
  edtName.Text := 'Select Hairdresser';
  edtDate.Date := Date;
  edtTime.Text := 'Select Time';
  edtClientName.Clear;
  edtTelephone.Clear;
  edtServiceType.Clear;
  btnEdit.Enabled := false;
  gbClient.Enabled := false;
end;

procedure TfrmBookingEdit.edit;
begin
  DataModule2.tbBookings.Edit;
  DataModule2.tbBookingsWho.Value := edtClientName.Text;
  DataModule2.tbBookingsWho_Telephone.Value := edtTelephone.Text;
  DataModule2.tbBookingsType.Value := edtServiceType.Text;
  DataModule2.tbBookings.Post;
end;

end.
