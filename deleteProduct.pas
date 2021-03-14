unit deleteProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, pngimage, ExtCtrls;

type
  TfrmDeleteProduct = class(TForm)
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label7: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    lblCost: TLabel;
    lblSell: TLabel;
    lblStock: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    btnDelete: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    edtName: TComboBox;
    Image1: TImage;
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findName: Boolean;
    procedure fill();
    procedure display();
  end;

var
  frmDeleteProduct: TfrmDeleteProduct;

implementation

uses data, confirmDeleteProduct;

{$R *.dfm}

function TfrmDeleteProduct.findName;
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

procedure TfrmDeleteProduct.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmDeleteProduct.fill;
begin
  DataModule2.tbProduct.First;

  while not(DataModule2.tbProduct.Eof) and (DataModule2.tbProductActive.Value = true) do
  begin
    edtName.Items.Add(DataModule2.tbProductNames.Value);
    DataModule2.tbProduct.Next;
  end;
end;

procedure TfrmDeleteProduct.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this product?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  DataModule2.tbProduct.Delete;
  DataModule2.connect;
  MessageDlg('The product has successfully been deleted.', mtInformation, [mbOk], 0);
  edtName.Clear;
  fill;
  end;
end;

procedure TfrmDeleteProduct.Button1Click(Sender: TObject);
begin
  if findName then
    display();
end;

procedure TfrmDeleteProduct.display;
begin
  lblCost.Caption := FloatToStr(DataModule2.tbProductCost.Value);
  lblSell.Caption := FloatToStr(DataModule2.tbProductPrice.Value);
  lblStock.Caption := IntToStr(DataModule2.tbProductStock.Value);
  btnDelete.Enabled := true;
  ShowMessage('Press the Delete Product button to delete this product.');
end;

end.
