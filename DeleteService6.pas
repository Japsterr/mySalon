unit DeleteService6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmDeleteService6 = class(TForm)
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
    procedure FormCreate(Sender: TObject);
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
  frmDeleteService6: TfrmDeleteService6;

implementation

uses data, ConfirmDeleteService6;

{$R *.dfm}

procedure TfrmDeleteService6.fill;
begin
DataModule2.tbServiceSix.First;
  while not(DataModule2.tbServiceSix.Eof) do
  begin
  if  (DataModule2.tbServiceSixActive.Value = True) then
    edtNames.Items.Add(DataModule2.tbServiceSixNames.Value);

    DataModule2.tbServiceSix.Next;
  end;

end;

procedure TfrmDeleteService6.open;
begin
  btnDelete.Enabled := True;
  ShowMessage('Press the Delete Button to delete this Service.');
end;

procedure TfrmDeleteService6.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this Service?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
  DataModule2.tbServiceSix.Delete;
  MessageDlg('Thank You Service was Successfully Deleted', mtInformation, [mbOk], 0);
  clear;
  DataModule2.connect;
  end;
end;

procedure TfrmDeleteService6.Button1Click(Sender: TObject);
begin
  if find then
  begin
    display();
    open();
  end
  else
    ShowMessage('The Service was not found please re-enter service');


end;

procedure TfrmDeleteService6.display;
begin
  lblName.Caption := 'Press the Delete button to delete this service';
  lblPrice.Caption := FloatToStr(DataModule2.tbServiceSixPrice.Value);
end;



function TfrmDeleteService6.find;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceSix.Locate('Names', service, SearchOptions);
  find := found;
end;


procedure TfrmDeleteService6.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmDeleteService6.clear;
begin
  edtNames.Text := 'select';
  lblName.Caption := '';
  lblPrice.Caption := '';
end;

end.
