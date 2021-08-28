unit Corvette_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmCorvette = class(TForm)
    BitBtn1: TBitBtn;
    BtnBio: TButton;
    BtnNumbers: TButton;
    BtnDirections: TButton;
    RedOutput: TRichEdit;
    ImgBackground: TImage;
    TmrAnimate: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNumbersClick(Sender: TObject);
    procedure TmrAnimateTimer(Sender: TObject);
    procedure BtnBioClick(Sender: TObject);
    procedure BtnDirectionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCorvette: TFrmCorvette;
  I: Integer = 4;
  iArrUnits: Array [1 .. 15] of Integer = (
    28566,
    38762,
    17316,
    21801,
    27004,
    30464,
    37502,
    38465,
    46558,
    49213,
    46776,
    53807,
    40614,
    40606,
    25407
  );
  sArrYear: Array [1 .. 15] of String = (
    '1968',
    '1969',
    '1970',
    '1971',
    '1972',
    '1973',
    '1974',
    '1975',
    '1976',
    '1977',
    '1978',
    '1979',
    '1980',
    '1981',
    '1982'
  );

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmCorvette.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmCorvette.Hide;
end;

procedure TFrmCorvette.BtnBioClick(Sender: TObject);
VAR
  TFile: Textfile;
  sLine: String;
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := True;
  if fileexists('CorvetteBio.txt') then
  begin
    assignfile(TFile, 'CorvetteBio.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmCorvette.BtnDirectionsClick(Sender: TObject);
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

procedure TFrmCorvette.BtnNumbersClick(Sender: TObject);
VAR
  sHighestYear: String;
  rAvgUnitsSold, rSum: Real;
  I, J, iHighest: Integer;
begin
  rSum := 0;
  I := 0;
  J := 0;
  iHighest := 0;
  RedOutput.Lines.Clear;
  RedOutput.Visible := True;
  RedOutput.ScrollBars := ssnone;
  RedOutput.Lines.Add('Chevrolet Corvette ' + '''68' + #13);
  RedOutput.Lines.Add('Year Manufactured: 1968');
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
    ('The car''s top speed was at the time a whopping 139mph.');

end;

procedure TFrmCorvette.FormCreate(Sender: TObject);
begin
  FrmCorvette.position := podesktopcenter;
  RedOutput.Visible := False;
end;

procedure TFrmCorvette.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
  RedOutput.Visible := False;
  sleep(100);
  TmrAnimate.Enabled := True;
end;

procedure TFrmCorvette.TmrAnimateTimer(Sender: TObject);
VAR
  PicPath: String;
begin
  PicPath := 'Timer_Pictures\' + IntToStr(I) + '.JPEG';
  ImgBackground.Picture.LoadFromFile(PicPath);
  Inc(I);
  if I > 6 then
  begin
    I := 4
  end;

end;

end.
