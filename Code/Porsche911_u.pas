unit Porsche911_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmPorsche911 = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    BtnBio: TButton;
    BtnNumbers: TButton;
    BtnDirection: TButton;
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
  FrmPorsche911: TFrmPorsche911;
  I: Integer = 25;
  iArrUnits: Array [1 .. 9] of Integer = (
    28951,
    50165,
    10235,
    65452,
    19542,
    16325,
    46512,
    19587,
    65327
  );
  sArrYear: Array [1 .. 9] of String = (
    '1966',
    '1967',
    '1968',
    '1969',
    '1970',
    '1971',
    '1972',
    '1973',
    '1974'
  );

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmPorsche911.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmPorsche911.Hide;
end;

procedure TFrmPorsche911.BtnBioClick(Sender: TObject);
VAR
  TFile: Textfile;
  sLine: String;
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := True;
  if fileexists('Textfile\911Bio.txt') then
  begin
    assignfile(TFile, 'Textfile\911Bio.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmPorsche911.BtnDirectionClick(Sender: TObject);
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

procedure TFrmPorsche911.BtnNumbersClick(Sender: TObject);
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
  RedOutput.Lines.Add('Porsche 911 ' + '''66' + #13);
  RedOutput.Lines.Add('Year Manufactured: 1966');
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
    ('The car''s top speed was at the time a whopping 143mph.');
end;

procedure TFrmPorsche911.FormCreate(Sender: TObject);
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := False;
  FrmPorsche911.Position := podesktopcenter;
end;

procedure TFrmPorsche911.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := False;
  sleep(100);
  TmrAnimate.Enabled := True;
end;

procedure TFrmPorsche911.TmrAnimateTimer(Sender: TObject);
VAR
  PicPath: String;
begin
  PicPath := 'Timer_Pictures\' + IntToStr(I) + '.JPEG';
  ImgBackground.Picture.LoadFromFile(PicPath);
  inc(I);
  if I > 25 then
  begin
    I := 25;
  end;
end;

end.
