object frmConsultaPadrao: TfrmConsultaPadrao
  Left = 0
  Top = 0
  Caption = 'Consulta'
  ClientHeight = 352
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object DBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 730
    Height = 271
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = btnEnviarClick
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 271
    Width = 730
    Height = 81
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 42
      Height = 23
      Caption = 'Filtro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnEnviar: TBitBtn
      AlignWithMargins = True
      Left = 592
      Top = 5
      Width = 129
      Height = 67
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Selecionar [F1]'
      ImageIndex = 15
      TabOrder = 0
      OnClick = btnEnviarClick
    end
    object btnSair: TBitBtn
      AlignWithMargins = True
      Left = 453
      Top = 5
      Width = 129
      Height = 67
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Sair [F5]'
      ImageIndex = 9
      TabOrder = 1
      OnClick = btnSairClick
    end
    object edtFilter: TEdit
      Left = 64
      Top = 21
      Width = 313
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnChange = edtFilterChange
      OnKeyPress = edtFilterKeyPress
    end
  end
end
