unit ConfirmDeleteService10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmDeleteService10 = class(TForm)
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
  frmConfirmDeleteService10: TfrmConfirmDeleteService10;

implementation

uses DeleteService10, data;

{$R *.dfm}

procedure TfrmConfirmDeleteService10.BitBtn1Click(Sender: TObject);
begin
  delete();
  closeForms();

end;

procedure TfrmConfirmDeleteService10.closeForms;
begin
  frmConfirmDeleteService10.Close;
  frmDeleteService10.Close;
end;

procedure TfrmConfirmDeleteService10.delete;
begin
  DataModule2.tbServiceTen.Edit;
  DataModule2.tbServiceTenNames.Value := '';
  DataModule2.tbServiceTenPrice.Value := 0;
  DataModule2.tbServiceTenActive.Value := False;
  DataModule2.tbServiceTen.Post;

end;


end.
