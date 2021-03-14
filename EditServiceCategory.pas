unit EditServiceCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, pngimage, ExtCtrls;

type
  TfrmEditServiceCategory = class(TForm)
    Label9: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Button1: TButton;
    btnEdit: TButton;
    BitBtn1: TBitBtn;
    edtNames: TComboBox;
    edtName: TEdit;
    DataSource1: TDataSource;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function find : Boolean;
    procedure fill;
    procedure display;
    procedure close;
    procedure edit;
    procedure open;
  end;

var
  frmEditServiceCategory: TfrmEditServiceCategory;

implementation

uses data;

{$R *.dfm}

procedure TfrmEditServiceCategory.open;
begin
  btnEdit.Enabled := True;
  edtName.Enabled := True;
  edtName.SetFocus;
  showMessage('Press the Edit button to edit the Service Category.');
end;

procedure TfrmEditServiceCategory.edit;
begin
  DataModule2.tbServiceIndex.Edit;
  DataModule2.tbServiceIndexNames.Value := edtName.Text;
  DataModule2.tbServiceIndex.Post;
end;


procedure TfrmEditServiceCategory.close;
begin
  MessageDlg('Thank You The Service Has Been Successfully Been Edited', mtInformation, [mbOk],0);
  edtName.Enabled := False;
  edtName.Text := '';
  btnEdit.Enabled := False;
  edtNames.Text := '';
  edtNAmes.SetFocus;
end;


procedure TfrmEditServiceCategory.display;
begin
  edtName.Text := DataModule2.tbServiceIndexNames.Value;
end;


function TfrmEditServiceCategory.find;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceIndex.Locate('Names', service, SearchOptions);
  find := found;
end;


procedure TfrmEditServiceCategory.fill;
begin
DataModule2.tbServiceIndex.First;
     while not(DataModule2.tbServiceIndex.Eof) do
     begin
     if DataModule2.tbServiceIndexActive.Value = True then
        edtNames.Items.Add(DataModule2.tbServiceIndexNames.Value);

       DataModule2.tbServiceIndex.Next;
     end;

end;


procedure TfrmEditServiceCategory.FormCreate(Sender: TObject);
begin
  fill();
end;

procedure TfrmEditServiceCategory.btnEditClick(Sender: TObject);
begin
  edit();
  DataModule2.connect;
  close();

end;

procedure TfrmEditServiceCategory.Button1Click(Sender: TObject);
begin
    if find then
  begin
    display();
    open;
  end
  else
    ShowMessage('There is no service category with that name Please try again');

end;

end.
