unit F40_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmF40 = class(TForm)
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
  FrmF40: TFrmF40;
  I: Integer = 9;
  iArrUnits: Array [1 .. 4] of Integer = (
    287,
    354,
    551,
    190
  );
  sArrYear: Array [1 .. 4] of String = (
    '1990',
    '1991',
    '1992',
    '1993'
  );

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmF40.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmF40.Hide;
end;

procedure TFrmF40.BtnBioClick(Sender: TObject);
VAR
  TFile: Textfile;
  sLine: String;
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := True;
  if fileexists('f40Bio.txt') then
  begin
    assignfile(TFile, 'f40Bio.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmF40.BtnDirectionsClick(Sender: TObject);
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

procedure TFrmF40.BtnNumbersClick(Sender: TObject);
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
  RedOutput.Lines.Add('Ferrari F40 ' + '''90' + #13);
  RedOutput.Lines.Add('Year Manufactured: 1990');
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
    ('The car''s top speed was at the time a whopping 197mph.');
end;

procedure TFrmF40.FormCreate(Sender: TObject);
begin
  FrmF40.Position := podesktopcenter;
  RedOutput.Lines.Clear;
  RedOutput.Visible := False;
end;

procedure TFrmF40.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := False;
  sleep(100);
  TmrAnimate.Enabled := True;
end;

procedure TFrmF40.TmrAnimateTimer(Sender: TObject);
VAR
  PicPath: String;
begin
  PicPath := 'Timer_Pictures\' + IntToStr(I) + '.JPEG';
  ImgBackground.Picture.LoadFromFile(PicPath);
  inc(I);
  if I > 11 then
  begin
    I := 9;
  end;
end;

end.
