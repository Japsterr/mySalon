unit ConfirmDeleteService7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmDeleteService7 = class(TForm)
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
  frmConfirmDeleteService7: TfrmConfirmDeleteService7;

implementation

uses data, DeleteService7;

{$R *.dfm}

procedure TfrmConfirmDeleteService7.closeForms;
begin
  frmConfirmDeleteService7.Close;
  frmDeleteService7.Close;
end;

procedure TfrmConfirmDeleteService7.delete;
begin
  DataModule2.tbServiceSeven.Edit;
  DataModule2.tbServiceSevenNames.Value := '';
  DataModule2.tbServiceSevenPrice.Value := 0;
  DataModule2.tbServiceSevenActive.Value := False;
  DataModule2.tbServiceSeven.Post;

end;


procedure TfrmConfirmDeleteService7.BitBtn1Click(Sender: TObject);
begin
  delete();
  closeForms();
end;

end.
