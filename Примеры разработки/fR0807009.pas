unit fR0807009;
//Author:		<Korneeva Anna>
interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, DBGridEhGrouping, Vcl.Menus,
  Data.DB, Data.Win.ADODB, GridsEh, Vcl.StdCtrls, DBLookupEh, Vcl.Mask,
  DBCtrlsEh, Vcl.ExtCtrls, JvExControls, JvXPCore, JvXPBar, uConst, ComObj,
  Vcl.ImgList, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh,
  Vcl.ScreenTips, Vcl.ComCtrls, MemTableDataEh, MemTableEh, DataDriverEh,dateUtils,
  JvExMask, JvToolEdit, JvCombobox, PrnDbgeh, PrViewEh,math;

type
  TfrmR0807009 = class(TForm)
    jvbarShablSpecif: TJvXPBar;
    pnlFil: TPanel;
    lblPeriod: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btnGo: TButton;
    dtBeginPeriod: TDateTimePicker;
    dtFinPeriod: TDateTimePicker;
    cmbKC: TDBLookupComboboxEh;
    grdUstrOtkaz: TDBGridEh;
    dtsUstrOtkaz: TDataSource;
    adsUstrOtkaz: TADODataSet;
    mtProv6: TMemTableEh;
    ddProv6: TSQLDataDriverEh;
    prbPrint: TPreviewBox;
    adsUstrOtkazId_Brig: TAutoIncField;
    adsUstrOtkazId_Act: TIntegerField;
    adsUstrOtkazId_kadr: TBCDField;
    adsUstrOtkazfio: TStringField;
    adsUstrOtkazTn: TIntegerField;
    adsUstrOtkaznumMash: TStringField;
    adsUstrOtkazd_neisp: TDateTimeField;
    adsUstrOtkazd_Vosst: TDateTimeField;
    adsUstrOtkazKolCh: TBCDField;
    adsUstrOtkazMarkaIzd: TStringField;
    mtProv6Id_Brig: TAutoIncField;
    mtProv6Id_Act: TIntegerField;
    mtProv6Id_kadr: TBCDField;
    mtProv6fio: TStringField;
    mtProv6Tn: TIntegerField;
    mtProv6numMash: TStringField;
    mtProv6d_neisp: TDateTimeField;
    mtProv6d_Vosst: TDateTimeField;
    mtProv6KolCh: TBCDField;
    mtProv6MarkaIzd: TStringField;
    adsUstrOtkazv_zav: TFMTBCDField;
    mtProv6v_zav: TFMTBCDField;
    adsUstrOtkazprost5: TStringField;
    mtProv6prost5: TStringField;
    pgrdProv6: TPrintDBGridEh;
    adsUstrOtkazkol_otk: TIntegerField;
    mtProv6kol_otk: TIntegerField;
    adsUstrOtkazv_hoz: TBCDField;
    mtProv6v_hoz: TBCDField;
    adsUstrOtkazProst_Hoz: TIntegerField;
    mtProv6Prost_Hoz: TIntegerField;
    adsUstrOtkaz_itog: TADODataSet;
    adsUstrOtkazsr_vrustr: TBCDField;
    mtProv6sr_vrustr: TBCDField;
    procedure btnGoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure R0807009_report;
  private
    { Private declarations }
   procedure Report (var a: TMessage); message WM_Print;
   procedure ExportExcel (var a: TMessage); message WM_Excel;
  public
    { Public declarations }
  end;

var
  frmR0807009: TfrmR0807009;

implementation

{$R *.dfm}

uses ModuleData, uRegistr, uAppPref, uExport, Main, Printers,ExcelXP;

procedure TfrmR0807009.btnGoClick(Sender: TObject);
var fil: string;
begin
  Screen.Cursor := crHourGlass;
  if dtBeginPeriod.Checked then
    fil := fil + ' and convert(date,b.d_vosst,104)>=convert(datetime,''' +
      datetostr(dtBeginPeriod.Date) + ''',104) ';
  if dtFinPeriod.Checked then
    fil := fil + ' and convert(date,b.d_vosst,104)<convert(datetime,''' +
      datetostr(dtFinPeriod.Date) + ''',104) ';
  mtProv6.Close;
  adsUstrOtkaz.Close;
  adsUstrOtkaz.CommandText:=
      ' declare @d_Period_b varchar(10), @d_Period_e varchar(10)   '+
      ' select @d_Period_b=convert(varchar(10),'''+datetostr(dtBeginPeriod.Date)+''',104), @d_Period_e=convert(varchar(10),'''+datetostr(dtFinPeriod.Date)+''',104) '+
      ' EXECUTE ['+pDB+'].[dbo].[up_R0807009] @d_Period_b ,@d_Period_e';
  adsUstrOtkaz.Open;
  mtProv6.Open;
  mtProv6.TreeList.FullExpand;
  Screen.Cursor := crDefault;
end;

procedure TfrmR0807009.FormActivate(Sender: TObject);
begin
  EnabledBControl;
end;

procedure TfrmR0807009.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmR0807009.FormCreate(Sender: TObject);
begin
 RestoreFormsSettings(FrmR0807009);
 //Íà÷àëüíûé ïåðèîä íà÷àëî òåêóùåãî ãîäà
  dtBeginPeriod.Date:=StartOfTheYear(Now);
 //Êîíå÷íûé ïåðèîä òåêóùàÿ äàòà
  dtFinPeriod.Date:=EndOfTheMonth(Now);
end;

procedure TfrmR0807009.FormDestroy(Sender: TObject);
begin
 DisableDBControl;
  SaveFormsSettings;
  FrmR0807009 := Nil;
end;

procedure TfrmR0807009.Report(var a: TMessage);
var
  str:string;
begin
  R0807009_report;
  str:='Ñâîäíàÿ ñïðàâêà î ñðåäíåì âðåìåíè óñòðàíåíèÿ îòêàçîâ â ñóòêàõ c '+ datetostr(dtBeginPeriod.Date)+' ïî '+ datetostr(dtFinPeriod.Date);
end;

procedure TfrmR0807009.ExportExcel(var a: TMessage);
var
  str: string;
begin
  str:='Ñâîäíàÿ ñïðàâêà î ñðåäíåì âðåìåíè óñòðàíåíèÿ îòêàçîâ â ñóòêàõ c '+ datetostr(dtBeginPeriod.Date)+' ïî '+ datetostr(dtFinPeriod.Date);
  ExportExcelApp(grdUstrOtkaz,str,'R0807009') ;
end;


procedure TFrmR0807009.R0807009_report;
var EApp, WorkBook, Sheet, cell: Variant;
  I,kolvo_r,kolzap: integer;
  fio,st,tn,stroka1,shapka: string;
  kolch,v_zav,kolchi,kolchAvg,sr_vrustr,v_zavi: real;
begin
   Screen.Cursor := crHourGlass;
    st := #64;
  Screen.Cursor := crAppStart;

  try // ïîäêëþ÷åíèå ñåðâåðà
    EApp := CreateOleObject('Excel.Application');
  except
    MessageBox(FrmR0807009.Handle,'Îøèáêà ïîäñîåäèíåíèÿ ê OLE-ñåðâåðó Excel.', 'Îøèáêà',
      MB_OK + MB_ICONERROR);
    exit;
  end;

  try // ñîçäàíèå íîâîé êíèãè
      EApp.Workbooks.Add(ExtractFilePath(Application.ExeName) +'\Shablon\R0807009.xlt');
    WorkBook := EApp.Workbooks[1];
  except
    MessageBox(FrmR0807009.Handle, 'Îøèáêà ñîçäàíèÿ ðàáî÷åé êíèãè.','Îøèáêà', MB_OK + MB_ICONERROR);
    EApp.Quit;
    exit;
  end;
  Sheet := WorkBook.Sheets[1]; // äîáàâëåíèå ëèñòîâ
  adsUstrOtkaz.DisableControls;
  adsUstrOtkaz.first;

  // íàçâàíèå îò÷åòà
  stroka1 :=' Îñíîâíûå îòêàçû çà ïåðèîä c '+DateToStr(dtBeginPeriod.Date)+' äî '+DateToStr(dtfinPeriod.Date)+'ã. (ïî èíôîðìàöèè ÓÒèÑÎÏ)'+shapka;  cell := Sheet.Range[Sheet.Cells[1, 1], Sheet.Cells[4, 1]];
  cell.MergeCells := True;
  cell.Font.Bold := True;
  cell.value := stroka1;

  // çàïîëíåíèå äàííûìè
   cell := Sheet.Range[Sheet.Cells[9, 1], Sheet.Cells[9, 4]];
   i:=9;
   kolch:=0;v_zav:=0;kolzap:=0;
   kolchi:=0;v_zavi:=0;
   kolvo_r:=0;
   tn :=adsUstrOtkaz.FieldByName('tn').AsString;
    while not adsUstrOtkaz.Eof do
    begin
      if (tn=adsUstrOtkaz.FieldByName('tn').AsString) then
      begin
          if fio<>adsUstrOtkaz.FieldByName('tn').AsString then
          begin
          Sheet.Cells[I, 1].value :=adsUstrOtkaz.FieldByName('fio').AsString;
          cell := Sheet.Range[Sheet.Cells[i, 1], Sheet.Cells[i,1]];
          cell.MergeCells := True;
          cell.Borders[xlEdgeTop].LineStyle := xlBoth;
          cell.Borders[xlEdgeBottom].LineStyle := xlBoth;
          cell.Borders[xlEdgeRight].LineStyle := xlBoth;
          cell.Borders[xlEdgeLeft].LineStyle := xlBoth;
          cell.Borders[xlInsideVertical].LineStyle := xlBoth;
          cell.VerticalAlignment:= xlCenter;
          end
          else
            begin
              kolvo_r:=kolvo_r+1;
              Sheet.Cells[I, 1].value :='';
              cell := Sheet.Range[Sheet.Cells[i-kolvo_r, 1], Sheet.Cells[i,1]];
              cell.MergeCells := True;
              cell.Borders[xlEdgeBottom].LineStyle := xlBoth;
              cell.Borders[xlEdgeRight].LineStyle := xlBoth;
              cell.Borders[xlEdgeLeft].LineStyle := xlBoth;
              cell.Borders[xlInsideVertical].LineStyle := xlBoth;
            end;
         Sheet.Cells[I, 2].value :=adsUstrOtkaz.FieldByName('Nummash').AsString;
         Sheet.Cells[I, 3].value :=adsUstrOtkaz.FieldByName('Markaizd').AsString;
         Sheet.Cells[I, 4].value :=adsUstrOtkaz.FieldByName('d_neisp').AsString;
         Sheet.Cells[I, 5].value :=adsUstrOtkaz.FieldByName('d_vosst').AsString;
         Sheet.Cells[I, 6].value :=adsUstrOtkaz.FieldByName('kolch').AsString;
         Sheet.Cells[I, 7].value :=adsUstrOtkaz.FieldByName('v_zav').AsString;
         Sheet.Cells[I, 8].value :=adsUstrOtkaz.FieldByName('prost_hoz').AsString;
         Sheet.Cells[I, 9].value :=adsUstrOtkaz.FieldByName('kolch').AsString;
    //     Sheet.Cells[I, 10].value :=adsUstrOtkaz.FieldByName('sr_vrustr').AsString;
         Sheet.Cells[I, 11].value :=adsUstrOtkaz.FieldByName('prost5').AsString;
         Sheet.Cells[I, 12].value :=adsUstrOtkaz.FieldByName('kol_otk').AsString;
         kolch:=kolch+adsUstrOtkaz.FieldByName('kolch').AsFloat;
         v_zav:=v_zav+adsUstrOtkaz.FieldByName('v_zav').AsFloat;
         kolzap:=kolzap+1;
         sr_vrustr:=adsUstrOtkaz.FieldByName('sr_vrustr').AsFloat;
         tn :=adsUstrOtkaz.FieldByName('tn').AsString;
         fio :=adsUstrOtkaz.FieldByName('tn').AsString;
         adsUstrOtkaz.Next;
      end
      else
      begin
          cell := Sheet.Range[Sheet.Cells[i, 1], Sheet.Cells[i, 2]];
          cell.MergeCells := True;
          kolchAvg:=roundto(kolch/kolzap,-2);
          sheet.cells[i, 1].value := 'ÈÒÎÃÎ:';
          sheet.cells[i, 1].Font.Bold := True;
          Sheet.Cells[I, 6].value :=kolch;
          Sheet.Cells[I, 7].value :=v_zav;
          Sheet.Cells[I, 9].value :=kolchAvg;
          Sheet.Cells[I, 10].value :=sr_vrustr;
          cell := Sheet.Range[Sheet.Cells[i, 1], Sheet.Cells[i, 10]];
          cell.Font.Bold := True;
          kolchi:=kolchi+kolch;
          v_zavi:=v_zavi+v_zav;
          kolvo_r:=0;
          kolch:=0; v_zav:=0;kolzap:=0;
          kolvo_r:=0;
          tn :=adsUstrOtkaz.FieldByName('tn').AsString;
      end;
    I := I + 1;
end;
  // îáðàìëåíèå òàáëèöû
  cell := Sheet.Range[Sheet.Cells[i, 1], Sheet.Cells[i, 2]];
  cell.MergeCells := True;
  sheet.cells[i, 1].value := 'ÈÒÎÃÎ:';
  sheet.cells[i, 1].Font.Bold := True;
  Sheet.Cells[I, 6].value :=kolch;
  Sheet.Cells[I, 7].value :=v_zav;
  Sheet.Cells[I, 9].value :=kolchAvg;
  Sheet.Cells[I, 10].value :=sr_vrustr;
  cell := Sheet.Range[Sheet.Cells[i, 1], Sheet.Cells[i, 10]];
  cell.Font.Bold := True;
  kolvo_r:=0;
  kolchi:=kolchi+kolch;
  v_zavi:=v_zavi+v_zav;
  tn :=adsUstrOtkaz.FieldByName('tn').AsString;
  I := I + 1;
  sheet.cells[i, 1].value := 'ÂÑÅÃÎ:';
  Sheet.Cells[I, 6].value :=kolchi;
  Sheet.Cells[I, 7].value :=v_zavi;
  cell := Sheet.Range[Sheet.Cells[i, 1], Sheet.Cells[i, 12]];
  cell.Font.Bold := True;
  cell := Sheet.Range[Sheet.Cells[9, 2], Sheet.Cells[i,12]];
  cell.Borders[xlEdgeTop].LineStyle := xlBoth;
  cell.Borders[xlEdgeBottom].LineStyle := xlBoth;
  cell.Borders[xlEdgeRight].LineStyle := xlBoth;
  cell.Borders[xlInsideVertical].LineStyle := xlBoth;
  cell.Borders[xlInsideHorizontal].LineStyle := xlBoth;
  cell.VerticalAlignment:= xlCenter;
  Screen.Cursor := crDefault;
  adsUstrOtkaz.EnableControls;
  EApp.Visible := True;
end;


end.
