unit Miura_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmMiura = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    BtnBio: TButton;
    BtnNumbers: TButton;
    BtnDirections: TButton;
    TmrAnimate: TTimer;
    RedOutput: TRichEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure formcreate(Sender: TObject);
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
  FrmMiura: TFrmMiura;
  I: Integer = 20;
  iArrUnits: Array [1 .. 6] of Integer = (
    321,
    156,
    845,
    765,
    231,
    465
  );
  sArrYear: Array [1 .. 6] of String = (
    '1973',
    '1974',
    '1975',
    '1976',
    '1977',
    '1978'
  );

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmMiura.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmMiura.Hide;
end;

procedure TFrmMiura.BtnBioClick(Sender: TObject);
VAR
  TFile: Textfile;
  sLine: String;
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := True;
  if fileexists('Textfile\miuraBio.txt') then
  begin
    assignfile(TFile, 'Textfile\miuraBio.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmMiura.BtnDirectionsClick(Sender: TObject);
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

procedure TFrmMiura.BtnNumbersClick(Sender: TObject);
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
  RedOutput.Lines.Add('Lamborghini Miura ' + '''73' + #13);
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
    ('The car''s top speed was at the time a whopping 163mph.');
end;

procedure TFrmMiura.formcreate(Sender: TObject);
begin
  FrmMiura.Position := podesktopcenter;
  RedOutput.Lines.Clear;
  RedOutput.Visible := False;
end;

procedure TFrmMiura.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := False;
  sleep(100);
  TmrAnimate.Enabled := True;
end;

procedure TFrmMiura.TmrAnimateTimer(Sender: TObject);
VAR
  PicPath: String;
begin
  PicPath := 'Timer_Pictures\' + IntToStr(I) + '.JPEG';
  ImgBackground.Picture.LoadFromFile(PicPath);
  inc(I);
  if I > 21 then
  begin
    I := 20;
  end;
end;

end.
