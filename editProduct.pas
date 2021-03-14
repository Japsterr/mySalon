unit editProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Spin, StdCtrls, DB, pngimage, ExtCtrls;

type
  TfrmEditProduct = class(TForm)
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtCost: TEdit;
    edtSell: TEdit;
    Label3: TLabel;
    Label8: TLabel;
    edtStock: TSpinEdit;
    btnEdit: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    edtName: TComboBox;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findName: Boolean;
    procedure display();
    procedure open();
    procedure close();
    procedure edit();
    procedure fill();
  end;

var
  frmEditProduct: TfrmEditProduct;

implementation

uses data;

{$R *.dfm}

function TfrmEditProduct.findName;
var name : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
    number: Integer;
begin
  number := edtName.ItemIndex;
  name := edtName.Items[number];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbProduct.Locate('Names', name, SearchOptions);
  findName := found;
end;


procedure TfrmEditProduct.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmEditProduct.display;
begin
  edtCost.Text := FloatToStr(DataModule2.tbProductCost.Value);
  edtSell.Text := FloatToStr(DataModule2.tbProductPrice.Value);
  edtStock.Value := DataModule2.tbProductStock.Value;
end;

procedure TfrmEditProduct.open;
begin
  edtCost.Enabled := true;
  edtSell.Enabled := true;
  edtStock.Enabled := true;
  btnEdit.Enabled := true;
  showMessage('Press the Edit Product button to edit the product.');
end;

procedure TfrmEditProduct.btnEditClick(Sender: TObject);
begin
  edit();
  DataModule2.connect;
  close();
end;

procedure TfrmEditProduct.Button1Click(Sender: TObject);
begin
  if findName then
  begin
    open();
    display();
  end;
end;

procedure TfrmEditProduct.close;
begin
  MessageDlg('Thank You The Product Record Has Been Successfully Been Edited', mtInformation, [mbOk],0);
  edtName.Text := 'Select Product';
  edtCost.Clear;
  edtCost.Enabled := false;
  edtSell.Clear;
  edtSell.Enabled := false;
  edtStock.Clear;
  edtStock.Enabled := false;
  btnEdit.Enabled := false;
end;

procedure TfrmEditProduct.edit;
begin
  DataModule2.tbProduct.Edit;
  DataModule2.tbProductCost.Value := StrToFloat(edtCost.Text);
  DataModule2.tbProductPrice.Value := StrToFloat(edtSell.Text);
  DataModule2.tbProductStock.Value := edtStock.Value;
  DataModule2.tbProduct.Post;
end;

procedure TfrmEditProduct.fill;
begin
  DataModule2.tbProduct.First;

  while not(DataModule2.tbProduct.Eof) and (DataModule2.tbProductActive.Value = true) do
  begin
    edtName.Items.Add(DataModule2.tbProductNames.Value);
    DataModule2.tbProduct.Next;
  end;
end;

end.
