unit ConfirmDeleteService2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmDeleteService2 = class(TForm)
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
  frmConfirmDeleteService2: TfrmConfirmDeleteService2;

implementation

uses DeleteService2, data;

{$R *.dfm}

procedure TfrmConfirmDeleteService2.delete;
begin
  DataModule2.tbServiceTwo.Edit;
  DataModule2.tbServiceTwoNames.Value := '';
  DataModule2.tbServiceTwoPrice.Value := 0;
  DataModule2.tbServiceTwoActive.Value := False;
  DataModule2.tbServiceTwo.Post;

end;


procedure TfrmConfirmDeleteService2.BitBtn1Click(Sender: TObject);
begin
  delete();
  closeForms();

end;

procedure TfrmConfirmDeleteService2.closeForms;
begin
  frmConfirmDeleteService2.Close;
  frmDeleteService2.Close;
end;


end.
