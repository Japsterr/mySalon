unit DeleteService2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmDeleteService2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblName: TLabel;
    lblPrice: TLabel;
    Button1: TButton;
    btnDelete: TButton;
    BitBtn1: TBitBtn;
    edtNames: TComboBox;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function find : Boolean;
    procedure display();
    procedure open();
    procedure fill();
    procedure clear();
  end;

var
  frmDeleteService2: TfrmDeleteService2;

implementation

uses data, ConfirmDeleteService2;

{$R *.dfm}

function TfrmDeleteService2.find;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceTwo.Locate('Names', service, SearchOptions);
  find := found;
end;


procedure TfrmDeleteService2.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmDeleteService2.open;
begin
  btnDelete.Enabled := True;
  ShowMessage('Press the Delete Button to delete this Service.');
end;

procedure TfrmDeleteService2.display;
begin
  lblName.Caption := 'Press the Delete button to delete this service';
  lblPrice.Caption := FloatToStr(DataModule2.tbServiceTwoPrice.Value);
end;


procedure TfrmDeleteService2.fill;
begin
DataModule2.tbServiceTwo.First;
  while not(DataModule2.tbServiceTwo.Eof) do
  begin
  if DataModule2.tbServiceTwoActive.Value = True then
    edtNames.Items.Add(DataModule2.tbServiceTwoNames.Value);

    DataModule2.tbServiceTwo.Next;
  end;

end;


procedure TfrmDeleteService2.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this Service?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
  DataModule2.tbServiceTwo.Delete;
  MessageDlg('Thank You Service was Successfully Deleted', mtInformation, [mbOk], 0);
  clear();
  DataModule2.connect;
  end;
end;

procedure TfrmDeleteService2.Button1Click(Sender: TObject);
begin
    if find then
  begin
    display();
    open();
  end
  else
    ShowMessage('The Service was not found please re-enter service');
end;

procedure TfrmDeleteService2.clear;
begin
  edtNames.Text := 'select';
  lblName.Caption := '';
  lblPrice.Caption := '';
end;

end.
