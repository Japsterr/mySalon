unit addStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, DB, StdCtrls, Spin, Buttons, pngimage, ExtCtrls;

type
  TfrmAddStock = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    Button1: TButton;
    Label3: TLabel;
    lblInStock: TLabel;
    Label4: TLabel;
    edtStock: TSpinEdit;
    Label5: TLabel;
    btnAdd: TButton;
    BitBtn1: TBitBtn;
    edtName: TComboBox;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fill;
    function findName: Boolean;
    procedure display();
    procedure open();
    procedure close();
    procedure addStock();
  end;

var
  frmAddStock: TfrmAddStock;

implementation

uses data;

{$R *.dfm}

procedure TfrmAddStock.fill;
begin
  DataModule2.tbProduct.First;

  while not(DataModule2.tbProduct.Eof) and (DataModule2.tbProductActive.Value = true) do
  begin
    edtName.Items.Add(DataModule2.tbProductNames.Value);
    DataModule2.tbProduct.Next;
  end;
end;

function TfrmAddStock.findName;
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

procedure TfrmAddStock.display;
begin
  lblInStock.Caption := IntToStr(DataModule2.tbProductStock.Value);
end;

procedure TfrmAddStock.open;
begin
  btnAdd.Enabled := True;
  edtStock.Enabled := True;
  showMessage('Enter the amount of stock added and press the Add Stock button.');
end;

procedure TfrmAddStock.Button1Click(Sender: TObject);
begin
  if findName then
  begin
    open();
    display();
  end;
end;

procedure TfrmAddStock.btnAddClick(Sender: TObject);
begin
  addStock();
  DataModule2.connect;
  close();
end;

procedure TfrmAddStock.close;
begin
  MessageDlg('Thank You The Stock Has Been Added Successfully',mtInformation,[mbOk],0);
  lblInStock.Caption := '0';
  edtName.Text := 'Select Product';
  edtStock.Value := 0;
  btnAdd.Enabled := false;
end;

procedure TfrmAddStock.addStock;
var total: Integer;
begin
  DataModule2.tbProduct.Edit;
  total := edtStock.Value + DataModule2.tbProductStock.Value;
  DataModule2.tbProductStock.Value := total;
  DataModule2.tbProduct.Post;
end;

procedure TfrmAddStock.FormCreate(Sender: TObject);
begin
  fill();
end;

end.
