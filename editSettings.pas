unit editSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, StdCtrls;

type
  TfrmEditSettings = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblDate: TLabel;
    edtPassword: TEdit;
    edtOwnerName: TEdit;
    edtOwnerSurname: TEdit;
    edtSalonName: TEdit;
    edtTelephone: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure display();
    procedure edit();
  end;

var
  frmEditSettings: TfrmEditSettings;

implementation

uses data;

{$R *.dfm}

procedure TfrmEditSettings.Button1Click(Sender: TObject);
begin
  edit();
  DataModule2.connect;
  ShowMessage('You have successfully Edited your Business Information.');
  frmEditSettings.Close;
end;

procedure TfrmEditSettings.display;
begin
  edtPassword.Text := DataModule2.tbAdminID.Value;
  edtOwnerName.Text := DataModule2.tbAdminNames.Value;
  edtOwnerSurname.Text := DataModule2.tbAdminSurname.Value;
  edtSalonName.Text := DataModule2.tbAdminBus_Name.Value;
  edtTelephone.Text := DataModule2.tbAdminTelephone.Value;
  lblDate.Caption := DateToStr(DataModule2.tbAdminDate_Due.Value);
end;

procedure TfrmEditSettings.edit;
begin
  DataModule2.tbAdmin.Edit;
  DataModule2.tbAdminID.Value := edtPassword.Text;
  DataModule2.tbAdminNames.Value := edtOwnerName.Text;
  DataModule2.tbAdminSurname.Value := edtOwnerSurname.Text;
  DataModule2.tbAdminBus_Name.Value := edtSalonName.Text;
  DataModule2.tbAdminTelephone.Value := edtTelephone.Text;
  DataModule2.tbAdmin.Post;
end;

procedure TfrmEditSettings.FormCreate(Sender: TObject);
begin
  display();
end;

end.
