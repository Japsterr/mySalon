unit ConfirmDeleteServiceCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmDeleteServiceCategory = class(TForm)
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
  frmConfirmDeleteServiceCategory: TfrmConfirmDeleteServiceCategory;

implementation

uses DeleteServiceCategory, data;

{$R *.dfm}

procedure TfrmConfirmDeleteServiceCategory.closeForms;
begin
  frmConfirmDeleteServiceCategory.Close;
  frmDeleteServiceCategory.Close;
end;

procedure TfrmConfirmDeleteServiceCategory.delete;
begin
  DataModule2.tbServiceIndex.Edit;
  DataModule2.tbServiceIndexNames.Value := '';
  DataModule2.tbServiceIndexActive.Value := False;
  DataModule2.tbServiceIndex.Post;

end;


procedure TfrmConfirmDeleteServiceCategory.BitBtn1Click(Sender: TObject);
begin
  delete();
  closeForms();
end;

end.
