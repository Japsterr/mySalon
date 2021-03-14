unit EditService8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmEditService8 = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
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
  frmEditService8: TfrmEditService8;

implementation

uses data;

{$R *.dfm}

procedure TfrmEditService8.btnEditClick(Sender: TObject);
begin
  editService();
  DataModule2.connect;
  close();

end;

procedure TfrmEditService8.Button1Click(Sender: TObject);
begin
  if findService then
  begin
    open();
    display();
  end
  else
    ShowMessage('There is no employee with that name Please try again');

end;

procedure TfrmEditService8.close;
begin
  MessageDlg('Thank You The Service Has Been Successfully Been Edited', mtInformation, [mbOk],0);
  edtPrice.Enabled := False;
  edtPrice.Text := '0';
  edtName.Enabled := False;
  edtName.Text := '';
  btnEdit.Enabled := False;
  edtNames.Text := '';
end;

procedure TfrmEditService8.fill;
begin
DataModule2.tbServiceEight.First;
     while not(DataModule2.tbServiceEight.Eof) do
     begin
     if DataModule2.tbServiceEightActive.Value = True then
        edtNames.Items.Add(DataModule2.tbServiceEightNames.Value);

       DataModule2.tbServiceEight.Next;
     end;

end;

procedure TfrmEditService8.open;
begin
    edtPrice.Enabled := True;
    edtName.Enabled := True;
    edtName.SetFocus;
    btnEdit.Enabled := True;
    showMessage('Press the Edit button to edit this Service.');
end;

procedure TfrmEditService8.display;
begin
  edtName.Text := DataModule2.tbServiceEightNames.Value;
  edtPrice.Text := FloatToStr(DataModule2.tbServiceEightPrice.Value);
end;


procedure TfrmEditService8.editService;
begin
  DataModule2.tbServiceEight.Edit;
  DataModule2.tbServiceEightNames.Value := edtName.Text;
  DataModule2.tbServiceEightPrice.Value := StrToFloat(edtPrice.Text);
  DataModule2.tbServiceEight.Post;
end;


function TfrmEditService8.findService;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceEight.Locate('Names', service, SearchOptions);
  findService := found;
end;


procedure TfrmEditService8.FormCreate(Sender: TObject);
begin
  fill();
end;

end.
