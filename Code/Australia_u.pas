unit Australia_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg, ComCtrls;

type
  TFrmAustralia = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    RedOutput: TRichEdit;
    BtnAustraliaCars: TButton;
    BtnAustraliaCarHistory: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAustraliaCarHistoryClick(Sender: TObject);
    procedure BtnAustraliaCarsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAustralia: TFrmAustralia;
  sLine: String;
  TFile: Textfile;

implementation

uses Oceanic_u;
{$R *.dfm}

procedure TFrmAustralia.BitBtn1Click(Sender: TObject);
begin
  frmoceanic.Show;
  FrmAustralia.Hide;
end;

procedure TFrmAustralia.BtnAustraliaCarHistoryClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssvertical;
  RedOutput.Lines.Clear;
  if FileExists('Textfile/AustraliaHist.txt') then
  begin
    AssignFile(TFile, 'Textfile/AustraliaHist.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;

  end;
end;

procedure TFrmAustralia.BtnAustraliaCarsClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssnone;
  RedOutput.Lines.Clear;
  if FileExists('Textfile/AustralianCars.txt') then
  begin
    AssignFile(TFile, 'Textfile/AustralianCars.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;

  end;
end;

procedure TFrmAustralia.FormCreate(Sender: TObject);
begin
  FrmAustralia.Position := podesktopcenter;
end;

procedure TFrmAustralia.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
end;

end.
