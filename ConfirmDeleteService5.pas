unit ConfirmDeleteService5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmDeleteService5 = class(TForm)
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
  frmConfirmDeleteService5: TfrmConfirmDeleteService5;

implementation

uses data, DeleteService5;

{$R *.dfm}

procedure TfrmConfirmDeleteService5.BitBtn1Click(Sender: TObject);
begin
  delete();
  closeForms();

end;

procedure TfrmConfirmDeleteService5.closeForms;
begin
  frmConfirmDeleteService5.Close;
  frmDeleteService5.Close;
end;

procedure TfrmConfirmDeleteService5.delete;
begin
  DataModule2.tbServiceFive.Edit;
  DataModule2.tbServiceFiveNames.Value := '';
  DataModule2.tbServiceFivePrice.Value := 0;
  DataModule2.tbServiceFiveActive.Value := False;
  DataModule2.tbServiceFive.Post;

end;


end.
