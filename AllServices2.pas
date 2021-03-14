unit AllServices2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids;

type
  TfrmAllServices2 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAllServices2: TfrmAllServices2;

implementation

uses data;

{$R *.dfm}

end.
