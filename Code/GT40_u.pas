unit GT40_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmGT40 = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    BtnBio: TButton;
    BtnNumbers: TButton;
    BtnDirections: TButton;
    TmrAnimate: TTimer;
    RedOutput: TRichEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TmrAnimateTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNumbersClick(Sender: TObject);
    procedure BtnBioClick(Sender: TObject);
    procedure BtnDirectionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGT40: TFrmGT40;
  I: Integer = 14;
  iArrUnits: Array [1 .. 2] of Integer = (
    2,
    3
  );
  sArrYear: Array [1 .. 2] of String = (
    '1967',
    '1968'
  );

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmGT40.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmGT40.Hide;
end;

procedure TFrmGT40.BtnBioClick(Sender: TObject);
VAR
  TFile: Textfile;
  sLine: String;
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := True;
  if fileexists('gtBio.txt') then
  begin
    assignfile(TFile, 'gtBio.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmGT40.BtnDirectionsClick(Sender: TObject);
VAR
  TFile: Textfile;
  sLine: String;
begin
  RedOutput.ScrollBars := ssVertical;
  RedOutput.Lines.Clear;
  RedOutput.Visible := True;
  if fileexists('Directions.txt') then
  begin
    assignfile(TFile, 'Directions.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmGT40.BtnNumbersClick(Sender: TObject);
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
  RedOutput.Lines.Add('Ford GT40 ' + '''67' + #13);
  RedOutput.Lines.Add('Year Manufactured: 1967');
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

procedure TFrmGT40.FormCreate(Sender: TObject);
begin
  FrmGT40.Position := podesktopcenter;
  RedOutput.Lines.Clear;
  RedOutput.Visible := False;
end;

procedure TFrmGT40.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := False;
  sleep(100);
  TmrAnimate.Enabled := True;
end;

procedure TFrmGT40.TmrAnimateTimer(Sender: TObject);
VAR
  PicPath: String;
begin
  ImgBackground.Stretch := True;
  PicPath := 'Timer_Pictures\' + IntToStr(I) + '.JPEG';
  ImgBackground.Picture.LoadFromFile(PicPath);
  inc(I);
  if I > 16 then
  begin
    I := 14;
  end;
end;

end.
