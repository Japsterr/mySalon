unit deleteEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, pngimage, ExtCtrls;

type
  TfrmDeleteEmployee = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    edtPassword: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button2: TButton;
    BitBtn1: TBitBtn;
    lblName: TLabel;
    lblSurname: TLabel;
    DataSource1: TDataSource;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function find: Boolean;
    procedure display();
  end;

var
  frmDeleteEmployee: TfrmDeleteEmployee;

implementation

uses data, confirmDeleteEmployee;

{$R *.dfm}

function TfrmDeleteEmployee.find;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  id := edtPassword.Text;
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbEmployee.Locate('ID', id, SearchOptions);
  find := found;
end;

procedure TfrmDeleteEmployee.Button1Click(Sender: TObject);
begin
  if find then
    display()
  else
    ShowMessage('There is no Employee with that Password in the system.');
end;

procedure TfrmDeleteEmployee.Button2Click(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this employee?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
  DataModule2.tbEmployee.Delete;
  DataModule2.connect;
  MessageDlg('Thank You The Employee was Successful Delete', mtInformation, [mbOk],0);
  frmDeleteEmployee.Close;
  End;
end;

procedure TfrmDeleteEmployee.display;
begin
  lblName.Caption := DataModule2.tbEmployeeNames.Value;
  lblSurname.Caption := DataModule2.tbEmployeeSurname.Value;
  ShowMessage('Press the Delete button to delete this Employee.');
end;

end.
