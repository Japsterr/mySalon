unit EditService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB;

type
  TfrmEditService = class(TForm)
    Label9: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Button1: TButton;
    edtPrice: TEdit;
    btnEdit: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    edtNames: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    edtName: TEdit;
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
  frmEditService: TfrmEditService;

implementation

uses data, addStock;

{$R *.dfm}

procedure TfrmEditService.close;
begin
  MessageDlg('Thank You The Service Has Been Successfully Been Edited', mtInformation, [mbOk],0);
  edtPrice.Enabled := False;
  edtPrice.Text := '0';
  edtName.Enabled := False;
  edtName.Text := '';
  btnEdit.Enabled := False;
  edtNames.Text := '';
end;

procedure TfrmEditService.fill;
begin
DataModule2.tbServiceOne.First;
     while not(DataModule2.tbServiceOne.Eof) do
     begin
     if DataModule2.tbServiceOneActive.Value = True then
        edtNames.Items.Add(DataModule2.tbServiceOneNames.Value);

       DataModule2.tbServiceOne.Next;
     end;

end;

procedure TfrmEditService.open;
begin
    edtPrice.Enabled := True;
    edtName.Enabled := True;
    edtName.SetFocus;
    btnEdit.Enabled := True;
    showMessage('Press the Edit button to edit this Service.');
end;

procedure TfrmEditService.display;
begin
  edtName.Text := DataModule2.tbServiceOneNames.Value;
  edtPrice.Text := FloatToStr(DataModule2.tbServiceOnePrice.Value);
end;

procedure TfrmEditService.editService;
begin
  DataModule2.tbServiceOne.Edit;
  DataModule2.tbServiceOneNames.Value := edtName.Text;
  DataModule2.tbServiceOnePrice.Value := StrToFloat(edtPrice.Text);
  DataModule2.tbServiceOne.Post;
end;

procedure TfrmEditService.btnEditClick(Sender: TObject);
begin
  editService();
  DataModule2.connect;
  close();
end;

procedure TfrmEditService.Button1Click(Sender: TObject);
begin
  if findService then
  begin
    open();
    display();
  end
  else
    ShowMessage('There is no service with that name Please try again');
end;

function TfrmEditService.findService;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceOne.Locate('Names', service, SearchOptions);
  findService := found;
end;

procedure TfrmEditService.FormCreate(Sender: TObject);
begin
  fill();
end;

end.
