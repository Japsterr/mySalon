unit businessInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmBusinessInfo = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblDate: TLabel;
    lblPassword: TLabel;
    lblOwnerName: TLabel;
    lblOwnerSurname: TLabel;
    lblSalonName: TLabel;
    lblTelephone: TLabel;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure display();
  end;

var
  frmBusinessInfo: TfrmBusinessInfo;

implementation

uses data;

{$R *.dfm}

procedure TfrmBusinessInfo.display;
begin
  lblPassword.Caption := DataModule2.tbAdminID.Value;
  lblOwnerName.Caption := DataModule2.tbAdminNames.Value;
  lblOwnerSurname.Caption := DataModule2.tbAdminSurname.Value;
  lblSalonName.Caption := DataModule2.tbAdminBus_Name.Value;
  lblTelephone.Caption := DataModule2.tbAdminTelephone.Value;
  lblDate.Caption := DateToStr(DataModule2.tbAdminDate_Due.Value);
end;

procedure TfrmBusinessInfo.FormCreate(Sender: TObject);
begin
  display();
end;

end.
