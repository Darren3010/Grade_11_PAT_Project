unit Germany_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TFrmGermany = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    RedOutput: TRichEdit;
    BtnGermanCars: TButton;
    BtnGermanCarHist: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnGermanCarsClick(Sender: TObject);
    procedure BtnGermanCarHistClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGermany: TFrmGermany;
  sLine: String;
  TFile: textfile;

implementation

uses Europe_u;
{$R *.dfm}

procedure TFrmGermany.BitBtn1Click(Sender: TObject);
begin
  frmeurope.Show;
  FrmGermany.Hide;
end;

procedure TFrmGermany.BtnGermanCarHistClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssvertical;
  RedOutput.Lines.Clear;
  if fileexists('Textfile\GermanHist.txt') then
  begin
    AssignFile(TFile, 'Textfile\GermanHist.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;

  end;
end;

procedure TFrmGermany.BtnGermanCarsClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssnone;
  RedOutput.Lines.Clear;
  if fileexists('Textfile\GermanCars.txt') then
  begin
    AssignFile(TFile, 'Textfile\GermanCars.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;

  end;
end;

procedure TFrmGermany.FormCreate(Sender: TObject);
begin
  FrmGermany.Position := podesktopcenter;

end;

procedure TFrmGermany.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
end;

end.
