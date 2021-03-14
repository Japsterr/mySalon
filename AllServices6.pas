unit AllServices6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids;

type
  TfrmAllServices6 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAllServices6: TfrmAllServices6;

implementation

uses data;

{$R *.dfm}

end.
