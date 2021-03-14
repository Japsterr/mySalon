unit EditService6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmEditService6 = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  frmEditService6: TfrmEditService6;

implementation

uses data;

{$R *.dfm}

procedure TfrmEditService6.btnEditClick(Sender: TObject);
begin
  editService();
  DataModule2.connect;
  close();

end;

procedure TfrmEditService6.Button1Click(Sender: TObject);
begin
  if findService then
  begin
    open();
    display();
  end
  else
    ShowMessage('There is no employee with that name Please try again');

end;

procedure TfrmEditService6.close;
begin
  MessageDlg('Thank You The Service Has Been Successfully Been Edited', mtInformation, [mbOk],0);
  edtPrice.Enabled := False;
  edtPrice.Text := '0';
  edtName.Enabled := False;
  edtName.Text := '';
  btnEdit.Enabled := False;
  edtNames.Text := '';
end;

procedure TfrmEditService6.fill;
begin
DataModule2.tbServiceSix.First;
     while not(DataModule2.tbServiceSix.Eof) do
     begin
     if DataModule2.tbServiceSixActive.Value = True then
        edtNames.Items.Add(DataModule2.tbServiceSixNames.Value);

       DataModule2.tbServiceSix.Next;
     end;

end;

procedure TfrmEditService6.open;
begin
    edtPrice.Enabled := True;
    edtName.Enabled := True;
    edtName.SetFocus;
    btnEdit.Enabled := True;
    showMessage('Press the Edit button to edit this Service.');
end;

procedure TfrmEditService6.display;
begin
  edtName.Text := DataModule2.tbServiceSixNames.Value;
  edtPrice.Text := FloatToStr(DataModule2.tbServiceSixPrice.Value);
end;

procedure TfrmEditService6.editService;
begin
  DataModule2.tbServiceSix.Edit;
  DataModule2.tbServiceSixNames.Value := edtName.Text;
  DataModule2.tbServiceSixPrice.Value := StrToFloat(edtPrice.Text);
  DataModule2.tbServiceSix.Post;
end;


function TfrmEditService6.findService;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceSix.Locate('Names', service, SearchOptions);
  findService := found;
end;


procedure TfrmEditService6.FormCreate(Sender: TObject);
begin
  fill();
end;

end.
