unit DeleteService8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmDeleteService8 = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
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
  frmDeleteService8: TfrmDeleteService8;

implementation

uses data, ConfirmDeleteService8;

{$R *.dfm}

procedure TfrmDeleteService8.fill;
begin
DataModule2.tbServiceEight.First;
  while not(DataModule2.tbServiceEight.Eof) do
  begin
  if  (DataModule2.tbServiceEightActive.Value = True) then
    edtNames.Items.Add(DataModule2.tbServiceEightNames.Value);

    DataModule2.tbServiceEight.Next;
  end;

end;

procedure TfrmDeleteService8.open;
begin
  btnDelete.Enabled := True;
  ShowMessage('Press the Delete Button to delete this Service.');
end;

procedure TfrmDeleteService8.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this Service?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
  DataModule2.tbServiceEight.Delete;
  MessageDlg('Thank You Service was Successfully Deleted', mtInformation, [mbOk], 0);
  clear;
  DataModule2.connect;
  end;
end;

procedure TfrmDeleteService8.Button1Click(Sender: TObject);
begin
  if find then
  begin
    display();
    open();
  end
  else
    ShowMessage('The Service was not found please re-enter service');

end;

procedure TfrmDeleteService8.display;
begin
  lblName.Caption := 'Press the Delete button to delete this service';
  lblPrice.Caption := FloatToStr(DataModule2.tbServiceEightPrice.Value);
end;


function TfrmDeleteService8.find;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceEight.Locate('Names', service, SearchOptions);
  find := found;
end;



procedure TfrmDeleteService8.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmDeleteService8.clear;
begin
  edtNames.Text := 'select';
  lblName.Caption := '';
  lblPrice.Caption := '';
end;

end.
