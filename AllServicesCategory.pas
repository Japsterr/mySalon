unit AllServicesCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids;

type
  TfrmAllServicesCategory = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAllServicesCategory: TfrmAllServicesCategory;

implementation

uses data;

{$R *.dfm}

end.
