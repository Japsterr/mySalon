unit DeleteService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, StdCtrls;

type
  TfrmDeleteService = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblName: TLabel;
    lblPrice: TLabel;
    Button1: TButton;
    btnDelete: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    edtNames: TComboBox;
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
  frmDeleteService: TfrmDeleteService;

implementation

uses data, ConfirmDeleteService;

{$R *.dfm}

procedure TfrmDeleteService.fill;
begin
DataModule2.tbServiceOne.First;
  while not(DataModule2.tbServiceOne.Eof) do
  begin
  if  (DataModule2.tbServiceOneActive.Value = True) then
    edtNames.Items.Add(DataModule2.tbServiceOneNames.Value);

    DataModule2.tbServiceOne.Next;
  end;

end;

procedure TfrmDeleteService.open;
begin
  btnDelete.Enabled := True;
  ShowMessage('Press the Delete Button to delete this Service.');
end;

procedure TfrmDeleteService.display;
begin
  lblName.Caption := 'Press the Delete button to delete this service';
  lblPrice.Caption := FloatToStr(DataModule2.tbServiceOnePrice.Value);
end;

function TfrmDeleteService.find;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceOne.Locate('Names', service, SearchOptions);
  find := found;
end;

procedure TfrmDeleteService.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmDeleteService.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this Service?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
  DataModule2.tbServiceOne.Delete;
  MessageDlg('Thank You Service was Successfully Deleted', mtInformation, [mbOk], 0);
  clear();
  DataModule2.connect;
  end;
end;

procedure TfrmDeleteService.Button1Click(Sender: TObject);
begin
  if find then
  begin
    display();
    open();
  end
  else
    ShowMessage('The Service category was not found please re-enter service category');
end;

procedure TfrmDeleteService.clear;
begin
  edtNames.Text := 'select';
  lblName.Caption := '';
  lblPrice.Caption := '';
end;

end.
