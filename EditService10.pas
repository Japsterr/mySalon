unit EditService10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmEditService10 = class(TForm)
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
  frmEditService10: TfrmEditService10;

implementation

uses data;

{$R *.dfm}

procedure TfrmEditService10.btnEditClick(Sender: TObject);
begin
  editService();
  DataModule2.connect;
  close();

end;

procedure TfrmEditService10.Button1Click(Sender: TObject);
begin
  if findService then
  begin
    open();
    display();
  end
  else
    ShowMessage('There is no employee with that name Please try again');

end;

procedure TfrmEditService10.close;
begin
  MessageDlg('Thank You The Service Has Been Successfully Been Edited', mtInformation, [mbOk],0);
  edtPrice.Enabled := False;
  edtPrice.Text := '0';
  edtName.Enabled := False;
  edtName.Text := '';
  btnEdit.Enabled := False;
  edtNames.Text := '';
end;

procedure TfrmEditService10.fill;
begin
DataModule2.tbServiceTen.First;
     while not(DataModule2.tbServiceTen.Eof) do
     begin
     if DataModule2.tbServiceTenActive.Value = True then
        edtNames.Items.Add(DataModule2.tbServiceTenNames.Value);

       DataModule2.tbServiceTen.Next;
     end;

end;

procedure TfrmEditService10.open;
begin
    edtPrice.Enabled := True;
    edtName.Enabled := True;
    edtName.SetFocus;
    btnEdit.Enabled := True;
    showMessage('Press the Edit button to edit this Service.');
end;

procedure TfrmEditService10.display;
begin
  edtName.Text := DataModule2.tbServiceTenNames.Value;
  edtPrice.Text := FloatToStr(DataModule2.tbServiceTenPrice.Value);
end;

procedure TfrmEditService10.editService;
begin
  DataModule2.tbServiceTen.Edit;
  DataModule2.tbServiceTenNames.Value := edtName.Text;
  DataModule2.tbServiceTenPrice.Value := StrToFloat(edtPrice.Text);
  DataModule2.tbServiceTen.Post;
end;


function TfrmEditService10.findService;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceTen.Locate('Names', service, SearchOptions);
  findService := found;
end;



procedure TfrmEditService10.FormCreate(Sender: TObject);
begin
  fill();
end;

end.
