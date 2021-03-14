unit EditService3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons;

type
  TfrmEditService3 = class(TForm)
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
  frmEditService3: TfrmEditService3;

implementation

uses data;

{$R *.dfm}

procedure TfrmEditService3.fill;
begin
DataModule2.tbServiceThree.First;
     while not(DataModule2.tbServiceThree.Eof) do
     begin
       if DataModule2.tbServiceThreeActive.Value = True then
         edtNames.Items.Add(DataModule2.tbServiceThreeNames.Value);

       DataModule2.tbServiceThree.Next;

     end;

end;

procedure TfrmEditService3.open;
begin
    edtPrice.Enabled := True;
    edtName.Enabled := True;
    edtName.SetFocus;
    btnEdit.Enabled := True;
    showMessage('Press the Edit button to edit this Service.');
end;

procedure TfrmEditService3.display;
begin
  edtName.Text := DataModule2.tbServiceThreeNames.Value;
  edtPrice.Text := FloatToStr(DataModule2.tbServiceThreePrice.Value);
end;

procedure TfrmEditService3.editService;
begin
  DataModule2.tbServiceThree.Edit;
  DataModule2.tbServiceThreeNames.Value := edtName.Text;
  DataModule2.tbServiceThreePrice.Value := StrToFloat(edtPrice.Text);
  DataModule2.tbServiceThree.Post;
end;


procedure TfrmEditService3.btnEditClick(Sender: TObject);
begin
    editService();
    DataModule2.connect;
    close();
end;

procedure TfrmEditService3.Button1Click(Sender: TObject);
begin
    if findService then
  begin
    open();
    display();
  end
  else
    ShowMessage('There is no employee with that name Please try again');

end;

procedure TfrmEditService3.close;
begin
  MessageDlg('Thank You The Service Has Been Successfully Been Edited', mtInformation, [mbOk],0);
  edtPrice.Enabled := False;
  edtPrice.Text := '0';
  edtName.Enabled := False;
  edtName.Text := '';
  btnEdit.Enabled := False;
  edtNames.Text := '';
end;


function TfrmEditService3.findService;
var num : Integer;
    service : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
  num := edtNames.ItemIndex;
  service := edtNames.Items[num];
  SearchOptions := [loCaseInsensitive];
  found := DataModule2.tbServiceThree.Locate('Names', service, SearchOptions);
  findService := found;
end;


procedure TfrmEditService3.FormCreate(Sender: TObject);
begin
    fill();
end;

end.
