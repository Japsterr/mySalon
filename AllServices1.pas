unit AllServices1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB;

type
  TfrmAllServices1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAllServices1: TfrmAllServices1;

implementation

uses data;

{$R *.dfm}

end.
