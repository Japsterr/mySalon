unit confirmDeleteEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmConfirmEmployee = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfirmEmployee: TfrmConfirmEmployee;

implementation

uses data;

{$R *.dfm}

procedure TfrmConfirmEmployee.BitBtn1Click(Sender: TObject);
begin
  DataModule2.tbEmployee.Delete;

end;

end.
