unit confirmDeleteProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Buttons;

type
  TfrmConfirmProduct = class(TForm)
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfirmProduct: TfrmConfirmProduct;

implementation

uses data;

{$R *.dfm}

procedure TfrmConfirmProduct.BitBtn1Click(Sender: TObject);
begin
  DataModule2.tbProduct.Edit;
  DataModule2.tbProductNames.Value := '';
  DataModule2.tbProductCost.Value := 0.00;
  DataModule2.tbProductPrice.Value := 0.00;
  DataModule2.tbProductStock.Value := 0;
  DataModule2.tbProductActive.Value := false;
end;

end.
