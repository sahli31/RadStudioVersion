program RadStudioKeygen;


uses
  Forms,
  MainFrm in 'MainFrm.pas' {FrmMain},
  RadVersion in 'RadVersion.pas',
  RadLicense in 'RadLicense.pas',
  SHFolderDll in 'SHFolderDll.pas',
  RadKeygen in 'RadKeygen.pas',
  Sha1 in 'Sha1.pas',
  SuperObject in 'SuperObject.pas',
  FGInt in 'FGInt.pas';

{$R 'UAC.res' 'UAC.rc'}
{$R 'RadStudioVersion.res' 'RadStudioVersion.rc'}
{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Rad Studio Keygen';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
