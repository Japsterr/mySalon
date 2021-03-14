unit DeleteService5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmDeleteService5 = class(TForm)
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
  frmDeleteService5: TfrmDeleteService5;

implementation

uses deleteEmployee, data, ConfirmDeleteService5;

{$R *.dfm}

procedure TfrmDeleteService5.fill;
begin
DataModule2.tbServiceFive.First;
  while not(DataModule2.tbServiceFive.Eof) do
  begin
  if  (DataModule2.tbServiceFiveActive.Value = True) then
    edtNames.Items.Add(DataModule2.tbServiceFiveNames.Value);

    DataModule2.tbServiceFive.Next;
  end;

end;

procedure TfrmDeleteService5.open;
begin
  btnDelete.Enabled := True;
  ShowMessage('Press the Delete Button to delete this Service.');
end;

procedure TfrmDeleteService5.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this Service?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
  DataModule2.tbServiceFive.Delete;
  MessageDlg('Thank You Service was Successfully Deleted', mtInformation, [mbOk], 0);
  clear;
  DataModule2.connect;
  end;
end;

procedure TfrmDeleteService5.Button1Click(Sender: TObject);
begin
  if find then
  begin
    display();
    open();
  end
  else
    ShowMessage('The Service was not found please re-enter service');

end;

procedure TfrmDeleteService5.display;
begin
  lblName.Caption := 'Press the Delete button to delete this service';
  lblPrice.Caption := FloatToStr(DataModule2.tbServiceFivePrice.Value);
end;


function TfrmDeleteService5.find;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceFive.Locate('Names', service, SearchOptions);
  find := found;
end;


procedure TfrmDeleteService5.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmDeleteService5.clear;
begin
  edtNames.Text := 'select';
  lblName.Caption := '';
  lblPrice.Caption := '';
end;

end.
