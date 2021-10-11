object frmRegistryChecker: TfrmRegistryChecker
  Left = 219
  Top = 128
  Width = 1012
  Height = 640
  Caption = 'Registry checker'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC7777CCCCCCC0000CCCC00000000CCCC7777CCCCCCCC
    C0000CCCCCCCCCCCCCC7777CCCCC0CCCCC0000CCCCCCCCCCCC7777CCCCC700CC
    C00CCCC0000000000CCCC77CCC77000C0000CCCC00000000CCCC7777C7770000
    00000CCCC000000CCCC777777777C000C00000CCCC0000CCCC77777C777CCC00
    CC00000CCCCCCCCCC77777CC77CCCCC0CCC000CCCCC00CCCCC777CCC7CCCCCCC
    CCCC0CCCCCCCCCCCCCC7CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC7CCC70CCC
    00CCCCCCCC0CC0CCCCCCCC77CC7700CC000CCCCCC000000CCCCCC777CC7700CC
    0000CCCC00000000CCCC7777CC7700CC0000C0CCC000000CCC7C7777CC7700CC
    0000C0CCC000000CCC7C7777CC7700CC0000CCCC00000000CCCC7777CC7700CC
    000CCCCCC000000CCCCCC777CC7700CC00CCCCCCCC0CC0CCCCCCCC77CC770CCC
    0CCCCCCCCCCCCCCCCCCCCCC7CCC7CCCCCCCC0CCCCCCCCCCCCCC7CCCCCCCCCCC0
    CCC000CCCCC00CCCCC777CCC7CCCCC00CC00000CCCCCCCCCC77777CC77CCC000
    C00000CCCC0000CCCC77777C777C000000000CCCC000000CCCC777777777000C
    0000CCCC00000000CCCC7777C77700CCC00CCCC0000000000CCCC77CCC770CCC
    CC0000CCCCCCCCCCCC7777CCCCC7CCCCC0000CCCCCCCCCCCCCC7777CCCCCCCCC
    0000CCCC00000000CCCC7777CCCCCCC0000CCCC0000000000CCCC7777CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object gbParameters: TGroupBox
    Left = 0
    Top = 0
    Width = 1004
    Height = 159
    Align = alTop
    Caption = ' Parameters '
    TabOrder = 0
    DesignSize = (
      1004
      159)
    object lblValue: TLabel
      Left = 10
      Top = 30
      Width = 38
      Height = 16
      Caption = 'Value:'
    end
    object bvlSeparator: TBevel
      Left = 90
      Top = 59
      Width = 13
      Height = 80
      Shape = bsRightLine
    end
    object edValue: TEdit
      Left = 56
      Top = 20
      Width = 934
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = 'Microsoft'
      OnChange = edValueChange
    end
    object cbKeys: TCheckBox
      Left = 20
      Top = 59
      Width = 70
      Height = 21
      Caption = 'Keys'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbValues: TCheckBox
      Left = 20
      Top = 89
      Width = 70
      Height = 21
      Caption = 'Values'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object cbData: TCheckBox
      Left = 20
      Top = 118
      Width = 70
      Height = 21
      Caption = 'Data'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object btnFind: TButton
      Left = 757
      Top = 112
      Width = 233
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Find'
      TabOrder = 0
      OnClick = btnFindClick
    end
    object btnSave: TButton
      Left = 560
      Top = 112
      Width = 190
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Save'
      Enabled = False
      TabOrder = 5
      OnClick = btnSaveClick
    end
    object cbHKEY_CLASSES_ROOT: TCheckBox
      Left = 130
      Top = 59
      Width = 198
      Height = 21
      Caption = 'HKEY_CLASSES_ROOT'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object cbHKEY_CURRENT_USER: TCheckBox
      Left = 130
      Top = 89
      Width = 198
      Height = 21
      Caption = 'HKEY_CURRENT_USER'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object cbHKEY_LOCAL_MACHINE: TCheckBox
      Left = 130
      Top = 118
      Width = 198
      Height = 21
      Caption = 'HKEY_LOCAL_MACHINE'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object cbHKEY_USERS: TCheckBox
      Left = 327
      Top = 59
      Width = 198
      Height = 21
      Caption = 'HKEY_USERS'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object cbHKEY_PERFORMANCE_DATA: TCheckBox
      Left = 327
      Top = 89
      Width = 218
      Height = 21
      Caption = 'HKEY_PERFORMANCE_DATA'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
    object cbHKEY_CURRENT_CONFIG: TCheckBox
      Left = 327
      Top = 118
      Width = 218
      Height = 21
      Caption = 'HKEY_CURRENT_CONFIG'
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
    object cbHKEY_DYN_DATA: TCheckBox
      Left = 560
      Top = 59
      Width = 221
      Height = 21
      Caption = 'HKEY_DYN_DATA'
      Checked = True
      State = cbChecked
      TabOrder = 12
    end
  end
  object lvResult: TListView
    Left = 0
    Top = 159
    Width = 1004
    Height = 434
    Align = alClient
    Columns = <
      item
        Caption = 'HKEY'
        Width = 180
      end
      item
        Caption = 'Key'
        Width = 540
      end
      item
        Caption = 'Value'
        Width = 110
      end
      item
        Caption = 'Data'
        Width = 140
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    TabStop = False
    ViewStyle = vsReport
  end
  object sbCount: TStatusBar
    Left = 0
    Top = 593
    Width = 1004
    Height = 19
    Panels = <
      item
        Text = 'Total count: 0'
        Width = 150
      end
      item
        Text = 'Find Count: 0'
        Width = 150
      end
      item
        Width = 180
      end
      item
        Width = 50
      end>
  end
  object odSave: TOpenDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' (*.TXT)|*.TXT'
    Left = 384
    Top = 24
  end
end
