unit editEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, pngimage, ExtCtrls;

type
  TfrmEditEmployee = class(TForm)
    Button1: TButton;
    edtCommission: TEdit;
    edtSalary: TEdit;
    edtSurname: TEdit;
    edtName: TEdit;
    edtPassword: TEdit;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Button2: TButton;
    BitBtn1: TBitBtn;
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
    procedure open();
    procedure close();
    procedure edit();
  end;

var
  frmEditEmployee: TfrmEditEmployee;

implementation

uses data;

{$R *.dfm}

function TfrmEditEmployee.find;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  id := edtPassword.Text;
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbEmployee.Locate('ID', id, SearchOptions);
  find := found;
end;

procedure TfrmEditEmployee.display;
begin
  edtName.Text := DataModule2.tbEmployeeNames.Value;
  edtSurname.Text := DataModule2.tbEmployeeSurname.Value;
  edtSalary.Text := FloatToStr(DataModule2.tbEmployeeSalary.Value);
  edtCommission.Text := FloatToStr(DataModule2.tbEmployeeCommission.Value);
end;

procedure TfrmEditEmployee.open;
begin
  edtName.Enabled := true;
  edtSurname.Enabled := true;
  edtSalary.Enabled := true;
  edtCommission.Enabled := true;
  showMessage('Press the Edit button the edit this Employee.');
end;

procedure TfrmEditEmployee.Button1Click(Sender: TObject);
begin
  if find then
  begin
    display();
    open();
  end
  else
    ShowMessage('There is no employee with that Password in the system.');
end;

procedure TfrmEditEmployee.Button2Click(Sender: TObject);
begin
  edit();
  DataModule2.connect;
  close();
end;

procedure TfrmEditEmployee.close;
begin
    MessageDlg('Thank You The Employee Record Has Been Successfully Been Edited', mtInformation, [mbOk],0);
    edtPassword.Text := '';
    edtPassword.SetFocus;
    edtName.Text := '';
    edtSurname.Text := '';
    edtSalary.Text := '';
    edtCommission.Text := '';
end;

procedure TfrmEditEmployee.edit;
begin
  DataModule2.tbEmployee.Edit;
  DataModule2.tbEmployeeNames.Value := edtName.Text;
  DataModule2.tbEmployeeSurname.Value := edtSurname.Text;
  DataModule2.tbEmployeeSalary.Value := StrToFloat(edtSalary.Text);
  DataModule2.tbEmployeeCommission.Value := StrToFloat(edtCommission.Text);
  DataModule2.tbEmployee.Post;
end;

end.
