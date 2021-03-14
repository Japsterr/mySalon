unit ConfirmDeleteService6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmDeleteService6 = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure delete;
    procedure closeForms;

  end;

var
  frmConfirmDeleteService6: TfrmConfirmDeleteService6;

implementation

uses data, DeleteService6;

{$R *.dfm}

procedure TfrmConfirmDeleteService6.closeForms;
begin
  frmConfirmDeleteService6.Close;
  frmDeleteService6.Close;
end;

procedure TfrmConfirmDeleteService6.delete;
begin
  DataModule2.tbServiceSix.Edit;
  DataModule2.tbServiceSixNames.Value := '';
  DataModule2.tbServiceSixPrice.Value := 0;
  DataModule2.tbServiceSixActive.Value := False;
  DataModule2.tbServiceSix.Post;

end;


procedure TfrmConfirmDeleteService6.BitBtn1Click(Sender: TObject);
begin
  delete();
  closeForms();

end;

end.
