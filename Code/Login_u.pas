unit Login_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Home_u, EditHome_u;

type
  TFrmLogin = class(TForm)
    PgCtrlLogin: TPageControl;
    TbShtLogin: TTabSheet;
    TbShtSign: TTabSheet;
    TbShtGuest: TTabSheet;
    PnlBackground: TPanel;
    LblEdtUsername: TLabeledEdit;
    LblEdtPassword: TLabeledEdit;
    LblHeading: TLabel;
    LblAccount: TLabel;
    RgrpOptions: TRadioGroup;
    BtnLogin: TButton;
    PnlBackground1: TPanel;
    LblEdtUser: TLabeledEdit;
    LblEdtPass: TLabeledEdit;
    LblEdtConfirm: TLabeledEdit;
    LblSignUp: TLabel;
    BtnSignUp: TButton;
    PnlBackground2: TPanel;
    BtnGuest: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    LblEdtEmail: TLabeledEdit;
    LblEdtName: TLabeledEdit;
    LblEdtAge: TLabeledEdit;
    LblLink: TLabel;
    procedure RgrpOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnGuestClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnSignUpClick(Sender: TObject);
    procedure LblLinkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;
  bValid1: Boolean = False; // Declaring and initializing the variables to False
  bValid2: Boolean = False;

implementation

{$R *.dfm}

procedure TFrmLogin.BtnGuestClick(Sender: TObject);
begin
  frmhome.Show;
  FrmLogin.Hide;
end;

procedure TFrmLogin.BtnLoginClick(Sender: TObject);
var
  sUserName, sPassWord: String;
  sTextUser, sTextPass: String;
  TFile: Textfile;
  sLine: String;
  iPos: Integer;
begin
  sUserName := LblEdtUsername.Text;
  sPassWord := LblEdtPassword.Text;
  if LblEdtUsername.Text = '' then
  begin
    showmessage('Invalid Username.'); // Showmessage if no details entered.
    LblEdtUsername.SetFocus;
    exit;
  end;
  if LblEdtPassword.Text = '' then
  begin
    showmessage('Invalid Password.');
    LblEdtPassword.SetFocus;
    exit;
  end;
  if fileexists('Textfile\Username_Password.txt') then
  begin
    assignfile(TFile, 'Textfile\Username_Password.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      iPos := pos('@', sLine);
      sTextUser := copy(sLine, 1, iPos - 1);
      sTextPass := copy(sLine, iPos + 1);
      if (sUserName = sTextUser) and (sPassWord = sTextPass) then
      begin
        bValid1 := true;
        bValid2 := true;
      end;
    end; // While end
    if (bValid1 = true) and (bValid2 = true) then
    begin
      FrmEditHome.Show;
      FrmLogin.Hide;
    end;
    if (bValid1 = False) and (bValid2 = False) then // If the password and username entered do not match Display error message
    begin
      showmessage('Invalid details entered. Please try again.');
      LblEdtUsername.Color := clRed;
      LblEdtPassword.Color := clRed;
      LblEdtUsername.Text := '';
      LblEdtUsername.SetFocus;
      LblEdtPassword.Text := '';
    end;

  end
  else
  begin
    showmessage('File does not exist.');
    exit;
  end;

end;

procedure TFrmLogin.BtnSignUpClick(Sender: TObject);
var
  sUser, sPass, sRetyped, sEmail, sName, sSurname, sAge: String;
  TFile, TEmail, TName: Textfile;
  iRandomNumber, iPos: Integer;
begin
  sUser := LblEdtUser.Text;
  sPass := LblEdtPass.Text;
  sRetyped := LblEdtConfirm.Text;
  sEmail := LblEdtEmail.Text;
  iPos := pos(' ', LblEdtName.Text);
  sName := copy(LblEdtName.Text, 1, iPos - 1);
  sSurname := copy(LblEdtName.Text, iPos + 1);
  sAge := LblEdtAge.Text;
  if LblEdtName.Text = '' then
  begin
    showmessage('Invalid Name and Surname entered.');
    LblEdtName.SetFocus;
    LblEdtName.Color := clRed;
    exit;
  end;
  if LblEdtAge.Text = '' then
  begin
    showmessage('Invalid age entered.');
    LblEdtAge.SetFocus;
    LblEdtAge.Color := clRed;
    exit;
  end;
  if LblEdtUser.Text = '' then
  begin
    showmessage('Invalid Username entered.');
    LblEdtUser.SetFocus;
    LblEdtUser.Color := clRed;
    exit;
  end;
  if (length(LblEdtPass.Text) <> 5) then
  begin
    showmessage('Invalid Password entered. Please try again.');
    LblEdtPass.Text := '';
    LblEdtPass.SetFocus;
    LblEdtPass.Color := clRed;
    exit;
  end;
  if LblEdtPass.Text = '' then
  begin
    showmessage('Invalid Password entered. Please try again.');
    LblEdtPass.Text := '';
    LblEdtPass.SetFocus;
    LblEdtPass.Color := clRed;
    exit;
  end;
  if LblEdtPass.Text <> LblEdtConfirm.Text then
  begin
    showmessage('Passwords do not match. Please try again.');
    LblEdtPass.SetFocus;
    LblEdtPass.Text := '';
    LblEdtPass.Color := clRed;
    LblEdtConfirm.Text := '';
    LblEdtConfirm.Color := clRed;
    exit;
  end;
  if (fileexists('Textfile\Username_Password.txt')) and (sPass = sRetyped) then
  begin
    assignfile(TFile, 'Textfile\Username_Password.txt');
    reset(TFile);
    append(TFile);
    writeln(TFile, sUser + '@' + sPass);
    closefile(TFile);
    showmessage('Successful sign-up.');
    FrmEditHome.Show;
    FrmLogin.Hide;
  end // If statement end.
  else
  begin
    showmessage('File does not exist.');
  end;
  if (fileexists('Textfile\Email.txt')) and (LblEdtEmail.Text <> '') then
  begin
    iRandomNumber := random(99);
    showmessage(
      'We have given you a random number to enter in the newsletter screen if you would like to recieve our newsletter: ' + inttostr(iRandomNumber));
    assignfile(TEmail, 'Textfile\Email.txt');
    reset(TEmail);
    append(TEmail);
    writeln(TEmail, inttostr(iRandomNumber) + sEmail);
    closefile(TEmail);
  end;
  if (fileexists('Textfile\Name_Surname_Age.txt')) and (sName <> '') and
    (sSurname <> '') and (sAge <> '') then
  begin
    assignfile(TName, 'Textfile\Name_Surname_Age.txt');
    reset(TName);
    append(TName);
    writeln(TName, sName + '@' + sSurname + '#' + sAge);
    closefile(TName);
  end;

end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  FrmLogin.position := podesktopcenter;
  LblEdtPassword.NumbersOnly := true; // Ensuring that only numbers can be entered into the labelededit.
  LblEdtPassword.PasswordChar := #7; // Setting the password to be hidden when entered.
  LblEdtPass.NumbersOnly := true; // Ensuring that only numbers can be entered into the labelededit.
  LblEdtConfirm.NumbersOnly := true; // Ensuring that only numbers can be entered into the labelededit.
  PgCtrlLogin.TabIndex := 0;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  LblEdtUsername.Text := '';
  LblEdtPassword.Text := '';
  LblEdtName.Text := '';
  LblEdtAge.Text := '';
  LblEdtUser.Text := '';
  LblEdtPass.Text := '';
  LblEdtConfirm.Text := '';
  LblEdtEmail.Text := '';
end;

procedure TFrmLogin.LblLinkClick(Sender: TObject);
begin
  PgCtrlLogin.TabIndex := 1;
end;

procedure TFrmLogin.RgrpOptionsClick(Sender: TObject);
begin
  if RgrpOptions.ItemIndex = 0 then
  begin
    LblEdtPassword.PasswordChar := #0; // Seeing entered password.
  end
  else if RgrpOptions.ItemIndex = 1 then
  begin
    LblEdtPassword.PasswordChar := #7; // Hiding entered password.
  end;

end;

end.
