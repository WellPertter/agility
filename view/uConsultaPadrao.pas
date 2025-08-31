// Deus é a nossa estrela que nós guia para a verdade!!!


unit uConsultaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmConsultaPadrao = class(TForm)
    DBGrid: TDBGrid;
    pnlBottom: TPanel;
    btnEnviar: TBitBtn;
    btnSair: TBitBtn;
    edtFilter: TEdit;
    Label1: TLabel;

    procedure loadDates(aid, consult: string);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtFilterChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtFilterKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    QryConsult :TFDQuery;
    DSConsult  :TDataSource;

    codigo, id, consult: string;
    field_2, field_3, field_4,field_5: string;
    { Public declarations }
  end;

var
  frmConsultaPadrao: TfrmConsultaPadrao;

implementation

uses untDMmain;

{$R *.dfm}

procedure TfrmConsultaPadrao.btnEnviarClick(Sender: TObject);
begin

  field_2 := '';
  field_3 := '';
  field_4 := '';
  field_5 := '';

  codigo := '';

  if not QryConsult.IsEmpty then
  begin
    codigo := QryConsult.FieldByName(id).AsString;

    // field 2
    if (QryConsult.FieldCount >= 2) then
      field_2 := QryConsult.Fields[1].AsString;

    // field 3
    if (QryConsult.FieldCount >= 3) then
      field_3 := QryConsult.Fields[2].AsString;

    // field 3
    if (QryConsult.FieldCount >= 4) then
      field_4 := QryConsult.Fields[3].AsString;

    // field 4
    if (QryConsult.FieldCount >= 5) then
      field_5 := QryConsult.Fields[4].AsString;


  end;

  Close;
end;


procedure TfrmConsultaPadrao.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaPadrao.edtFilterChange(Sender: TObject);
var
  Filtro: string;
begin
  with QryConsult do
  begin

    if FieldCount >= 2 then
    begin
      Filtro := UpperCase(edtFilter.Text);
      Filtered := False;
      Filter := Format('Upper(%s) LIKE ''%%%s%%''', [Fields[1].FieldName, Filtro]);
      Filtered := True;
    end;
  end;
end;


procedure TfrmConsultaPadrao.edtFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnEnviarClick(Sender);
  end;
end;

procedure TfrmConsultaPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QryConsult.Free;
  DSConsult.Free;
end;

procedure TfrmConsultaPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f1) then
   btnEnviarClick(nil);

  if (Key = VK_ESCAPE) or (key = vk_f5) then
  begin
    Key := 0;
    btnSairClick(nil);
  end;
end;

procedure TfrmConsultaPadrao.FormShow(Sender: TObject);
begin
  edtFilter.SetFocus;
end;

procedure TfrmConsultaPadrao.loadDates(aid, consult: string);
begin
  id := aid;

  QryConsult            := TFDQuery.Create(self);
  QryConsult.Connection := dmMain.Connection;

  QryConsult.Close;
  QryConsult.SQL.Clear;
  QryConsult.SQL.Add(consult);
  QryConsult.Open;

  DSConsult         := TDataSource.Create(self);
  DSConsult.DataSet := QryConsult;
  DBGrid.DataSource := DSConsult;
  QryConsult.First;

  DBGrid.Columns.RebuildColumns;

 case DBGrid.Columns.Count of
    2:
      begin
        DBGrid.Columns[0].Width := 100;
        DBGrid.Columns[1].Width := 450;
      end;
    3:
      begin
        DBGrid.Columns[0].Width := 100;
        DBGrid.Columns[1].Width := 300;
        DBGrid.Columns[2].Width := 150;
      end;
    4:
      begin
        DBGrid.Columns[0].Width := 100;
        DBGrid.Columns[1].Width := 300;
        DBGrid.Columns[2].Width := 150;
        DBGrid.Columns[3].Width := 150;
      end;
    5:
      begin
        DBGrid.Columns[0].Width := 100;
        DBGrid.Columns[1].Width := 300;
        DBGrid.Columns[2].Width := 150;
        DBGrid.Columns[3].Width := 75;
        DBGrid.Columns[4].Width := 75;
      end;
  else

  end;

end;

end.



{

  uConsultaPadrao

  ex:

  frmConsultaPadrao := TfrmConsultaPadrao.Create(self);
  try
    frmConsultaPadrao.loadDates('id', 'SELECT id, descricao, tipo FROM tab_teste ');
    frmConsultaPadrao.ShowModal;

    if frmConsultaPadrao.codigo <> '' then
     begin
       edtCodigo.Text := frmConsultaPadrao.codigo;
       edtCodigoExit(self);
     end;

  finally
    frmConsultaPadrao.Free;
  end;


}
