unit TopSpeed_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmTopSpeed = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    CmbDifficulty: TComboBox;
    BtnStart: TButton;
    BtnRules: TButton;
    RedOutput: TRichEdit;
    LblDisplay: TLabel;
    LblPoints: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
    procedure BtnRulesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iTotalPoints: Integer;
  end;

var
  FrmTopSpeed: TFrmTopSpeed;
  ArrQuestion: Array [1 .. 10] of String;
  ArrAnswer: Array [1 .. 10] of String;

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmTopSpeed.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmTopSpeed.Hide;
end;

procedure TFrmTopSpeed.BtnStartClick(Sender: TObject);
VAR
  I, iDifficulty, iCount, iPoints: Integer;
  TFile, TFile1: Textfile;
  sAnswer, sTextPoints: String;
begin
  iTotalPoints := 0;
  iPoints := 0;
  iCount := 0;
  I := 0;
  iDifficulty := CmbDifficulty.ItemIndex;
  if iDifficulty = -1 then
  begin
    showmessage('No difficulty selected.');
    CmbDifficulty.Color := clred;
    exit;
  end;
  if iDifficulty = 0 then
  begin
    if fileexists('Textfile\EasyQuestion.txt') then
    begin
      assignfile(TFile, 'Textfile\EasyQuestion.txt');
      reset(TFile);
    end;
    for I := 1 to 10 do
    begin
      readln(TFile, ArrQuestion[I]);
    end; // easy option

    if fileexists('Textfile\EasyAnswer.txt') then
    begin
      assignfile(TFile1, 'Textfile\EasyAnswer.txt');
      reset(TFile1);
    end;
    for I := 1 to 10 do
    begin
      readln(TFile1, ArrAnswer[I]);
    end;
    for I := 1 to 10 do
    begin
      sAnswer := InputBox('Enter the top speed of...', ArrQuestion[I], '');
      if sAnswer = ArrAnswer[I] then
      begin
        iCount := iCount + 1;
      end; // if end
    end; // for end
    iPoints := iCount;
    RedOutput.Visible := true;
    RedOutput.Lines.Clear;
    RedOutput.Lines.Add(
      'You have reached the end of the game. Thanks for playing!');
    RedOutput.Lines.Add('Correct Answers: ' + inttostr(iCount));
    RedOutput.Lines.Add('Points: ' + inttostr(iPoints));
    iTotalPoints := strtoint(LblPoints.Caption) + iPoints;
  end; // if end

  if iDifficulty = 1 then
  begin
    if fileexists('Textfile\MediumQuestion.txt') then
    begin
      assignfile(TFile, 'Textfile\MediumQuestion.txt');
      reset(TFile);
    end;
    for I := 1 to 10 do
    begin
      readln(TFile, ArrQuestion[I]);
    end; // easy option

    if fileexists('Textfile\MediumAnswer.txt') then
    begin
      assignfile(TFile1, 'Textfile\MediumAnswer.txt');
      reset(TFile1);
    end;
    for I := 1 to 10 do
    begin
      readln(TFile1, ArrAnswer[I]);
    end;
    for I := 1 to 10 do
    begin
      sAnswer := InputBox('Enter the top speed of...', ArrQuestion[I], '');
      if sAnswer = ArrAnswer[I] then
      begin
        iCount := iCount + 1;
      end; // if end
    end; // for end
    iPoints := iCount * 2;
    RedOutput.Visible := true;
    RedOutput.Lines.Clear;
    RedOutput.Lines.Add(
      'You have reached the end of the game. Thanks for playing!');
    RedOutput.Lines.Add('Correct Answers: ' + inttostr(iCount));
    RedOutput.Lines.Add('Points: ' + inttostr(iPoints));
    iTotalPoints := strtoint(LblPoints.Caption) + iPoints;
  end; // if end

  if iDifficulty = 2 then
  begin
    if fileexists('Textfile\HardQuestion.txt') then
    begin
      assignfile(TFile, 'Textfile\HardQuestion.txt');
      reset(TFile);
    end;
    for I := 1 to 10 do
    begin
      readln(TFile, ArrQuestion[I]);
    end; // easy option

    if fileexists('Textfile\HardAnswer.txt') then
    begin
      assignfile(TFile1, 'Textfile\HardAnswer.txt');
      reset(TFile1);
    end;
    for I := 1 to 10 do
    begin
      readln(TFile1, ArrAnswer[I]);
    end;
    for I := 1 to 10 do
    begin
      sAnswer := InputBox('Enter the top speed of...', ArrQuestion[I], '');
      if sAnswer = ArrAnswer[I] then
      begin
        iCount := iCount + 1;
      end; // if end
    end; // for end
    iPoints := iCount * 3;
    RedOutput.Visible := true;
    RedOutput.Lines.Clear;
    RedOutput.Lines.Add(
      'You have reached the end of the game. Thanks for playing!');
    RedOutput.Lines.Add('Correct Answers: ' + inttostr(iCount));
    RedOutput.Lines.Add('Points: ' + inttostr(iPoints));
    iTotalPoints := strtoint(LblPoints.Caption) + iPoints;
  end; // if end

  LblPoints.Caption := inttostr(iTotalPoints);
  RedOutput.Lines.Add('Total Points: ' + inttostr(iTotalPoints));
end;

procedure TFrmTopSpeed.BtnRulesClick(Sender: TObject);
begin
  RedOutput.Visible := true;
end;

procedure TFrmTopSpeed.FormCreate(Sender: TObject);
VAR
  sTextPoints: String;
  TFile: Textfile;
begin
  FrmTopSpeed.position := podesktopcenter;
  if fileexists('Textfile\Points.txt') then
  begin
    assignfile(TFile, 'Textfile\Points.txt');
    reset(TFile);
  end;
  while not eof(TFile) do
  begin
    readln(TFile, sTextPoints);
    iTotalPoints := iTotalPoints + strtoint(sTextPoints);
  end;
  LblPoints.Caption := inttostr(iTotalPoints);
end;

procedure TFrmTopSpeed.FormShow(Sender: TObject);
begin
  RedOutput.Visible := false;
  CmbDifficulty.ItemIndex := -1;
  CmbDifficulty.Color := clwhite;
end;

end.
