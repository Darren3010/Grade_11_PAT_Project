unit Races_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmRaces = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    LblWins: TLabel;
    PnlBackground: TPanel;
    EdtAnswers: TEdit;
    LblCorrectAnswers: TLabel;
    BtnStart: TButton;
    BtnRules: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnRulesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRaces: TFrmRaces;
  sArrQuestion: Array [1 .. 5] of String = (
    'Which Manufacturer acquired more wins during the Turbo-Hybrid Era, Red Bull or Ferrari?',
    'Who won more races, Kimi Raikkonen or Nico Rosberg?',
    'Who won more, Valentino Rossi or Marc Marquez?',
    'Who won more, Jimmie Johnson or Dale Earnhardt?',
    'How many races combined, did Audi and VW amass before their shock departures from Le Mans and WRC respectively?'
  );
  sArrAnswer: Array [1 .. 5] of String = (
    'Ferrari',
    'Nico Rosberg',
    'Valentino Rossi',
    'Jimmie Johnson',
    '55'
  );

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmRaces.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmRaces.Hide;
end;

procedure TFrmRaces.BtnRulesClick(Sender: TObject);
begin
  ShowMessage('Enter who think has more wins.');
end;

procedure TFrmRaces.BtnStartClick(Sender: TObject);
VAR
  sAnswer: String;
  I, iCount: Integer;
begin
  iCount := 0;
  I := 0;
  for I := 1 to 5 do
  begin
    sAnswer := InputBox('Who do you think has won more races?',
      sArrQuestion[I], '');
    if sAnswer = sArrAnswer[I] then
    begin
      Inc(iCount);
    end
  end;
  EdtAnswers.Text := IntToStr(iCount);
end;

procedure TFrmRaces.FormCreate(Sender: TObject);
begin
  FrmRaces.Position := podesktopcenter;
end;

procedure TFrmRaces.FormShow(Sender: TObject);
begin
  EdtAnswers.Text := '';
end;

end.
