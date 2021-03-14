unit DeleteService7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmDeleteService7 = class(TForm)
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
  frmDeleteService7: TfrmDeleteService7;

implementation

uses data, ConfirmDeleteService7;

{$R *.dfm}

procedure TfrmDeleteService7.fill;
begin
DataModule2.tbServiceSeven.First;
  while not(DataModule2.tbServiceSeven.Eof) do
  begin
  if  (DataModule2.tbServiceSevenActive.Value = True) then
    edtNames.Items.Add(DataModule2.tbServiceSevenNames.Value);

    DataModule2.tbServiceSeven.Next;
  end;

end;

procedure TfrmDeleteService7.open;
begin
  btnDelete.Enabled := True;
end;

procedure TfrmDeleteService7.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this Service?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
  DataModule2.tbServiceSeven.Delete;
  MessageDlg('Thank You Service was Successfully Deleted', mtInformation, [mbOk], 0);
  clear;
  DataModule2.connect;
  end;
end;

procedure TfrmDeleteService7.Button1Click(Sender: TObject);
begin
  if find then
  begin
    display();
    open();
  end
  else
    ShowMessage('The Service was not found please re-enter service');

end;

procedure TfrmDeleteService7.display;
begin
  lblName.Caption := 'Press the Delete button to delete this service';
  lblPrice.Caption := FloatToStr(DataModule2.tbServiceSevenPrice.Value);
end;


function TfrmDeleteService7.find;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceSeven.Locate('Names', service, SearchOptions);
  find := found;
end;


procedure TfrmDeleteService7.FormCreate(Sender: TObject);
begin

  fill();
end;

procedure TfrmDeleteService7.clear;
begin
  edtNames.Text := 'select';
  lblName.Caption := '';
  lblPrice.Caption := '';
end;

end.
