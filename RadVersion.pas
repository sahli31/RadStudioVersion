unit RadVersion;

interface
uses Windows,Classes,SysUtils;
type
  TPatchInfo=record
    Crc:DWORD;
    Sha1:string;
    PatchOffset:DWORD;
    FinalizeArrayOffset:DWORD;
  end;
  TRadStudioVersion=record
    Name:string;
    Ver:string;
    BDSVersion:string;
    LicVerStr:string;
    LicHostPID:Integer;
    LicHostSKU:Integer;
    LicDelphiPID:string;
    LicCBuilderPID:string;
    BdsPatchInfo:TPatchInfo;
    LicenseManagerPatchInfo:TPatchInfo;
    mOasisRuntimePatchInfo:TPatchInfo;
    SetupGUID:string;
    ISOUrl:string;
    ISOMd5:string;
  end;
  PRadStudioVersion=^TRadStudioVersion;
  procedure LoadRadStudioVersion(VerList:TStringList;FromGit:Boolean=False);
var
  RadStudioVersionList:TStringList;
  
implementation
uses SuperObject,WinInet;

function HttpsGet(Host,FileName: string):string;
var
  dwSize:DWORD;
  dwFileSize: Int64;
  dwBytesRead,dwReserved:DWORD;
  hInte,hConnection,hRequest:HInternet;
  ContentSize:array[1..1024] of Char;
  P:PChar;
begin
  Result:='';
  try
    hInte := InternetOpen('',INTERNET_OPEN_TYPE_PRECONFIG,nil,nil,0);
    if hInte<>nil then
    begin
      hConnection := InternetConnect(hInte,
                                   PChar(Host),
                                   INTERNET_DEFAULT_HTTPS_PORT,
                                   nil,
                                   nil,
                                   INTERNET_SERVICE_HTTP,
                                   0,
                                   0);
      if hConnection<>nil then
      begin
        hRequest := HttpOpenRequest(hConnection,
                                    PChar('GET'),
                                    PChar(FileName),
                                    HTTP_VERSION,
                                    '',
                                    nil,
                                    INTERNET_FLAG_NO_CACHE_WRITE or
                                    INTERNET_FLAG_RELOAD or INTERNET_FLAG_SECURE,
                                    0);

        if hRequest<>nil then
        begin
          if HttpSendRequest(hRequest,nil,0,nil,0)then
          begin
            dwReserved:=0;
            dwSize:=SizeOf(ContentSize);
            if HttpQueryInfo(hRequest,HTTP_QUERY_CONTENT_LENGTH,@ContentSize,dwSize,dwReserved) then
            begin
              dwFileSize:=StrToInt(StrPas(@ContentSize));
              GetMem(P, dwFileSize);
              InternetReadFile(hRequest,P,dwFileSize,dwBytesRead);
              Result:=StrPas(P);
              FreeMem(P);
            end;
          end;
        end;
        InternetCloseHandle(hRequest);
      end;
      InternetCloseHandle(hConnection);
    end;
    InternetCloseHandle(hInte);
  finally

  end;
end;

procedure FinallyRadStudioVersion(VerList:TStringList);
var
  RadStudioVersion:PRadStudioVersion;
begin
  while VerList.Count>0 do
  begin
    RadStudioVersion:=PRadStudioVersion(VerList.Objects[0]);
    if RadStudioVersion<>nil then Dispose(RadStudioVersion);
    VerList.Delete(0);
  end;
end;  
procedure LoadRadStudioVersion(VerList:TStringList;FromGit:Boolean=False);
var
  JO,SubJO:ISuperObject;
  i:Integer;
  RadStudioVersion:PRadStudioVersion;
  ResourceStream:TResourceStream;

begin
  if FromGit then
  begin
    JO:=TSuperObject.ParseString(PSOChar(SOString(HttpsGet('raw.githubusercontent.com','/elseif/RadStudioVersion/master/RadVersion.json'))),False);
    JO.SaveTo(ExtractFilePath(ParamStr(0))+'\RadStudioVersion.json',True);
  end
  else
  begin
    if not FileExists(ExtractFilePath(ParamStr(0))+'\RadStudioVersion.json') then
    begin
      try
        ResourceStream:=TResourceStream.Create(Hinstance,'RadStudioVersion',RT_RCDATA);
        ResourceStream.SaveToFile(ExtractFilePath(ParamStr(0))+'\RadStudioVersion.json');
      finally
        FreeAndNil(ResourceStream);
      end;
    end;
    JO:=TSuperObject.ParseFile(PChar(ExtractFilePath(ParamStr(0))+'\RadStudioVersion.json'),False);
  end;
  if JO=nil then raise Exception.Create('Can not load ''RadStudioVersion.json'',Please delete this file and update it!');
  FinallyRadStudioVersion(VerList);
  for i := 0 to JO.A['RadStudioVersion'].Length - 1 do
  begin
    SubJO:=JO.A['RadStudioVersion'].O[i];
    New(RadStudioVersion);
    with RadStudioVersion^ do
    begin
      Name:=SubJO.S['Name'];
      Ver:= SubJO.S['Ver'];
      BDSVersion:=SubJO.S['BDSVersion'];
      LicVerStr:= SubJO.S['LicVerStr'];
      LicHostPID:= SubJO.I['LicHostPID'];
      LicHostSKU:= SubJO.I['LicHostSKU'];
      LicDelphiPID:=SubJO.S['LicDelphiPID'];
      LicCBuilderPID:=SubJO.S['LicCBuilderPID'];
      BdsPatchInfo.Crc:=SubJO.I['BdsPatchInfo.Crc'];
      BdsPatchInfo.Sha1:=SubJO.S['BdsPatchInfo.Sha1'];
      BdsPatchInfo.PatchOffset:=SubJO.I['BdsPatchInfo.PatchOffset'];
      BdsPatchInfo.FinalizeArrayOffset:=SubJO.I['BdsPatchInfo.FinalizeArrayOffset'];
      LicenseManagerPatchInfo.Crc:=SubJO.I['LicenseManagerPatchInfo.Crc'];
      LicenseManagerPatchInfo.Sha1:=SubJO.S['LicenseManagerPatchInfo.Sha1'];
      LicenseManagerPatchInfo.PatchOffset:=SubJO.I['LicenseManagerPatchInfo.PatchOffset'];
      LicenseManagerPatchInfo.FinalizeArrayOffset:=SubJO.I['LicenseManagerPatchInfo.FinalizeArrayOffset'];
      mOasisRuntimePatchInfo.Sha1:=SubJO.S['mOasisRuntimePatchInfo.Sha1'];
      mOasisRuntimePatchInfo.PatchOffset:=SubJO.I['mOasisRuntimePatchInfo.PatchOffset'];
      SetupGUID:=SubJO.S['SetupGUID'];
      ISOUrl:=SubJO.S['ISOUrl'];
      ISOMd5:=SubJO.S['ISOMd5'];
    end;
    VerList.AddObject(RadStudioVersion^.Name,TObject(RadStudioVersion));    
  end;
end;

initialization
  RadStudioVersionList:= TStringList.Create;
  LoadRadStudioVersion(RadStudioVersionList);
finalization
  FinallyRadStudioVersion(RadStudioVersionList);
  FreeAndNil(RadStudioVersionList);

end.
