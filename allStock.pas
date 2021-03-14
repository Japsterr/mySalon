unit allStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, DB;

type
  TfrmAllStock = class(TForm)
    DataSource1: TDataSource;
    Label1: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAllStock: TfrmAllStock;

implementation

uses data;

{$R *.dfm}

end.
