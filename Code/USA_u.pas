unit USA_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg, ComCtrls;

type
  TFrmUSA = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    RedOutput: TRichEdit;
    BtnAmericanCars: TButton;
    BtnAmericanHist: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAmericanHistClick(Sender: TObject);
    procedure BtnAmericanCarsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUSA: TFrmUSA;
  sLine: String;
  TFile: Textfile;

implementation

uses America_u;
{$R *.dfm}

procedure TFrmUSA.BitBtn1Click(Sender: TObject);
begin
  frmamerica.Show;
  FrmUSA.Hide;
end;

procedure TFrmUSA.BtnAmericanCarsClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssnone;
  RedOutput.Lines.Clear;
  if fileexists('AmericanCars.txt') then
  begin
    AssignFile(TFile, 'AmericanCars.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;

  end;

end;

procedure TFrmUSA.BtnAmericanHistClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssvertical;
  RedOutput.Lines.Clear;
  if fileexists('AmericanHist.txt') then
  begin
    AssignFile(TFile, 'AmericanHist.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;

  end;

end;

procedure TFrmUSA.FormCreate(Sender: TObject);
begin
  FrmUSA.Position := podesktopcenter;
end;

procedure TFrmUSA.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
end;

end.
