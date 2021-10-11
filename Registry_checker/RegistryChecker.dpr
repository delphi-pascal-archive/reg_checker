program RegistryChecker;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmRegistryChecker};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmRegistryChecker, frmRegistryChecker);
  Application.Run;
end.
