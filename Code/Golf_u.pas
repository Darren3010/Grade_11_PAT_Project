unit Golf_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmGolf = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    BtnDirection: TButton;
    BtnBio: TButton;
    BtnNumbers: TButton;
    TmrAnimate: TTimer;
    RedOutput: TRichEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TmrAnimateTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNumbersClick(Sender: TObject);
    procedure BtnBioClick(Sender: TObject);
    procedure BtnDirectionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGolf: TFrmGolf;
  I: Integer = 12;
  iArrUnits: Array [1 .. 20] of Integer = (
    200152,
    654321,
    185269,
    785412,
    653278,
    195874,
    195847,
    346512,
    178452,
    652143,
    189324,
    788452,
    456321,
    765321,
    15248,
    78512,
    98989,
    45263,
    495687,
    165324
  );
  sArrYear: Array [1 .. 20] of String = (
    '1973',
    '1974',
    '1975',
    '1976',
    '1977',
    '1978',
    '1979',
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992'
  );

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmGolf.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmGolf.Hide;
end;

procedure TFrmGolf.BtnBioClick(Sender: TObject);
VAR
  TFile: Textfile;
  sLine: String;
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := True;
  if fileexists('Textfile\golfBio.txt') then
  begin
    assignfile(TFile, 'Textfile\golfBio.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmGolf.BtnDirectionClick(Sender: TObject);
VAR
  TFile: Textfile;
  sLine: String;
begin
  RedOutput.ScrollBars := ssVertical;
  RedOutput.Lines.Clear;
  RedOutput.Visible := True;
  if fileexists('Textfile\Directions.txt') then
  begin
    assignfile(TFile, 'Textfile\Directions.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmGolf.BtnNumbersClick(Sender: TObject);
VAR
  rSum, rAvgUnitsSold: Real;
  I, J, iHighest: Integer;
  sHighestYear: String;
begin
  rSum := 0;
  I := 0;
  J := 0;
  iHighest := 0;
  RedOutput.Lines.Clear;
  RedOutput.Visible := True;
  RedOutput.ScrollBars := ssnone;
  RedOutput.Lines.Add('VW Golf GTI ' + '''73' + #13);
  RedOutput.Lines.Add('Year Manufactured: 1973');
  for I := 1 to length(iArrUnits) do
  begin
    rSum := rSum + iArrUnits[I];
  end;
  rAvgUnitsSold := rSum / length(iArrUnits);
  RedOutput.Lines.Add('The total amount of units sold in its ' + IntToStr
      (length(iArrUnits)) + ' years of production is: ' + FloatToStrf
      (rSum, ffnumber, 9, 0));
  RedOutput.Lines.Add('The average amount of units sold per year is: ' +
      FloatToStrf(rAvgUnitsSold, ffnumber, 9, 0));
  for J := 1 to length(iArrUnits) do
  begin
    if iArrUnits[J] > iHighest then
    begin
      iHighest := iArrUnits[J];
      sHighestYear := sArrYear[J];
    end;
  end;
  RedOutput.Lines.Add('The year with the highest units sold was: ' +
      sHighestYear + ' with ' + IntToStr(iHighest) + ' units sold.');
  RedOutput.Lines.Add
    ('The car''s top speed was at the time a whopping 116mph.');
end;

procedure TFrmGolf.FormCreate(Sender: TObject);
begin
  FrmGolf.Position := podesktopcenter;
  RedOutput.Lines.Clear;
  RedOutput.Visible := False;
end;

procedure TFrmGolf.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := False;
  sleep(100);
  TmrAnimate.Enabled := True;
end;

procedure TFrmGolf.TmrAnimateTimer(Sender: TObject);
VAR
  PicPath: String;
begin
  PicPath := 'Timer_Pictures\' + IntToStr(I) + '.JPEG';
  ImgBackground.Picture.LoadFromFile(PicPath);
  inc(I);
  if I > 13 then
  begin
    I := 12;
  end;
end;

end.
