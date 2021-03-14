unit ConfirmDeleteService3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmDeleteService3 = class(TForm)
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
  frmConfirmDeleteService3: TfrmConfirmDeleteService3;

implementation

uses data, DeleteService3;

{$R *.dfm}

procedure TfrmConfirmDeleteService3.closeForms;
begin
  frmConfirmDeleteService3.Close;
  frmDeleteService3.Close;
end;

procedure TfrmConfirmDeleteService3.delete;
begin
  DataModule2.tbServiceThree.Edit;
  DataModule2.tbServiceThreeNames.Value := '';
  DataModule2.tbServiceThreePrice.Value := 0;
  DataModule2.tbServiceThreeActive.Value := False;
  DataModule2.tbServiceThree.Post;

end;


procedure TfrmConfirmDeleteService3.BitBtn1Click(Sender: TObject);
begin
  delete();
  closeForms();

end;

end.
