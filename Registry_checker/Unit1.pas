unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, StdCtrls, ComCtrls, ExtCtrls
  {$IFDEF VER150}, XPMan{$ENDIF};

type
  TfrmRegistryChecker = class(TForm)
    gbParameters: TGroupBox;
    lvResult: TListView;
    edValue: TEdit;
    lblValue: TLabel;
    cbKeys: TCheckBox;
    cbValues: TCheckBox;
    cbData: TCheckBox;
    btnFind: TButton;
    sbCount: TStatusBar;
    btnSave: TButton;
    cbHKEY_CLASSES_ROOT: TCheckBox;
    cbHKEY_CURRENT_USER: TCheckBox;
    cbHKEY_LOCAL_MACHINE: TCheckBox;
    cbHKEY_USERS: TCheckBox;
    cbHKEY_PERFORMANCE_DATA: TCheckBox;
    bvlSeparator: TBevel;
    cbHKEY_CURRENT_CONFIG: TCheckBox;
    cbHKEY_DYN_DATA: TCheckBox;
    odSave: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edValueChange(Sender: TObject);
  private
    FReg: TRegistry;
    FTotal, FLast: Integer;
    FEnable: Boolean;
    procedure Scan(Key: String);
    procedure InitScan;
    procedure IsValidData(const AKey, AValue, AData: String);
  end;

var
  frmRegistryChecker: TfrmRegistryChecker;

implementation

{$R *.dfm}

procedure TfrmRegistryChecker.FormCreate(Sender: TObject);
begin
  FReg := TRegistry.Create;
end;

procedure TfrmRegistryChecker.FormDestroy(Sender: TObject);
begin
  FReg.Free;
end;

procedure TfrmRegistryChecker.Scan(Key: String);
var
  S: TStringList;
  I: Integer;
begin
  if FReg.OpenKeyReadOnly(Key) then
  try
    S := TStringList.Create;
    try
      FReg.GetValueNames(S);
      for I := 0 to S.Count - 1 do
      begin
        IsValidData(Key, S.Strings[I], '');
        if FReg.GetDataType(S.Strings[I]) in [rdString, rdExpandString] then
          IsValidData(Key, S.Strings[I], FReg.ReadString(S.Strings[I]));
      end;
      S.Clear;
      FReg.GetKeyNames(S);
      for I := 0 to S.Count - 1 do
        if S.Strings[I] <> '' then
          Scan(Key + '\' + S.Strings[I]);
    finally
      S.Free;
    end;
  finally
    FReg.CloseKey;
  end;
end;

procedure TfrmRegistryChecker.btnFindClick(Sender: TObject);
begin
  InitScan;
end;

procedure TfrmRegistryChecker.InitScan;
begin
  FTotal := 0;
  FLast := 0;
  btnFind.Enabled := False;
  edValue.Enabled := False;
  try
    if cbHKEY_CLASSES_ROOT.Checked then
    begin
      FReg.RootKey := HKEY_CLASSES_ROOT;
      sbCount.Panels.Items[2].Text := 'HKEY_CLASSES_ROOT';
      Scan('');
    end;
    if cbHKEY_CURRENT_USER.Checked then
    begin
      FReg.RootKey := HKEY_CURRENT_USER;
      sbCount.Panels.Items[2].Text := 'HKEY_CURRENT_USER';
      Scan('');
    end;
    if cbHKEY_LOCAL_MACHINE.Checked then
    begin
      FReg.RootKey := HKEY_LOCAL_MACHINE;
      sbCount.Panels.Items[2].Text := 'HKEY_LOCAL_MACHINE';
      Scan('');
    end;
    if cbHKEY_USERS.Checked then
    begin
      FReg.RootKey := HKEY_USERS;
      sbCount.Panels.Items[2].Text := 'HKEY_USERS';
      Scan('');
    end;
    if cbHKEY_PERFORMANCE_DATA.Checked then
    begin
      FReg.RootKey := HKEY_PERFORMANCE_DATA;
      sbCount.Panels.Items[2].Text := 'HKEY_PERFORMANCE_DATA';
      Scan('');
    end;
    if cbHKEY_CURRENT_CONFIG.Checked then
    begin
      FReg.RootKey := HKEY_CURRENT_CONFIG;
      sbCount.Panels.Items[2].Text := 'HKEY_CURRENT_CONFIG';
      Scan('');
    end;
    if cbHKEY_PERFORMANCE_DATA.Checked then
    begin
      FReg.RootKey := HKEY_DYN_DATA;
      sbCount.Panels.Items[2].Text := 'HKEY_DYN_DATA';
      Scan('');
    end;
  finally
    sbCount.Panels.Items[2].Text := '';
    sbCount.Panels.Items[3].Text := 'COMPLETE';
    btnSave.Enabled := lvResult.Items.Count > 0;
    btnFind.Enabled := True;
    edValue.Enabled := True;
  end;
end;

procedure TfrmRegistryChecker.IsValidData(const AKey, AValue, AData: String);
const
  TOTAL = 'Total count: ';
  FIND = 'Find count: ';
var
  TmpStr: String;
begin
  Inc(FTotal);
  if FTotal - FLast > 500 then
  begin
    FLast := FTotal;
    sbCount.Panels.Items[0].Text := TOTAL + IntToStr(FTotal);
    sbCount.Panels.Items[1].Text := FIND + IntToStr(lvResult.Items.Count);
    TmpStr := AKey;
    if AValue <> '' then
      TmpStr := TmpStr + ' {' + AValue + '}';
    sbCount.Panels.Items[3].Text := TmpStr;
    Application.ProcessMessages;
  end;
  if AKey <> '' then
    if cbKeys.Checked then
      if Pos(edValue.Text, AKey) > 0 then
        with lvResult.Items.Add do
        begin
          Caption := sbCount.Panels.Items[2].Text;
          SubItems.Add(AKey);
          SubItems.Add('');
          SubItems.Add('');
        end;
  if AValue <> '' then
    if cbValues.Checked then
      if Pos(edValue.Text, AValue) > 0 then
        with lvResult.Items.Add do
        begin
          Caption := sbCount.Panels.Items[2].Text;
          SubItems.Add(AKey);
          SubItems.Add(AValue);
          SubItems.Add('');
        end;
  if AData <> '' then
    if cbData.Checked then
      if Pos(edValue.Text, AData) > 0 then
        with lvResult.Items.Add do
        begin
          Caption := sbCount.Panels.Items[2].Text;
          SubItems.Add(AKey);
          SubItems.Add(AValue);
          SubItems.Add(AData);
        end;
end;

procedure TfrmRegistryChecker.btnSaveClick(Sender: TObject);
var
  I: Integer;
  S: TStringList;
begin
  if odSave.Execute then
  begin
    S := TStringList.Create;
    try
      for I := 0 to lvResult.Items.Count - 1 do
      begin
        S.Add('HKEY: ' + lvResult.Items.Item[I].Caption);
        S.Add('Key: ' + lvResult.Items.Item[I].SubItems.Strings[0]);
        S.Add('Value: ' + lvResult.Items.Item[I].SubItems.Strings[1]);
        S.Add('Data: ' + lvResult.Items.Item[I].SubItems.Strings[2]);
        S.Add('====================================================================');
        S.Add('');
      end;
      S.SaveToFile(odSave.FileName);
    finally
      S.Free;
    end;
  end;
end;

procedure TfrmRegistryChecker.edValueChange(Sender: TObject);
begin
  btnFind.Enabled := edValue.Text <> ''; 
end;

end.
