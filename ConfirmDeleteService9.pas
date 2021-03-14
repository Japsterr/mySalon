unit ConfirmDeleteService9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmDeleteService9 = class(TForm)
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
  frmConfirmDeleteService9: TfrmConfirmDeleteService9;

implementation

uses DeleteService9, data;

{$R *.dfm}

procedure TfrmConfirmDeleteService9.BitBtn1Click(Sender: TObject);
begin
  delete();
  closeForms();

end;

procedure TfrmConfirmDeleteService9.closeForms;
begin
  frmConfirmDeleteService9.Close;
  frmDeleteService9.Close;
end;

procedure TfrmConfirmDeleteService9.delete;
begin
  DataModule2.tbServiceNine.Edit;
  DataModule2.tbServiceNineNames.Value := '';
  DataModule2.tbServiceNinePrice.Value := 0;
  DataModule2.tbServiceNineActive.Value := False;
  DataModule2.tbServiceNine.Post;

end;


end.
