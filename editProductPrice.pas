unit editProductPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, pngimage, ExtCtrls;

type
  TfrmEditProductPrice = class(TForm)
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label5: TLabel;
    edtSell: TEdit;
    edtCost: TEdit;
    Label8: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    btnEdit: TButton;
    BitBtn1: TBitBtn;
    edtName: TComboBox;
    Label3: TLabel;
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
    procedure fill();
    procedure edit();
  end;

var
  frmEditProductPrice: TfrmEditProductPrice;

implementation

uses data;

{$R *.dfm}

function TfrmEditProductPrice.findName;
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

procedure TfrmEditProductPrice.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmEditProductPrice.display;
begin
  edtCost.Text := FloatToStr(DataModule2.tbProductCost.Value);
  edtSell.Text := FloatToStr(DataModule2.tbProductPrice.Value);
end;

procedure TfrmEditProductPrice.open;
begin
  edtCost.Enabled := true;
  edtSell.Enabled := true;
  btnEdit.Enabled := true;
  showMessage('Press the Edit button to Edit the Prices.');
end;

procedure TfrmEditProductPrice.btnEditClick(Sender: TObject);
begin
  edit();
  DataModule2.connect;
  close();
end;

procedure TfrmEditProductPrice.Button1Click(Sender: TObject);
begin
  if findName then
  begin
    open();
    display();
  end;
end;

procedure TfrmEditProductPrice.close;
begin
  MessageDlg('Thank You The Price Has Been Successfully Been Edited', mtInformation, [mbOk],0);
  edtCost.Clear;
  edtName.Text := 'Select Product';
  edtCost.Enabled := false;
  edtSell.Clear;
  edtSell.Enabled := false;
  btnEdit.Enabled := false;
end;

procedure TfrmEditProductPrice.fill;
begin
  DataModule2.tbProduct.First;

  while not(DataModule2.tbProduct.Eof) and (DataModule2.tbProductActive.Value = true) do
  begin
    edtName.Items.Add(DataModule2.tbProductNames.Value);
    DataModule2.tbProduct.Next;
  end;
end;

procedure TfrmEditProductPrice.edit;
begin
  DataModule2.tbProduct.Edit;
  DataModule2.tbProductCost.Value := StrToFloat(edtCost.Text);
  DataModule2.tbProductPrice.Value := StrToFloat(edtSell.Text);
  DataModule2.tbProduct.Post;
end;

end.
