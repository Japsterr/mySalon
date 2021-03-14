unit ConfirmDeleteService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmDeleteService = class(TForm)
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
  frmConfirmDeleteService: TfrmConfirmDeleteService;

implementation

uses data, DeleteService;

{$R *.dfm}

procedure TfrmConfirmDeleteService.closeForms;
begin
  frmConfirmDeleteService.Close;
  frmDeleteService.Close;
end;

procedure TfrmConfirmDeleteService.delete;
begin
  DataModule2.tbServiceOne.Edit;
  DataModule2.tbServiceOneNames.Value := '';
  DataModule2.tbServiceOnePrice.Value := 0;
  DataModule2.tbServiceOneActive.Value := False;
  DataModule2.tbServiceOne.Post;

end;

procedure TfrmConfirmDeleteService.BitBtn1Click(Sender: TObject);
begin
  delete();
  closeForms();
end;

end.
