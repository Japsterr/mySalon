unit EditService2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, StdCtrls;

type
  TfrmEditService2 = class(TForm)
    Label9: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    edtPrice: TEdit;
    btnEdit: TButton;
    BitBtn1: TBitBtn;
    edtNames: TComboBox;
    edtName: TEdit;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findService : Boolean;
    procedure editService();
    procedure display();
    procedure open();
    procedure fill();
    procedure close;
  end;

var
  frmEditService2: TfrmEditService2;

implementation

uses data;

{$R *.dfm}

function TfrmEditService2.findService;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceTwo.Locate('Names', service, SearchOptions);
  findService := found;
end;


procedure TfrmEditService2.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmEditService2.editService;
begin
  DataModule2.tbServiceTwo.Edit;
  DataModule2.tbServiceTwoNames.Value := edtName.Text;
  DataModule2.tbServiceTwoPrice.Value := StrToFloat(edtPrice.Text);
  DataModule2.tbServiceTwo.Post;
end;


procedure TfrmEditService2.display;
begin
  edtName.Text := DataModule2.tbServiceTwoNames.Value;
  edtPrice.Text := FloatToStr(DataModule2.tbServiceTwoPrice.Value);
end;


procedure TfrmEditService2.open;
begin
    edtPrice.Enabled := True;
    edtName.Enabled := True;
    edtName.SetFocus;
    btnEdit.Enabled := True;
    showMessage('Press the Edit button to edit this Service.');
end;


procedure TfrmEditService2.fill;
begin
DataModule2.tbServiceTwo.First;
     while not(DataModule2.tbServiceTwo.Eof) do
     begin
       if DataModule2.tbServiceTwoActive.Value = True then
         edtNames.Items.Add(DataModule2.tbServiceTwoNames.Value);

       DataModule2.tbServiceTwo.Next;
     end;

end;


procedure TfrmEditService2.close;
begin
  MessageDlg('Thank You The Service Has Been Successfully Been Edited', mtInformation, [mbOk],0);
  edtPrice.Enabled := False;
  edtPrice.Text := '0';
  edtName.Enabled := False;
  edtName.Text := '';
  btnEdit.Enabled := False;
  edtNames.Text := '';
end;


procedure TfrmEditService2.btnEditClick(Sender: TObject);
begin
  editService();
  DataModule2.connect;
  close();

end;

procedure TfrmEditService2.Button1Click(Sender: TObject);
begin
    if findService then
  begin
    open();
    display();
  end
  else
    ShowMessage('There is no employee with that name Please try again');

end;

end.
