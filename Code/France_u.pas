unit France_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TFrmFrance = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    RedOutput: TRichEdit;
    BtnFrenchCars: TButton;
    BtnFrenchHistory: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnFrenchHistoryClick(Sender: TObject);
    procedure BtnFrenchCarsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFrance: TFrmFrance;
  sLine: String;
  TFile: Textfile;

implementation

uses Europe_u;
{$R *.dfm}

procedure TFrmFrance.BitBtn1Click(Sender: TObject);
begin
  frmeurope.Show;
  FrmFrance.Hide;
end;

procedure TFrmFrance.BtnFrenchCarsClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssnone;
  RedOutput.Lines.Clear;
  if fileexists('FrenchCars.txt') then
  begin
    AssignFile(TFile, 'FrenchCars.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmFrance.BtnFrenchHistoryClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssvertical;
  RedOutput.Lines.Clear;
  if fileexists('FrenchHist.txt') then
  begin
    AssignFile(TFile, 'FrenchHist.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;

  end;

end;

procedure TFrmFrance.FormCreate(Sender: TObject);
begin
  FrmFrance.Position := podesktopcenter;
end;

procedure TFrmFrance.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
end;

end.
