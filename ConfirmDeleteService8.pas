unit ConfirmDeleteService8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmDeleteService8 = class(TForm)
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
  frmConfirmDeleteService8: TfrmConfirmDeleteService8;

implementation

uses data, DeleteService8;

{$R *.dfm}

procedure TfrmConfirmDeleteService8.closeForms;
begin
  frmConfirmDeleteService8.Close;
  frmDeleteService8.Close;
end;

procedure TfrmConfirmDeleteService8.delete;
begin
  DataModule2.tbServiceEight.Edit;
  DataModule2.tbServiceEightNames.Value := '';
  DataModule2.tbServiceEightPrice.Value := 0;
  DataModule2.tbServiceEightActive.Value := False;
  DataModule2.tbServiceEight.Post;

end;



procedure TfrmConfirmDeleteService8.BitBtn1Click(Sender: TObject);
begin
  delete();
  closeForms();

end;

end.
