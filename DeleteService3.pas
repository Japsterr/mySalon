unit DeleteService3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmDeleteService3 = class(TForm)
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
  frmDeleteService3: TfrmDeleteService3;

implementation

uses data, ConfirmDeleteService3;

{$R *.dfm}

procedure TfrmDeleteService3.open;
begin
  btnDelete.Enabled := True;
  ShowMessage('Press the Delete Button to delete this Service.');
end;


procedure TfrmDeleteService3.fill;
begin
DataModule2.tbServiceThree.First;
  while not(DataModule2.tbServiceThree.Eof) do
  begin
  if DataModule2.tbServiceThreeActive.Value = True then
    edtNames.Items.Add(DataModule2.tbServiceThreeNames.Value);

    DataModule2.tbServiceThree.Next;
  end;

end;


function TfrmDeleteService3.find;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceThree.Locate('Names', service, SearchOptions);
  find := found;
end;

procedure TfrmDeleteService3.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmDeleteService3.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this Service?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
  DataModule2.tbServiceThree.Delete;
  MessageDlg('Thank You Service was Successfully Deleted', mtInformation, [mbOk], 0);
  clear;
  DataModule2.connect;
  end;
end;

procedure TfrmDeleteService3.Button1Click(Sender: TObject);
begin
    if find then
  begin
    display();
    open();
  end
  else
    ShowMessage('The Service was not found please re-enter service');

end;

procedure TfrmDeleteService3.display;
begin
  lblName.Caption := 'Press the Delete button to delete this service';
  lblPrice.Caption := FloatToStr(DataModule2.tbServiceThreePrice.Value);
end;

procedure TfrmDeleteService3.clear;
begin
  edtNames.Text := 'select';
  lblName.Caption := '';
  lblPrice.Caption := '';
end;


end.
