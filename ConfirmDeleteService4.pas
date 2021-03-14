unit ConfirmDeleteService4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmDeleteService4 = class(TForm)
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
  frmConfirmDeleteService4: TfrmConfirmDeleteService4;

implementation

uses data, DeleteService4;

{$R *.dfm}

procedure TfrmConfirmDeleteService4.BitBtn1Click(Sender: TObject);
begin
  delete();
  closeForms();

end;

procedure TfrmConfirmDeleteService4.closeForms;
begin
  frmConfirmDeleteService4.Close;
  frmDeleteService4.Close;
end;

procedure TfrmConfirmDeleteService4.delete;
begin
  DataModule2.tbServiceFour.Edit;
  DataModule2.tbServiceFourNames.Value := '';
  DataModule2.tbServiceFourPrice.Value := 0;
  DataModule2.tbServiceFourActive.Value := False;
  DataModule2.tbServiceFour.Post;

end;


end.
