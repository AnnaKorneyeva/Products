object frmR0807009: TfrmR0807009
  Left = 0
  Top = 0
  Caption = 
    'R0807009 - '#1057#1074#1086#1076#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072' '#1086' '#1089#1088#1077#1076#1085#1077#1084' '#1074#1088#1077#1084#1077#1085#1080' '#1091#1089#1090#1088#1072#1085#1077#1085#1080#1103' '#1086#1090#1082#1072#1079#1086#1074' ' +
    #1074' '#1089#1091#1090#1082#1072#1093'  '#1079#1072' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 669
  ClientWidth = 915
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object jvbarShablSpecif: TJvXPBar
    Left = 0
    Top = 0
    Width = 915
    Height = 125
    Caption = #1060#1080#1083#1100#1090#1088
    Colors.CheckedFrameColor = clBtnFace
    Colors.FocusedFrameColor = clBtnFace
    Colors.BodyColor = clBtnFace
    Colors.BodyBorderColor = clCream
    Colors.GradientFrom = clGradientInactiveCaption
    Colors.GradientTo = clGradientInactiveCaption
    Colors.SeparatorColor = clBtnFace
    Items = <
      item
        Caption = ' '
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 15159552
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clBtnText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Pitch = fpFixed
    HeaderFont.Style = [fsBold]
    HeaderHeight = 20
    HeaderRounded = False
    HotTrack = False
    OwnerDraw = False
    ItemHeight = 95
    RollDelay = 1
    RollMode = rmFixed
    RollStep = 20
    ShowLinkCursor = False
    ShowItemFrame = False
    RoundedItemFrame = 0
    TopSpace = 0
    Align = alTop
    ParentFont = False
    object pnlFil: TPanel
      Left = 4
      Top = 28
      Width = 907
      Height = 93
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        907
        93)
      object lblPeriod: TLabel
        Left = 25
        Top = 6
        Width = 96
        Height = 13
        Caption = #1055#1077#1088#1080#1086#1076' '#1082#1086#1085#1090#1088#1086#1083#1103' :'
        WordWrap = True
      end
      object Label1: TLabel
        Left = 8
        Top = 27
        Width = 8
        Height = 13
        Caption = 'c '
        WordWrap = True
      end
      object Label2: TLabel
        Left = 8
        Top = 54
        Width = 15
        Height = 13
        Caption = #1087#1086' '
        WordWrap = True
      end
      object btnGo: TButton
        Left = 812
        Top = 63
        Width = 88
        Height = 28
        Anchors = [akTop, akRight, akBottom]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        TabOrder = 0
        OnClick = btnGoClick
      end
      object dtBeginPeriod: TDateTimePicker
        Left = 23
        Top = 24
        Width = 121
        Height = 21
        Date = 42843.637721250000000000
        Time = 42843.637721250000000000
        ShowCheckbox = True
        TabOrder = 1
      end
      object dtFinPeriod: TDateTimePicker
        Left = 23
        Top = 51
        Width = 121
        Height = 21
        Date = 42843.638262523150000000
        Time = 42843.638262523150000000
        ShowCheckbox = True
        TabOrder = 2
      end
      object cmbKC: TDBLookupComboboxEh
        Left = 525
        Top = 432
        Width = 107
        Height = 21
        EditButtons = <>
        KeyField = 'kC'
        ListField = 'kc;nkC'
        TabOrder = 3
        Visible = True
      end
      object prbPrint: TPreviewBox
        Left = 165
        Top = 7
        Width = 84
        Height = 84
        HorzScrollBar.Tracking = True
        VertScrollBar.Tracking = True
        Anchors = [akTop, akRight]
        AutoScroll = False
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 4
        Visible = False
      end
    end
  end
  object grdUstrOtkaz: TDBGridEh
    Left = 0
    Top = 125
    Width = 915
    Height = 544
    Align = alClient
    AutoFitColWidths = True
    DataGrouping.Active = True
    DataGrouping.Font.Charset = DEFAULT_CHARSET
    DataGrouping.Font.Color = clWindowText
    DataGrouping.Font.Height = -13
    DataGrouping.Font.Name = 'Tahoma'
    DataGrouping.Font.Style = []
    DataGrouping.GroupLevels = <
      item
        ColumnName = 'Column_10_fio'
      end>
    DataGrouping.Footers = <
      item
        Visible = True
        ColumnItems = <
          item
          end
          item
          end
          item
          end
          item
          end
          item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ValueType = gfvSumEh
          end
          item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ValueType = gfvSumEh
          end
          item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          item
            DisplayFormat = '#0.##'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ValueType = gfvAvgEh
          end
          item
            DisplayFormat = '#0.##'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ValueType = gfvAvgEh
          end
          item
          end
          item
          end
          item
          end
          item
          end>
        ShowFunctionName = False
      end>
    DataGrouping.FootersDefValues.RunTimeCustomizable = True
    DataGrouping.ParentFont = False
    DataGrouping.DefaultStateExpanded = True
    DataSource = dtsUstrOtkaz
    DynProps = <>
    Flat = True
    FooterParams.Color = clSkyBlue
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    IndicatorOptions = [gioShowRowIndicatorEh]
    OddRowColor = 15263976
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    SortLocal = True
    STFilter.InstantApply = True
    STFilter.Local = True
    STFilter.Visible = True
    SumList.Active = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'numMash'
        Footers = <>
        Title.Caption = #8470' '#1084#1072#1096'.'
        Width = 56
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'MarkaIzd'
        Footers = <>
        Title.Caption = #1052#1072#1088#1082#1072' '#1080#1079#1076#1077#1083#1080#1103
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'd_neisp'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|'#1053#1072' '#1082#1086#1085#1090#1088#1086#1083#1100
        Width = 115
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'd_Vosst'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'| C '#1082#1086#1085#1090#1088#1086#1083#1103
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'KolCh'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1055#1088#1086#1089#1090#1086#1081'| '
        Width = 57
      end
      item
        Alignment = taCenter
        DisplayFormat = '#0.#'
        DynProps = <>
        EditButtons = <>
        FieldName = 'v_zav'
        Footers = <>
        Title.Caption = #1055#1088#1086#1089#1090#1086#1081'|'#1087#1086' '#1074#1080#1085#1077'| '#1079#1072#1074#1086#1076#1072
        Width = 53
      end
      item
        DisplayFormat = '#'
        DynProps = <>
        EditButtons = <>
        FieldName = 'Prost_Hoz'
        Footers = <>
        Title.Caption = #1055#1088#1086#1089#1090#1086#1081'|'#1087#1086' '#1074#1080#1085#1077'| '#1093#1086#1079'-'#1074#1072
        Width = 62
        WordWrap = True
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'KolCh'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Footers = <>
        Title.Caption = #1055#1088#1086#1089#1090#1086#1081'|c'#1088#1077#1076#1085#1080#1081' '
        Width = 60
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'sr_vrustr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #1057#1088'.'#1074#1088'. '#1091#1089#1090#1088'. '#1086#1090#1082'.'
        Width = 40
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'prost5'
        Footers = <>
        Title.Caption = #1055#1088#1086#1089#1090#1086#1081'| > 5 '#1089#1091#1090'.'
        Width = 48
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'fio'
        Footers = <>
        Title.Caption = #1060#1048#1054
        Visible = False
        Width = 214
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Tn'
        Footers = <>
        Visible = False
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'kol_otk'
        Footers = <>
        Title.Caption = #1050#1086#1083'-'#1074#1086' '#1086#1090#1082#1072#1079#1086#1074
        Width = 47
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object dtsUstrOtkaz: TDataSource
    DataSet = mtProv6
    Left = 496
    Top = 72
  end
  object adsUstrOtkaz: TADODataSet
    Connection = DM.ADOConnApp
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'use Ukch'#13#10'select a.*,rtrim(d.Fam)+'#39' '#39'+d.Inicial as fio,d.Tn,e.Ma' +
      'rkaIzd,c.numMash,b.d_neisp,b.d_Vosst,'#13#10'round((cast((DATEDIFF(hou' +
      'r, b.d_neisp, b.d_Vosst)) as numeric(5,1))/24),1,1) as KolCh2,b.' +
      'Prost_Hoz, sr_vrustr,'#13#10'cast((DATEDIFF(hour, b.d_neisp, b.d_Vosst' +
      ')) as numeric(5,1))/24 as KolCh ,'#13#10' case when prost_hoz =0 then ' +
      'cast((DATEDIFF(hour, b.d_neisp, b.d_Vosst)) *1.000/24 as dec (9,' +
      '1)) end as v_zav  ,'#13#10' case when prost_hoz =1 then cast((DATEDIFF' +
      '(hour, b.d_neisp, b.d_Vosst)) *1.000/24 as dec (9,1)) end as v_h' +
      'oz  ,f.kol_otk '#13#10'into #p1 from F080704 a         '#13#10'left join F08' +
      '0701 b on a.Id_Act=b.Id_Act        '#13#10'left join F080601 c on b.Id' +
      '_Mash=c.Id_Mash        '#13#10'left join kadr    d on a.Id_kadr=d.Id  ' +
      '      '#13#10'left join s0873 e   on c.kMash=e.kMash'#13#10'left join ( sele' +
      'ct Id_Act,COUNT(Id_Otkaz) as kol_otk from ukch..F080702 group by' +
      ' Id_Act) f on a.Id_Act=f.Id_Act'#13#10'left join ('#13#10#13#10'select a.Id_kadr' +
      ',SUM(kol_otk) as kol_otksr,'#13#10'SUM(isnull(case when prost_hoz =0 t' +
      'hen cast((DATEDIFF(hour, b.d_neisp, b.d_Vosst)) *1.000/24 as dec' +
      ' (9,1)) end,0)) as v_zav,'#13#10'cast(SUM(isnull(case when prost_hoz =' +
      '0 then cast((DATEDIFF(hour, b.d_neisp, b.d_Vosst)) *1.000/24 as ' +
      'dec (4,1)) end,0))/sum(kol_otk)  AS dec (4,1)) as sr_vrustr'#13#10'fro' +
      'm F080704 a '#13#10'left join (select  Id_Act,COUNT(Id_Otkaz) as kol_o' +
      'tk from ukch..F080702 group by Id_Act) f on a.Id_Act=f.Id_Act'#13#10'l' +
      'eft join F080701 b on a.Id_Act=b.Id_Act    '#13#10'where 1=1  and b.d_' +
      'Vosst>=convert(datetime,'#39'01.05.2016'#39',104)  '#13#10'and b.d_Vosst<=conv' +
      'ert(datetime,'#39'31.05.2016'#39',104) '#13#10'group by  a.Id_kadr ) j on a.Id' +
      '_kadr=j.Id_kadr'#13#10' where 1=1  and b.d_neisp>=convert(datetime,'#39'01' +
      '.01.2016'#39',104)  '#13#10'and b.d_neisp<=convert(datetime,'#39'28.04.2017'#39',1' +
      '04)  order by fio,b.Id_Mash,b.d_neisp,b.d_Vosst  '#13#10' select *, ca' +
      'se when a.KolCh>=5 then '#39'+'#39' end as prost5 from #p1 a'#13#10'drop table' +
      ' #p1 '
    Parameters = <>
    Left = 464
    Top = 72
    object adsUstrOtkazId_Brig: TAutoIncField
      FieldName = 'Id_Brig'
      ReadOnly = True
    end
    object adsUstrOtkazId_Act: TIntegerField
      FieldName = 'Id_Act'
    end
    object adsUstrOtkazId_kadr: TBCDField
      FieldName = 'Id_kadr'
      Precision = 18
      Size = 0
    end
    object adsUstrOtkazfio: TStringField
      FieldName = 'fio'
      ReadOnly = True
      Size = 30
    end
    object adsUstrOtkazTn: TIntegerField
      FieldName = 'Tn'
    end
    object adsUstrOtkaznumMash: TStringField
      FieldName = 'numMash'
    end
    object adsUstrOtkazd_neisp: TDateTimeField
      FieldName = 'd_neisp'
    end
    object adsUstrOtkazd_Vosst: TDateTimeField
      FieldName = 'd_Vosst'
    end
    object adsUstrOtkazKolCh: TBCDField
      FieldName = 'KolCh'
      ReadOnly = True
      Precision = 15
      Size = 3
    end
    object adsUstrOtkazMarkaIzd: TStringField
      FieldName = 'MarkaIzd'
      Size = 30
    end
    object adsUstrOtkazv_zav: TFMTBCDField
      FieldName = 'v_zav'
      ReadOnly = True
      Precision = 17
      Size = 6
    end
    object adsUstrOtkazprost5: TStringField
      FieldName = 'prost5'
      ReadOnly = True
      Size = 1
    end
    object adsUstrOtkazkol_otk: TIntegerField
      FieldName = 'kol_otk'
    end
    object adsUstrOtkazv_hoz: TBCDField
      FieldName = 'v_hoz'
      Precision = 9
      Size = 1
    end
    object adsUstrOtkazProst_Hoz: TIntegerField
      FieldName = 'Prost_Hoz'
    end
    object adsUstrOtkazsr_vrustr: TBCDField
      FieldName = 'sr_vrustr'
      Precision = 4
      Size = 1
    end
  end
  object mtProv6: TMemTableEh
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'Id_Brig'
        DataType = ftAutoInc
        Precision = 15
      end
      item
        Name = 'Id_Act'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'Id_kadr'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'fio'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Tn'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'numMash'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'd_neisp'
        DataType = ftDateTime
      end
      item
        Name = 'd_Vosst'
        DataType = ftDateTime
      end
      item
        Name = 'KolCh'
        DataType = ftBCD
        Precision = 15
        Size = 3
      end
      item
        Name = 'MarkaIzd'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'v_zav'
        DataType = ftFMTBcd
        Precision = 17
        Size = 6
      end
      item
        Name = 'prost5'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'kol_otk'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'v_hoz'
        DataType = ftBCD
        Precision = 9
        Size = 1
      end
      item
        Name = 'Prost_Hoz'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'sr_vrustr'
        DataType = ftBCD
        Precision = 4
        Size = 1
      end>
    FetchAllOnOpen = True
    IndexDefs = <>
    Params = <>
    DataDriver = ddProv6
    StoreDefs = True
    TreeList.DefaultNodeExpanded = True
    Left = 426
    Top = 72
    object mtProv6Id_Brig: TAutoIncField
      DisplayWidth = 10
      FieldName = 'Id_Brig'
    end
    object mtProv6Id_Act: TIntegerField
      DisplayWidth = 10
      FieldName = 'Id_Act'
    end
    object mtProv6Id_kadr: TBCDField
      DisplayWidth = 19
      FieldName = 'Id_kadr'
      Precision = 18
      Size = 0
    end
    object mtProv6fio: TStringField
      DisplayWidth = 40
      FieldName = 'fio'
      Size = 40
    end
    object mtProv6Tn: TIntegerField
      DisplayWidth = 10
      FieldName = 'Tn'
    end
    object mtProv6numMash: TStringField
      DisplayWidth = 20
      FieldName = 'numMash'
    end
    object mtProv6d_neisp: TDateTimeField
      DisplayWidth = 18
      FieldName = 'd_neisp'
    end
    object mtProv6d_Vosst: TDateTimeField
      DisplayWidth = 18
      FieldName = 'd_Vosst'
    end
    object mtProv6KolCh: TBCDField
      DisplayWidth = 16
      FieldName = 'KolCh'
      Precision = 15
      Size = 3
    end
    object mtProv6MarkaIzd: TStringField
      DisplayWidth = 30
      FieldName = 'MarkaIzd'
      Size = 30
    end
    object mtProv6v_zav: TFMTBCDField
      DisplayWidth = 18
      FieldName = 'v_zav'
      Precision = 17
      Size = 6
    end
    object mtProv6prost5: TStringField
      FieldName = 'prost5'
      Size = 1
    end
    object mtProv6kol_otk: TIntegerField
      FieldName = 'kol_otk'
    end
    object mtProv6v_hoz: TBCDField
      FieldName = 'v_hoz'
      Precision = 9
      Size = 1
    end
    object mtProv6Prost_Hoz: TIntegerField
      FieldName = 'Prost_Hoz'
    end
    object mtProv6sr_vrustr: TBCDField
      FieldName = 'sr_vrustr'
      Precision = 4
      Size = 1
    end
  end
  object ddProv6: TSQLDataDriverEh
    DeleteCommand.Params = <>
    DynaSQLParams.Options = []
    GetrecCommand.Params = <>
    InsertCommand.Params = <>
    SelectCommand.Params = <>
    UpdateCommand.Params = <>
    MacroVars.Macros = <>
    ProviderDataSet = adsUstrOtkaz
    Left = 362
    Top = 72
  end
  object pgrdProv6: TPrintDBGridEh
    DBGridEh = grdUstrOtkaz
    Options = [pghFitGridToPageWidth, pghColored, pghFitingByColWidths]
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'Tahoma'
    PageFooter.Font.Style = []
    PageHeader.CenterText.Strings = (
      '')
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -19
    PageHeader.Font.Name = 'Times New Roman'
    PageHeader.Font.Style = []
    Units = MM
    Left = 544
    Top = 72
  end
  object adsUstrOtkaz_itog: TADODataSet
    Connection = DM.ADOConnApp
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'use Ukch'#13#10'select a.*,rtrim(d.Fam)+'#39' '#39'+d.Inicial as fio,d.Tn,e.Ma' +
      'rkaIzd,c.numMash,b.d_neisp,b.d_Vosst,'#13#10'round((cast((DATEDIFF(hou' +
      'r, b.d_neisp, b.d_Vosst)) as numeric(5,1))/24),1,1) as KolCh2,b.' +
      'Prost_Hoz, '#13#10'cast((DATEDIFF(hour, b.d_neisp, b.d_Vosst)) as nume' +
      'ric(5,1))/24 as KolCh ,'#13#10' case when prost_hoz =0 then cast((DATE' +
      'DIFF(hour, b.d_neisp, b.d_Vosst)) *1.000/24 as dec (9,1)) end as' +
      ' v_zav  ,'#13#10' case when prost_hoz =1 then cast((DATEDIFF(hour, b.d' +
      '_neisp, b.d_Vosst)) *1.000/24 as dec (9,1)) end as v_hoz  ,f.kol' +
      '_otk '#13#10'into #p1 from F080704 a         '#13#10'left join F080701 b on ' +
      'a.Id_Act=b.Id_Act        '#13#10'left join F080601 c on b.Id_Mash=c.Id' +
      '_Mash        '#13#10'left join kadr    d on a.Id_kadr=d.Id        '#13#10'le' +
      'ft join s0873 e   on c.kMash=e.kMash'#13#10'left join ( select Id_Act,' +
      'COUNT(Id_Otkaz) as kol_otk from ukch..F080702 group by Id_Act) f' +
      ' on a.Id_Act=f.Id_Act'#13#10' where 1=1  and b.d_neisp>=convert(dateti' +
      'me,'#39'01.01.2016'#39',104)  '#13#10'and b.d_neisp<=convert(datetime,'#39'28.04.2' +
      '017'#39',104)  order by fio,b.Id_Mash,b.d_neisp,b.d_Vosst  '#13#10' select' +
      ' *, case when a.KolCh>=5 then '#39'+'#39' end as prost5 from #p1 a'#13#10'drop' +
      ' table #p1 '
    Parameters = <>
    Left = 640
    Top = 48
  end
end
