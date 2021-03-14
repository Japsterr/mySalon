unit AllServices10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids;

type
  TfrmAllServices10 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAllServices10: TfrmAllServices10;

implementation

uses data;

{$R *.dfm}

end.
