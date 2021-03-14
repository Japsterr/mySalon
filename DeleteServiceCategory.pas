unit DeleteServiceCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, pngimage, ExtCtrls;

type
  TfrmDeleteServiceCategory = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblName: TLabel;
    Button1: TButton;
    btnDelete: TButton;
    BitBtn1: TBitBtn;
    edtNames: TComboBox;
    DataSource1: TDataSource;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function find : Boolean;
    procedure fill;
    procedure open;
    procedure display;
    procedure delete;
    procedure clearServices;
    procedure clear;

  end;

var
  frmDeleteServiceCategory: TfrmDeleteServiceCategory;

implementation

uses data, ConfirmDeleteServiceCategory;

{$R *.dfm}



procedure TfrmDeleteServiceCategory.btnDeleteClick(Sender: TObject);
begin
  if MessageDLg('Are you sure you want to delete this Service Category?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    clearServices;
    delete;
    MessageDlg('Thank You The Service Category was Successfully Delete',mtInformation,[mbOk],0);
    clear;
    DataModule2.connect;
  end;
end;

procedure TfrmDeleteServiceCategory.Button1Click(Sender: TObject);
begin
  if find then
  begin
    display();
    open();
  end
  else
    ShowMessage('The Service category was not found please re-enter service category');

end;

procedure TfrmDeleteServiceCategory.display;
begin
  lblName.Caption := 'You can press the Delete button to delete this Service Category';
end;


procedure TfrmDeleteServiceCategory.open;
begin
  btnDelete.Enabled := True;
  ShowMessage('Press the Delete button ro delete this Service Category.');
end;


function TfrmDeleteServiceCategory.find;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceIndex.Locate('Names', service, SearchOptions);
  find := found;
end;


procedure TfrmDeleteServiceCategory.fill;
begin
DataModule2.tbServiceIndex.First;
  while not(DataModule2.tbServiceIndex.Eof) do
  begin
  if  (DataModule2.tbServiceIndexActive.Value = True) then
    edtNames.Items.Add(DataModule2.tbServiceIndexNames.Value);

    DataModule2.tbServiceIndex.Next;
  end;

end;


procedure TfrmDeleteServiceCategory.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmDeleteServiceCategory.delete;
begin
  DataModule2.tbServiceIndex.Edit;
  DataModule2.tbServiceIndexNames.Value := '';
  DataModule2.tbServiceIndexActive.Value := False;
  DataModule2.tbServiceIndex.Post;
end;

procedure TfrmDeleteServiceCategory.clearServices;
var ID: String;
begin
  ID := DataModule2.tbServiceIndexID.Value;
  DataModule2.clearTable(ID);
end;

procedure TfrmDeleteServiceCategory.clear;
begin
  lblName.Caption := '';
  edtNames.Text := 'Select';
end;

end.
