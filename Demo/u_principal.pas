unit u_principal;

interface

uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls,

  // ############ ATENCAO AQUI ####################
  // units adicionais obrigatorias
  uTInject.ConfigCEF, uTInject, uTInject.Constant, uTInject.JS,
  uInjectDecryptFile,
  uTInject.Console, uTInject.Diversos, uTInject.AdjustNumber, uTInject.Config,
  uTInject.Classes,

  // units Opcionais (dependendo do que ira fazer)
  System.NetEncoding, System.TypInfo, WinInet,

  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.AppEvnts, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Mask, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Dialogs, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, Vcl.OleCtrls, SHDocVw, IdHTTP, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    TInject1: TInject;
    OpenDialog1: TOpenDialog;
    TrayIcon1: TTrayIcon;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    memo_unReadMessage: TMemo;
    StatusBar1: TStatusBar;
    groupEnvioMsg: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    mem_message: TMemo;
    btSendTextAndFile: TButton;
    btSendText: TButton;
    Panel1: TPanel;
    groupListaChats: TGroupBox;
    Button3: TButton;
    listaChats: TListView;
    groupListaContatos: TGroupBox;
    Splitter1: TSplitter;
    ed_num: TComboBox;
    Pnl_Config: TPanel;
    Panel2: TPanel;
    whatsOn: TImage;
    whatsOff: TImage;
    lblStatus: TLabel;
    Lbl_Avisos: TLabel;
    Timer2: TTimer;
    CheckBox5: TCheckBox;
    Label3: TLabel;
    Panel3: TPanel;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    chk_apagarMsg: TCheckBox;
    btStatusBat: TButton;
    Rdb_FormaConexao: TRadioGroup;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Panel4: TPanel;
    Button2: TButton;
    chk_AutoResposta: TCheckBox;
    ComboBox1: TComboBox;
    Label5: TLabel;
    listaContatos: TListView;
    Pnl_FONE: TPanel;
    Edt_LengDDD: TLabeledEdit;
    Edt_LengDDI: TLabeledEdit;
    Edt_LengFone: TLabeledEdit;
    Edt_DDIPDR: TLabeledEdit;
    CheckBox4: TCheckBox;
    btSendContact: TButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    btCheckNumber: TButton;
    btIsConnected: TButton;
    btSendLocation: TButton;
    btSendLinkWithPreview: TButton;
    Label6: TLabel;
    ed_videoLink: TEdit;
    Button1: TButton;
    Image2: TImage;
    ed_profilePicThumbURL: TEdit;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    listaGrupos: TListView;
    GroupBox1: TGroupBox;
    Button4: TButton;
    listaParticipantes: TListView;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    lbl_idGroup: TLabel;
    lbl_idParticipant: TLabel;
    edt_nomeGrupo: TEdit;
    edt_foneParticipante: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Button11: TButton;
    Button12: TButton;
    ed_idParticipant: TEdit;
    Label4: TLabel;
    edt_groupInviteLink: TEdit;
    Label7: TLabel;
    listaAdministradores: TListView;
    Label10: TLabel;
    GroupBox2: TGroupBox;
    btCleanChat: TButton;
    btGetMe: TButton;
    btnTestCheckNumber: TButton;
    btGetSeveralStatus: TButton;
    btGetStatus: TButton;
    Panel7: TPanel;
    btSetProfileName: TButton;
    btSetProfileStatus: TButton;
    ed_profileData: TEdit;
    Image3: TImage;
    Button19: TButton;
    btnRemoveGroupLink: TButton;
    lblNumeroConectado: TLabel;
    lblContactStatus: TLabel;
    lblContactNumber: TLabel;
    SpeedButton4: TSpeedButton;
    Label11: TLabel;
    Timer1: TTimer;
    tReloadA: TTimer;
    TabSheet5: TTabSheet;
    LabeledEdit3: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSendTextClick(Sender: TObject);
    procedure btSendTextAndFileClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);

    procedure TInject1GetUnReadMessages(Const Chats: TChatList);
    procedure listaChatsDblClick(Sender: TObject);
    procedure listaContatosDblClick(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TInject1GetStatus(Sender: TObject);
    procedure btStatusBatClick(Sender: TObject);
    procedure Edt_DDIPDRExit(Sender: TObject);
    procedure ed_numChange(Sender: TObject);
    procedure ed_numSelect(Sender: TObject);
    procedure TInject1GetMyNumber(Sender: TObject);
    procedure TInject1ErroAndWarning(Sender: TObject;
      const PError, PInfoAdc: string);
    procedure Timer2Timer(Sender: TObject);
    procedure TInject1GetChatList(const Chats: TChatList);
    procedure TInject1GetAllContactList(const AllContacts: TRetornoAllContacts);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TInject1GetQrCode(COnst Sender: TObject;
      const QrCode: TResultQRCodeClass);
    procedure whatsOnClick(Sender: TObject);
    procedure TInject1LowBattery(Sender: TObject);
    procedure TInject1DisconnectedBrute(Sender: TObject);
    procedure chk_3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btSendContactClick(Sender: TObject);
    procedure listaContatosClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btCheckNumberClick(Sender: TObject);
    procedure TInject1GetCheckIsValidNumber(Sender: TObject; Number: string;
      IsValid: Boolean);
    procedure btIsConnectedClick(Sender: TObject);
    procedure TInject1IsConnected(Sender: TObject; Connected: Boolean);
    procedure TInject1GetBatteryLevel(Sender: TObject);
    procedure btSendLinkWithPreviewClick(Sender: TObject);
    procedure btSendLocationClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure TInject1GetProfilePicThumb(Sender: TObject; Base64: string);
    procedure Button5Click(Sender: TObject);
    procedure listaGruposClick(Sender: TObject);
    procedure TInject1GetAllGroupList(const AllGroups: TRetornoAllGroups);
    procedure TInject1GetAllGroupContacts(const Contacts
      : TClassAllGroupContacts);
    procedure listaParticipantesClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure TInject1GetAllGroupAdmins(const AllGroups
      : TRetornoAllGroupAdmins);
    procedure btSetProfileNameClick(Sender: TObject);
    procedure btnRemoveGroupLinkClick(Sender: TObject);
    procedure btSetProfileStatusClick(Sender: TObject);
    procedure btCleanChatClick(Sender: TObject);
    procedure btGetStatusClick(Sender: TObject);
    procedure TInject1GetStatusMessage(const Result: TResponseStatusMessage);
    procedure btGetSeveralStatusClick(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure TInject1GetInviteGroup(const Invite: string);
    procedure TInject1GetMe(const vMe: TGetMeClass);
    procedure btGetMeClick(Sender: TObject);
    procedure btnTestCheckNumberClick(Sender: TObject);
    procedure TInject1NewGetNumber(const vCheckNumber: TReturnCheckNumber);
    procedure listaChatsClick(Sender: TObject);
    procedure ed_numKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tReloadATimer(Sender: TObject);

  private
    { Private declarations }
    FIniciando: Boolean;
    FStatus: Boolean;
    Procedure ExecuteFilter;

  public
    { Public declarations }
    Contador: Integer;
    mensagem: string;
    AFile: string;
    function VerificaPalavraChave(pMensagem, pSessao, pTelefone,
      pContato: String): Boolean;
    procedure AddChatList(ANumber: String);
    procedure AddContactList(ANumber: String);
    procedure AddGroupList(ANumber: string);
    procedure AddGroupAdmins(ANumber: string);
    procedure AddGroupContacts(ANumber: string);
    function AleatorioEntre(Menor, Maior: Integer): Integer;
  end;

var
  frmPrincipal: TfrmPrincipal;
  Pelomenos3Produtos: Integer;

implementation

uses
  Datasnap.DBClient, Winapi.ShellAPI, System.AnsiStrings, System.JSON;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  Contador := 0;
  ReportMemoryLeaksOnShutdown := false;
  PageControl1.ActivePageIndex := 0;
  FIniciando := True;
  try
    ComboBox1.Items.Clear;
    for I := 0 to 3 do
    Begin
      ComboBox1.Items.Add(GetEnumName(TypeInfo(TLanguageInject),
        ord(TLanguageInject(I))));
    End;

    GlobalCEFApp.LogConsoleActive := True;
    ComboBox1.ItemIndex := Integer(TInject1.LanguageInject);
    TabSheet2.TabVisible := false;
    TabSheet3.TabVisible := false;
    TabSheet4.TabVisible := false;
    chk_apagarMsg.Checked := TInject1.Config.AutoDelete;
    LabeledEdit1.text := TInject1.Config.ControlSendTimeSec.ToString;
    LabeledEdit2.text := TInject1.Config.SecondsMonitor.ToString;
  finally
    FIniciando := false;
  end;
end;

procedure TfrmPrincipal.AddContactList(ANumber: String);
var
  Item: TListItem;
begin
  Item := listaContatos.Items.Add;
  if Length(ANumber) < 12 then
    ANumber := '55' + ANumber;
  Item.Caption := ANumber;
  Item.SubItems.Add(Item.Caption + 'SubItem 1');
  Item.SubItems.Add(Item.Caption + 'SubItem 2');
  Item.ImageIndex := 0;
end;

procedure TfrmPrincipal.AddGroupAdmins(ANumber: string);
var
  Item: TListItem;
begin
  Item := listaAdministradores.Items.Add;
  Item.Caption := ANumber;
  Item.SubItems.Add(Item.Caption + 'SubItem 1');
  Item.SubItems.Add(Item.Caption + 'SubItem 2');
  Item.ImageIndex := 0;
end;

procedure TfrmPrincipal.AddGroupContacts(ANumber: string);
var
  Item: TListItem;
begin
  Item := listaParticipantes.Items.Add;
  Item.Caption := ANumber;
  Item.SubItems.Add(Item.Caption + 'SubItem 1');
  Item.SubItems.Add(Item.Caption + 'SubItem 2');
  Item.ImageIndex := 0;
end;

procedure TfrmPrincipal.AddGroupList(ANumber: string);
var
  Item: TListItem;
begin
  Item := listaGrupos.Items.Add;
  Item.Caption := ANumber;
  Item.SubItems.Add(Item.Caption + 'SubItem 1');
  Item.SubItems.Add(Item.Caption + 'SubItem 2');
  Item.ImageIndex := 0;
end;

function TfrmPrincipal.AleatorioEntre(Menor, Maior: Integer): Integer;
var
  Auxiliar: Integer;
begin
  Auxiliar := Random(Maior);
  if Auxiliar < Menor then
  begin
    Result := AleatorioEntre(Menor, Maior);
    exit;
  end;
  if Auxiliar > Maior then
  begin
    Result := AleatorioEntre(Menor, Maior);
    exit;
  end;
  Result := Auxiliar;

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TInject1.ShutDown;
  // FreeAndNil(GlobalCEFApp);
end;

Procedure TfrmPrincipal.AddChatList(ANumber: String);
var
  Item: TListItem;
begin
  Item := listaChats.Items.Add;
  if Length(ANumber) < 12 then
    ANumber := '55' + ANumber;
  Item.Caption := ANumber;
  Item.SubItems.Add(Item.Caption + 'SubItem 1');
  Item.SubItems.Add(Item.Caption + 'SubItem 2');
  Item.ImageIndex := 2;
end;

procedure TfrmPrincipal.ApplicationEvents1Minimize(Sender: TObject);
begin
  self.Hide();
  self.WindowState := wsMinimized;
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;

procedure TfrmPrincipal.btCheckNumberClick(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  // TInject1.CheckIsValidNumber(ed_num.Text); deprecated
  TInject1.NewCheckIsValidNumber(ed_num.text);
end;

procedure TfrmPrincipal.btSendContactClick(Sender: TObject);
begin
  try
    if not TInject1.Auth then
      exit;

    TInject1.sendContact(ed_num.text, mem_message.text);
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.btSendLinkWithPreviewClick(Sender: TObject);
begin
  try
    if not TInject1.Auth then
      exit;

    TInject1.sendLinkPreview(ed_num.text, ed_videoLink.text, mem_message.text);
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.btSendLocationClick(Sender: TObject);
begin
  try
    if not TInject1.Auth then
      exit;
    // number        lat         lgn        Message link
    TInject1.sendLocation(ed_num.text, '-70.4078', '25.3789',
      'Segue a localização');
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.btSendTextAndFileClick(Sender: TObject);
Begin
  if not OpenDialog1.Execute then
    exit;

  try
    if not TInject1.Auth then
      exit;

    TInject1.SendFile(ed_num.text, OpenDialog1.FileName, mem_message.text);
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.btIsConnectedClick(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.CheckIsConnected();
end;

{ procedure TfrmPrincipal.btNewCheckNumberClick(Sender: TObject);
  begin



  end;



  Funcao nao utilizada
  function DownloadArquivo(const Origem, Destino: String): Boolean;
  const BufferSize = 1024;
  var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: File;
  sAppName: string;
  begin
  Result   := False;
  sAppName := ExtractFileName(Application.ExeName);
  hSession := InternetOpen(PChar(sAppName),
  INTERNET_OPEN_TYPE_PRECONFIG,
  nil, nil, 0);
  try
  hURL := InternetOpenURL(hSession,
  PChar(Origem),
  nil,0,0,0);
  try
  AssignFile(f, Destino);
  Rewrite(f,1);
  repeat
  InternetReadFile(hURL, @Buffer,
  SizeOf(Buffer), BufferLen);
  BlockWrite(f, Buffer, BufferLen)
  until BufferLen = 0;
  CloseFile(f);
  Result:=True;
  finally
  InternetCloseHandle(hURL)
  end
  finally
  InternetCloseHandle(hSession)
  end
  end; }

procedure TfrmPrincipal.Button10Click(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.groupJoinViaLink(edt_groupInviteLink.text);
end;

procedure TfrmPrincipal.Button11Click(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.groupLeave(lbl_idGroup.Caption);
end;

procedure TfrmPrincipal.Button12Click(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.groupDelete(lbl_idGroup.Caption);
end;

procedure TfrmPrincipal.btGetSeveralStatusClick(Sender: TObject);
begin

  try

    FStatus := false;
    if not TInject1.Auth then
      exit;

    TInject1.GetStatusContact('558196988474@c.us');
    TInject1.GetStatusContact('558198007759@c.us');
  finally

  end;

end;

procedure TfrmPrincipal.btGetMeClick(Sender: TObject);
begin

  try

    if not TInject1.Auth then
      exit;

    TInject1.GetMe();
  finally

  end;

end;

procedure TfrmPrincipal.Button19Click(Sender: TObject);
begin

  if not TInject1.Auth then

    exit;

  TInject1.GetGroupInviteLink(lbl_idGroup.Caption);
  // '558192317066-1592044430@g.us'

end;

procedure TfrmPrincipal.btCleanChatClick(Sender: TObject);
begin

  if not TInject1.Auth then

    exit;

  TInject1.CleanALLChat(ed_num.text);

end;

procedure TfrmPrincipal.btGetStatusClick(Sender: TObject);
begin

  try

    FStatus := True;
    if not TInject1.Auth then
      exit;

    TInject1.GetStatusContact(ed_num.text);
  finally

  end;

end;

procedure TfrmPrincipal.btnRemoveGroupLinkClick(Sender: TObject);
begin
  try

    if not TInject1.Auth then
      exit;

    TInject1.GroupRemoveInviteLink(lbl_idGroup.Caption);
  finally

  end;

end;

procedure TfrmPrincipal.btSetProfileNameClick(Sender: TObject);
begin

  try

    if not TInject1.Auth then
      exit;

    TInject1.SetProfileName(ed_profileData.text);
  finally

  end;

end;

procedure TfrmPrincipal.btSetProfileStatusClick(Sender: TObject);
begin

  try

    if not TInject1.Auth then
      exit;

    TInject1.SetStatus(ed_profileData.text);
  finally

  end;

end;

procedure TfrmPrincipal.btnTestCheckNumberClick(Sender: TObject);
begin

  if not TInject1.Auth then

    exit;

  TInject1.NewCheckIsValidNumber('558195833533@c.us');

  TInject1.NewCheckIsValidNumber('558195833532@c.us');

  TInject1.NewCheckIsValidNumber('558195833531@c.us');

end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  JS: string;
begin
  if (not TInject1.Auth) or (ed_profilePicThumbURL.text = '') then
    exit;

  TInject1.getProfilePicThumb(ed_profilePicThumbURL.text);
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  TInject1.getAllContacts;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  TInject1.getAllChats;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.createGroup(edt_nomeGrupo.text, edt_foneParticipante.text);
  edt_nomeGrupo.Clear;
  edt_foneParticipante.Clear;
end;

procedure TfrmPrincipal.Button5Click(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.getAllGroups;
end;

procedure TfrmPrincipal.Button6Click(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.groupAddParticipant(lbl_idGroup.Caption, ed_idParticipant.text);
end;

procedure TfrmPrincipal.btStatusBatClick(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.GetBatteryStatus;
end;

procedure TfrmPrincipal.btSendTextClick(Sender: TObject);
begin
  try
    if not TInject1.Auth then
      exit;

    TInject1.send(ed_num.text, mem_message.text);
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TfrmPrincipal.Button7Click(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.groupRemoveParticipant(lbl_idGroup.Caption, ed_idParticipant.text);
end;

procedure TfrmPrincipal.Button8Click(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.groupPromoteParticipant(lbl_idGroup.Caption, ed_idParticipant.text);
end;

procedure TfrmPrincipal.Button9Click(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.groupDemoteParticipant(lbl_idGroup.Caption, ed_idParticipant.text);
end;

procedure TfrmPrincipal.chk_3Click(Sender: TObject);
begin
  ExecuteFilter;
end;

procedure TfrmPrincipal.ed_numChange(Sender: TObject);
var
  LRet: TStringList;
  I: Integer;
  Ltexto: String;
begin
  // Esta processando outro CHANGE
  if not CheckBox5.Checked then
    exit;

  if ed_num.AutoComplete = false Then
    exit;

  {
    ##### modo 1
    TInject1.GetContacts(ComboBox1.Text, ComboBox1.Items);
    if ComboBox1.Items.Count <= 0 then
    ComboBox1.Style := csSimple else
    ComboBox1.Style := csOwnerDrawFixed;


    ##### modo 2
  }

  LRet := TStringList.Create;
  ed_num.AutoComplete := false;
  Ltexto := ed_num.text;
  try
    ed_num.Items.Clear;
    if LRet.Count <= 0 then
      ed_num.Style := csSimple
    else
      ed_num.Style := csDropDown;

    for I := 0 to LRet.Count - 1 do
      ed_num.Items.Add(LRet.Strings[I]);
  finally
    ed_num.text := Ltexto;
    ed_num.SelStart := Length(Ltexto);
    ed_num.AutoComplete := True;
    FreeAndNil(LRet);
  end;
end;

procedure TfrmPrincipal.ed_numKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin

  lblContactNumber.Caption := ed_num.text;

  lblContactStatus.Caption := '-';

end;

procedure TfrmPrincipal.ed_numSelect(Sender: TObject);
begin
  if not CheckBox5.Checked then
    exit;

  if (ed_num.ItemIndex >= 0) and (ed_num.Items.Count > 0) then
  Begin
    ed_num.AutoComplete := false;
    ed_num.text := ed_num.Items.Strings[ed_num.ItemIndex];
    ed_num.AutoComplete := True;
  End;
end;

procedure TfrmPrincipal.ExecuteFilter;
begin
  //
end;

procedure TfrmPrincipal.Edt_DDIPDRExit(Sender: TObject);
begin
  if FIniciando then
    exit;

  TInject1.Config.AutoDelete := chk_apagarMsg.Checked;
  // TInject1.Config.AutoStart           := chk_AutoStart.Checked;

  TInject1.Config.ControlSendTimeSec := StrToIntDef(LabeledEdit1.text, 8);
  TInject1.Config.SecondsMonitor := StrToIntDef(LabeledEdit2.text, 3);


  // TInject1.Config.ShowRandom          := .Checked;
  // TInject1.Config.SyncContacts        := .Checked;

  TInject1.AjustNumber.LengthDDI := StrToIntDef(Edt_LengDDI.text, 2);
  TInject1.AjustNumber.LengthDDD := StrToIntDef(Edt_LengDDD.text, 2);
  TInject1.AjustNumber.LengthPhone := StrToIntDef(Edt_LengFone.text, 8);
  TInject1.AjustNumber.DDIDefault := StrToIntDef(Edt_DDIPDR.text, 55);
  TInject1.AjustNumber.AllowOneDigitMore := CheckBox4.Checked;

  ExecuteFilter;

  TInject1.LanguageInject := TLanguageInject(ComboBox1.ItemIndex);
end;

procedure TfrmPrincipal.TInject1DisconnectedBrute(Sender: TObject);
begin
  ShowMessage('Conexão foi finalizada pelo celular');
end;

procedure TfrmPrincipal.TInject1ErroAndWarning(Sender: TObject;
  const PError, PInfoAdc: string);
begin
  Timer2.Enabled := false;
  Lbl_Avisos.Caption := PError + ' -> ' + PInfoAdc;
  Lbl_Avisos.Font.Color := clBlack;

  Timer2.Enabled := True;
end;

procedure TfrmPrincipal.TInject1GetAllContactList(const AllContacts
  : TRetornoAllContacts);
var
  AContact: TContactClass;
begin
  listaContatos.Clear;

  for AContact in AllContacts.Result do
  begin
    AddContactList(AContact.id + ' ' + AContact.name);
  end;

  AContact := nil;

end;

procedure TfrmPrincipal.TInject1GetAllGroupAdmins(const AllGroups
  : TRetornoAllGroupAdmins);
var
  I: Integer;
begin
  listaAdministradores.Clear;

  for I := 0 to (AllGroups.Numbers.Count) - 1 do
  begin
    AddGroupAdmins(AllGroups.Numbers[I])
  end;
end;

procedure TfrmPrincipal.TInject1GetAllGroupContacts(const Contacts
  : TClassAllGroupContacts);
var
  JSonValue: TJSonValue;
  ArrayRows: TJSONArray;
  I: Integer;
begin
  JSonValue := TJSonObject.ParseJSONValue(Contacts.Result);
  ArrayRows := JSonValue as TJSONArray;

  listaParticipantes.Clear;

  for I := 0 to ArrayRows.Size - 1 do
  begin
    AddGroupContacts(ArrayRows.Items[I].value)
  end;
end;

procedure TfrmPrincipal.TInject1GetAllGroupList(const AllGroups
  : TRetornoAllGroups);
var
  I: Integer;
begin
  listaGrupos.Clear;

  for I := 0 to (AllGroups.Numbers.Count) - 1 do
  begin
    AddGroupList(AllGroups.Numbers[I])
  end;

end;

procedure TfrmPrincipal.TInject1GetBatteryLevel(Sender: TObject);
begin
  Lbl_Avisos.Caption := 'O telefone ' + TInject(Sender).MyNumber + ' está com '
    + TInject(Sender).BatteryLevel.ToString + '% de bateria';
  btStatusBat.Caption := 'Status da bateria (' + TInject(Sender)
    .BatteryLevel.ToString + '%)';
end;

procedure TfrmPrincipal.TInject1GetChatList(const Chats: TChatList);
var
  AChat: TChatClass;
begin
  listaChats.Clear;
  for AChat in Chats.Result do
    AddChatList('(' + AChat.unreadCount.ToString + ') ' + AChat.name + ' - ' +
      AChat.id);
end;

procedure TfrmPrincipal.TInject1GetCheckIsValidNumber(Sender: TObject;
  Number: string; IsValid: Boolean);
begin
  if IsValid then
    ShowMessage('Whatsapp Valid -' + Number)
  else
    ShowMessage('Whatsapp Invalid');
end;

procedure TfrmPrincipal.TInject1GetInviteGroup(const Invite: string);
begin

  ShowMessage(Invite);

end;

procedure TfrmPrincipal.TInject1GetMe(const vMe: TGetMeClass);
var
  aList: TStringList;

begin

  try

    aList := TStringList.Create();

    aList.Add('Battery: ' + vMe.battery.ToString);

    aList.Add('LC: ' + vMe.lc);

    aList.Add('LG: ' + vMe.lg);

    aList.Add('Locate: ' + vMe.locate);

    if vMe.plugged then

      aList.Add('Plugged: true')

    else

      aList.Add('Plugged: false');

    aList.Add('Pushname: ' + vMe.pushname);

    aList.Add('ServerToken: ' + vMe.serverToken);

    aList.Add('Status: ' + vMe.status.status);

    aList.Add('Me: ' + vMe.me);

    aList.Add('Phone Device_Manufacturer:  ' + vMe.phone.device_manufacturer);

    aList.Add('Phone Device Model: ' + vMe.phone.device_model);

    aList.Add('Phone MCC: ' + vMe.phone.mcc);

    aList.Add('Phone MNC: ' + vMe.phone.mnc);

    aList.Add('Phone OS Builder Number: ' + vMe.phone.os_build_number);

    aList.Add('Phone OS Version: ' + vMe.phone.os_version);

    aList.Add('Phone wa Version: ' + vMe.phone.wa_version);

    if vMe.phone.InjectWorking then

      aList.Add('Phone InjectWorkink: true')

    else

      aList.Add('Phone InjectWorkin: false');

    ShowMessage(aList.text);

  finally

    aList.Free;

  end;

end;

procedure TfrmPrincipal.TInject1GetMyNumber(Sender: TObject);
begin
  lblNumeroConectado.Caption := TInject(Sender).MyNumber;
end;

procedure TfrmPrincipal.TInject1GetProfilePicThumb(Sender: TObject;
  Base64: string);
var
  LInput: TMemoryStream;
  LOutput: TMemoryStream;
  AStr: TStringList;
  lThread: TThread;
begin
  lThread := TThread.CreateAnonymousThread(
    procedure
    begin
      try
        LInput := TMemoryStream.Create;
        LOutput := TMemoryStream.Create;
        AStr := TStringList.Create;
        AStr.Add(Base64);
        AStr.SaveToStream(LInput);
        LInput.Position := 0;
        TNetEncoding.Base64.Decode(LInput, LOutput);
        LOutput.Position := 0;
{$IFDEF VER330}
        Image2.Picture.LoadFromStream(LOutput);
{$ELSE}
        Image2.Picture.Bitmap.LoadFromStream(LOutput);
{$ENDIF}
      finally
        LInput.Free;
        LOutput.Free;
        AStr.Free;
      end;
    end);
  lThread.FreeOnTerminate := True;
  lThread.Start;
end;

procedure TfrmPrincipal.TInject1GetQrCode(Const Sender: TObject;
const QrCode: TResultQRCodeClass);
begin
  if TInject1.FormQrCodeType = TFormQrCodeType(Ft_none) then
    Image1.Picture := QrCode.AQrCodeImage
  else
    Image1.Picture := nil; // Limpa foto
end;

procedure TfrmPrincipal.TInject1GetStatus(Sender: TObject);
// Const PStatus : TStatusType; Const PFormQrCode: TFormQrCodeType);
begin
  if not Assigned(Sender) Then
    exit;

  try
    TabSheet2.TabVisible := (TInject(Sender).status = Inject_Initialized);
    TabSheet3.TabVisible := (TInject(Sender).status = Inject_Initialized);
    TabSheet4.TabVisible := (TInject(Sender).status = Inject_Initialized);
  Except
  end;

  if (TInject(Sender).status = Inject_Initialized) then
  begin
    lblStatus.Caption := 'Online';
    lblStatus.Font.Color := $0000AE11;
    SpeedButton3.Enabled := True;
  end
  else
  begin
    SpeedButton3.Enabled := false;
    lblStatus.Caption := 'Offline';
    lblStatus.Font.Color := $002894FF;
  end;

  StatusBar1.Panels[1].text := lblStatus.Caption;
  whatsOn.Visible := SpeedButton3.Enabled;
  lblNumeroConectado.Visible := whatsOn.Visible;
  whatsOff.Visible := Not whatsOn.Visible;

  Label3.Visible := false;
  case TInject(Sender).status of
    Server_ConnectedDown:
      Label3.Caption := TInject(Sender).StatusToStr;
    Server_Disconnected:
      Label3.Caption := TInject(Sender).StatusToStr;
    Server_Disconnecting:
      Label3.Caption := TInject(Sender).StatusToStr;
    Server_Connected:
      Label3.Caption := '';
    Server_Connecting:
      Label3.Caption := TInject(Sender).StatusToStr;
    Inject_Initializing:
      Label3.Caption := TInject(Sender).StatusToStr;
    Inject_Initialized:
      Label3.Caption := TInject(Sender).StatusToStr;
    Server_ConnectingNoPhone:
      Label3.Caption := TInject(Sender).StatusToStr;
    Server_ConnectingReaderCode:
      Label3.Caption := TInject(Sender).StatusToStr;
    Server_TimeOut:
      Label3.Caption := TInject(Sender).StatusToStr;
    Inject_Destroying:
      Label3.Caption := TInject(Sender).StatusToStr;
    Inject_Destroy:
      Label3.Caption := TInject(Sender).StatusToStr;
  end;
  If Label3.Caption <> '' Then
    Label3.Visible := True;

  If TInject(Sender).status in [Server_ConnectingNoPhone, Server_TimeOut] Then
  Begin
    if TInject(Sender).FormQrCodeType = Ft_Desktop then
    Begin
      if TInject(Sender).status = Server_ConnectingNoPhone then
        TInject1.FormQrCodeStop;
    end
    else
    Begin
      if TInject(Sender).status = Server_ConnectingNoPhone then
      Begin
        if not TInject(Sender).FormQrCodeShowing then
          TInject(Sender).FormQrCodeShowing := True;
      end
      else
      begin
        TInject(Sender).FormQrCodeReloader;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.TInject1GetStatusMessage(const Result
  : TResponseStatusMessage);

var

  I: Integer;

var

  AResult: String;

var

  cara: TResponseStatusMessage;

begin

  if FStatus = True then

  begin

    lblContactStatus.Caption := Result.status

  end
  else

  begin

    ShowMessage(Result.id + ' - ' + Result.status);

  end;

end;

procedure TfrmPrincipal.TInject1GetUnReadMessages(Const Chats: TChatList);
var
  AChat: TChatClass;
  AMessage: TMessagesClass;
  contato, telefone: string;
  injectDecrypt: TInjectDecryptFile;
  celular: String;
  Auxiliar: Integer;
  FazPedidoEntrega: Boolean;
begin
  celular := '554891406417@c.us';
  for AChat in Chats.Result do
  begin
    for AMessage in AChat.Messages do
    begin
      if not AChat.isGroup then // Não exibe mensages de grupos
      begin
        if not AMessage.Sender.isMe then // Não exibe mensages enviadas por mim
        begin
          memo_unReadMessage.Clear;
          //
          // Começar aki
          if AMessage.Sender.id <> celular then
          begin
            exit;
          end;

          if pos('*D*', uppercase(AMessage.body)) > 0 then
          begin
            TInject1.send(celular, 'V');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := false;
            Pelomenos3Produtos := 0;
            exit;
          end;
          if FazPedidoEntrega then
          begin
            FazPedidoEntrega := false;
            TInject1.send(celular, 'S');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := false;
            exit;
          end;
          // Alteração/Remover
          if pos('Alteração/Remover', (AMessage.body)) > 0 then
          begin
            TInject1.send(celular, '#');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := false;
            exit;
          end;

          if pos('Localização Fixa', (AMessage.body)) > 0 then
          begin
            TInject1.sendLocation(celular, '-28.699931563242238',
              '-49.41943965216874', 'MInha');
            TInject1.ReadMessages(celular);
            exit;
          end;
          if pos('Bairros atendidos', (AMessage.body)) > 0 then
          begin
            TInject1.send(celular, IntToStr(AleatorioEntre(1, 20)));
            TInject1.ReadMessages(celular);
            exit;
          end;
          if pos('Dados de Entrega', (AMessage.body)) > 0 then
          begin
            TInject1.send(celular, 'P');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := false;
            exit;
          end;
          if pos('da Casa', (AMessage.body)) > 0 then
          begin
            TInject1.send(celular, IntToStr(AleatorioEntre(1, 1500)));
            TInject1.ReadMessages(celular);
            exit;
          end;
          if pos('de Refêrencia', (AMessage.body)) > 0 then
          begin
            TInject1.send(celular, 'Casa');
            TInject1.ReadMessages(celular);
            // Obrigatorio fazer o pedido
            FazPedidoEntrega := True;
            exit;
          end;

          //
          if pos('Você já possui um pedido iniciado!',
            uppercase(AMessage.body)) > 0 then
          begin
            TInject1.send(celular, 'N');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := false;
            exit;
          end;
          if pos('Endereço Localizado', (AMessage.body)) > 0 then
          begin

            TInject1.send(celular, 'N');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := false;
            exit;
          end;
          //
          if pos('que corresponde ao ', (AMessage.body)) > 0 then
          begin
            // Faça já o seu pedido > 2
            TInject1.send(celular, IntToStr(AleatorioEntre(1, 9)));
            TInject1.ReadMessages(celular);
            exit;
          end;

          if pos('correspondente', (AMessage.body)) > 0 then
          begin
            // correspondente > random de 1 a 5
            TInject1.send(celular, IntToStr(AleatorioEntre(1, 5)));
            TInject1.ReadMessages(celular);
            exit;
          end;
          if pos('INFORME A QUANTIDADE', uppercase(AMessage.body)) > 0 then
          begin
            // INFORME A QUANTIDADE > maior que 1
            TInject1.send(celular, IntToStr(AleatorioEntre(1, 10)));
            TInject1.ReadMessages(celular);
            exit;
          end;
          if pos('Informe o código dos', (AMessage.body)) > 0 then
          begin
            TInject1.send(celular, 'N');
            exit;
          end;
          if pos('Deseja adicionar outro', (AMessage.body)) > 0 then
          begin
            // TInject1.send(celular, 'N');;
            inc(Pelomenos3Produtos);
            // exit;
            if Pelomenos3Produtos < 1 then
            begin
              TInject1.send(celular, 'N');
              exit;
            end
            else
            begin
              Pelomenos3Produtos := 0;
            end;
            // Deseja adicionar outro(a) > random de 1 a 2
            // se for 1 finalizar se for 2 digitar S
            Auxiliar := AleatorioEntre(1, 2);
            case Auxiliar of
              1:
                begin
                  TInject1.send(celular, 'F');
                end;
              2:
                begin
                  TInject1.send(celular, 'S');
                end;
            end;
            TInject1.ReadMessages(celular);
            exit;
          end;
          if pos('Forma de Pagamento', (AMessage.body)) > 0 then
          begin
            // Forma de Pagamento random de 1 a 3
            TInject1.send(celular, IntToStr(AleatorioEntre(1, 3)));
            TInject1.ReadMessages(celular);
            exit;
          end;
          if pos('SEU PEDIDO FOI FINALIZADO COM SUCESSO',
            uppercase(AMessage.body)) > 0 then
          begin
            // SEU PEDIDO FOI FINALIZADO COM SUCESSO aguardar 3m
            TInject1.send(celular, 'OI');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := True;
            exit;
          end;
          if pos('Você pode selecionar até ', (AMessage.body)) > 0 then
          begin
            if pos('Para prosseguir sem selecionar nem uma das opções',
              (AMessage.body)) > 0 then
            begin
              TInject1.send(celular, '0');
              TInject1.ReadMessages(celular);
              exit;
            end;
            // correspondente > random de 1 a 5
            TInject1.send(celular, IntToStr(AleatorioEntre(1, 10)));
            TInject1.ReadMessages(celular);
            exit;
          end;
          if pos('Deseja adicionar uma observação ', (AMessage.body)) > 0 then
          begin
            // SEU PEDIDO FOI FINALIZADO COM SUCESSO aguardar 3m
            TInject1.send(celular, 'N');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := True;
            exit;
          end;
          if pos('Informe os ingredientes e/ou adicionais', (AMessage.body)) > 0
          then
          begin
            // SEU PEDIDO FOI FINALIZADO COM SUCESSO aguardar 3m
            TInject1.send(celular, 'N');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := True;
            exit;
          end;
          if pos('Informe os números separados por virgula referente aos sabores que deseja,',
            (AMessage.body)) > 0 then
          begin
            if pos('é possivel até 1 sabores', (AMessage.body)) > 0 then
            begin
              TInject1.send(celular, IntToStr(AleatorioEntre(1, 10)));
              TInject1.ReadMessages(celular);
              exit;
            end;
            if pos('é possivel até 2 sabores', (AMessage.body)) > 0 then
            begin
              TInject1.send(celular, IntToStr(AleatorioEntre(1, 10)) + ',' +
                IntToStr(AleatorioEntre(1, 10)));
              TInject1.ReadMessages(celular);
              exit;
            end;
            if pos('é possivel até 3 sabores', (AMessage.body)) > 0 then
            begin
              TInject1.send(celular, IntToStr(AleatorioEntre(1, 10)) + ',' +
                IntToStr(AleatorioEntre(1, 10)) + ',' +
                IntToStr(AleatorioEntre(1, 10)));
              TInject1.ReadMessages(celular);
              exit;
            end;
            if pos('é possivel até 4 sabores', (AMessage.body)) > 0 then
            begin
              TInject1.send(celular, IntToStr(AleatorioEntre(1, 10)) + ',' +
                IntToStr(AleatorioEntre(1, 10)) + ',' +
                IntToStr(AleatorioEntre(1, 10)) + ',' +
                IntToStr(AleatorioEntre(1, 10)));
              TInject1.ReadMessages(celular);
              exit;
            end;

            // correspondente > random de 1 a 5
            TInject1.send(celular, IntToStr(AleatorioEntre(1, 10)));
            TInject1.ReadMessages(celular);
            exit;
          end;
          if pos('Informe os adicionais separados por virgula.',
            (AMessage.body)) > 0 then
          begin
            // SEU PEDIDO FOI FINALIZADO COM SUCESSO aguardar 3m
            TInject1.send(celular, 'N');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := True;
            exit;
          end;
          if pos('Para Finalizar Pedido', (AMessage.body)) > 0 then
          begin
            // SEU PEDIDO FOI FINALIZADO COM SUCESSO aguardar 3m
            TInject1.send(celular, 'F');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := True;
            exit;
          end;
          if pos('Deseja continuar pedido?', (AMessage.body)) > 0 then
          begin
            // SEU PEDIDO FOI FINALIZADO COM SUCESSO aguardar 3m
            TInject1.send(celular, 'S');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := True;
            exit;
          end;
          // Selecione em qual sabores você deseja o
          if pos('Selecione em qual sabores você deseja o', (AMessage.body)) > 0
          then
          begin
            // SEU PEDIDO FOI FINALIZADO COM SUCESSO aguardar 3m
            TInject1.send(celular, 'T');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := True;
            exit;
          end;
          if pos('Você pode selecionar apenas um', (AMessage.body)) > 0 then
          begin
            // SEU PEDIDO FOI FINALIZADO COM SUCESSO aguardar 3m
            TInject1.send(celular, '1');
            TInject1.ReadMessages(celular);
            tReloadA.Enabled := True;
            exit;
          end;
          //



          //
          //


          memo_unReadMessage.Lines.Add
            (PChar('Nome Contato: ' + Trim(AMessage.Sender.pushname)));
          memo_unReadMessage.Lines.Add(PChar('Chat Id     : ' + AChat.id));
          // memo_unReadMessage.Lines.Add(PChar(AMessage.mediaData.&type) + 'Lat: '+AMessage.lat.ToString + ' Long: '+ AMessage.lng.ToString);
          // memo_unReadMessage.Lines.Add(PChar(AMessage.mediaKey));
          memo_unReadMessage.Lines.Add
            (PChar('Tipo mensagem: ' + AMessage.&type));
          memo_unReadMessage.Lines.Add(StringReplace(AMessage.body, #$A, #13#10,
            [rfReplaceAll, rfIgnoreCase]));

          telefone := Copy(AChat.id, 3, pos('@', AChat.id) - 3);
          contato := AMessage.Sender.pushname;
          ed_profilePicThumbURL.text := AChat.contact.profilePicThumbObj.img;
          TInject1.ReadMessages(AChat.id);

          // if (AMessage.&type = 'image') then
          // begin
          // decrypt.processaimagem(AMessage.clientUrl, AMessage.mediaKey, 'jpg');
          // end;

          if chk_AutoResposta.Checked then
            VerificaPalavraChave(AMessage.body, '', telefone, contato);
        end;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.TInject1IsConnected(Sender: TObject;
Connected: Boolean);
begin
  tReloadA.Enabled := True;
  if Connected = True then
    ShowMessage('Conectado / Connected')
  else
    ShowMessage('Desconectado / Not connected')

end;

procedure TfrmPrincipal.TInject1LowBattery(Sender: TObject);
begin
  Timer2.Enabled := false;
  Lbl_Avisos.Caption := 'Alarme de BATERIA.  Você está com ' + TInject(Sender)
    .BatteryLevel.ToString + '%';
  Lbl_Avisos.Font.Color := clRed;
  Timer2.Enabled := True;
end;

procedure TfrmPrincipal.TInject1NewGetNumber(const vCheckNumber
  : TReturnCheckNumber);

begin

  if vCheckNumber.valid then

    ShowMessage(vCheckNumber.id + ' é um numero Válido')

  else

    ShowMessage(vCheckNumber.id + ' é um numero INVÁLIDO');

end;

procedure TfrmPrincipal.listaChatsClick(Sender: TObject);
begin

  lblContactStatus.Caption := '-';

end;

procedure TfrmPrincipal.listaChatsDblClick(Sender: TObject);
begin
  ed_num.text := TInject1.GetChat(listaChats.Selected.Index).id;
  lblContactNumber.Caption := ed_num.text;
end;

procedure TfrmPrincipal.listaContatosClick(Sender: TObject);
begin
  mem_message.text := Copy(listaContatos.Items[listaContatos.Selected.Index]
    .SubItems[1], 0, pos('@', listaContatos.Items[listaContatos.Selected.Index]
    .SubItems[1])) + 'c.us';

  lblContactStatus.Caption := '-';
end;

procedure TfrmPrincipal.listaContatosDblClick(Sender: TObject);
begin
  ed_num.text := Copy(listaContatos.Items[listaContatos.Selected.Index].SubItems
    [1], 0, pos('@', listaContatos.Items[listaContatos.Selected.Index].SubItems
    [1])) + 'c.us';

  lblContactNumber.Caption := ed_num.text;
end;

procedure TfrmPrincipal.listaGruposClick(Sender: TObject);
begin
  if listaGrupos.ItemIndex <> -1 then
  begin
    lbl_idGroup.Caption := Copy(listaGrupos.Items[listaGrupos.Selected.Index]
      .SubItems[1], 0, pos('@', listaGrupos.Items[listaGrupos.Selected.Index]
      .SubItems[1])) + 'g.us';

    if not TInject1.Auth then
      exit;

    TInject1.listGroupContacts(lbl_idGroup.Caption);
  end;
end;

procedure TfrmPrincipal.listaParticipantesClick(Sender: TObject);
begin
  if listaParticipantes.ItemIndex <> -1 then
  begin
    ed_idParticipant.text :=
      Copy(listaParticipantes.Items[listaParticipantes.Selected.Index].SubItems
      [1], 0, pos('@', listaParticipantes.Items[listaParticipantes.Selected.
      Index].SubItems[1])) + 'c.us';
  end;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  if not TInject1.Auth(false) then
  Begin
    TInject1.FormQrCodeType := TFormQrCodeType(Rdb_FormaConexao.ItemIndex);
    TInject1.FormQrCodeStart;
  End;

  if not TInject1.FormQrCodeShowing then
    TInject1.FormQrCodeShowing := True;

end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://mikelustosa.kpages.online/tinject',
    '', '', 1);
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  if not TInject1.Auth then
    exit;

  TInject1.Logtout;
  TInject1.Disconnect;
end;

procedure TfrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://www.youtube.com/user/mikelustosa',
    '', '', 1);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  // TInject1.send('554891406417@c.us', 'oi');
end;

procedure TfrmPrincipal.Timer2Timer(Sender: TObject);
begin
  Lbl_Avisos.Caption := '';
  Timer2.Enabled := false;
end;

procedure TfrmPrincipal.tReloadATimer(Sender: TObject);
begin

  TInject1.send('554891406417@c.us', 'oi');

end;

procedure TfrmPrincipal.TrayIcon1Click(Sender: TObject);
begin
  TrayIcon1.Visible := false;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

function TfrmPrincipal.VerificaPalavraChave(pMensagem, pSessao, pTelefone,
  pContato: String): Boolean;
begin
  Result := false;
  if (pos('OLA', AnsiUpperCase(pMensagem)) > 0) or
    (pos('OLÁ', AnsiUpperCase(pMensagem)) > 0) or
    (pos('BOM DIA', AnsiUpperCase(pMensagem)) > 0) or
    (pos('BOA TARDE', AnsiUpperCase(pMensagem)) > 0) or
    (pos('BOA NOITE', AnsiUpperCase(pMensagem)) > 0) or
    (pos('INÍCIO', AnsiUpperCase(pMensagem)) > 0) or
    (pos('HELLO', AnsiUpperCase(pMensagem)) > 0) or
    (pos('HI', AnsiUpperCase(pMensagem)) > 0) or
    (pos('INICIO', AnsiUpperCase(pMensagem)) > 0) or
    (pos('OI', AnsiUpperCase(pMensagem)) > 0) then
  begin
    mensagem := TInject1.Emoticons.AtendenteH + 'Olá *' + pContato + '!*\n\n' +
      'Você está no auto atendimento do *TInject*!\n\n' +
      'Digite um número:\n\n' + TInject1.Emoticons.Um + ' Suporte\n\n' +
      TInject1.Emoticons.Dois + ' Consultar CEP\n\n' + TInject1.Emoticons.Tres +
      ' Financeiro\n\n' + TInject1.Emoticons.Quatro +
      ' Horários de atendimento\n\n';
    TInject1.SendFile(pTelefone, ExtractFileDir(Application.ExeName) +
      '\Img\softmais.png', mensagem);
    Result := True;
    exit;
  end;
  exit;
end;

procedure TfrmPrincipal.WebBrowser1DocumentComplete(ASender: TObject;
const pDisp: IDispatch; const URL: OleVariant);
begin
  { if WebBrowser1.Document <> nil then
    begin
    WebBrowser1.Document.QueryInterface(IViewObject, viewObject) ;
    if Assigned(viewObject) then
    try
    bitmap := TBitmap.Create;
    try
    r := Rect(0, 0, WebBrowser1.Width, WebBrowser1.Height) ;

    bitmap.Height := WebBrowser1.Height;
    bitmap.Width := WebBrowser1.Width;

    viewObject.Draw(DVASPECT_CONTENT, 1, nil, nil, Application.Handle, bitmap.Canvas.Handle, @r, nil, nil, 0) ;

    with TJPEGImage.Create do
    try
    Assign(bitmap) ;
    //SaveToFile(fileName) ;
    image2.Picture.Assign(bitmap);
    finally
    Free;
    end;
    finally
    bitmap.Free;
    end;
    finally
    viewObject._Release;
    end;
    end; }

end;

procedure TfrmPrincipal.whatsOnClick(Sender: TObject);
begin
  if not TInject1.FormQrCodeShowing then
    TInject1.FormQrCodeShowing := True;
end;

end.
