unit Sweden_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TFrmSweden = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    RedOutput: TRichEdit;
    BtnSwedishCars: TButton;
    BtnSwedishHist: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnSwedishCarsClick(Sender: TObject);
    procedure BtnSwedishHistClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSweden: TFrmSweden;
  sLine: String;
  TFile: Textfile;

implementation

uses Europe_u;
{$R *.dfm}

procedure TFrmSweden.BitBtn1Click(Sender: TObject);
begin
  frmeurope.Show;
  FrmSweden.Hide;
end;

procedure TFrmSweden.BtnSwedishCarsClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssnone;
  RedOutput.Lines.Clear;
  if fileexists('SwedishCars.txt') then
  begin
    assignfile(TFile, 'SwedishCars.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;

end;

procedure TFrmSweden.BtnSwedishHistClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssvertical;
  RedOutput.Lines.Clear;
  if fileexists('SwedishHist.txt') then
  begin
    assignfile(TFile, 'SwedishHist.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmSweden.FormCreate(Sender: TObject);
begin
  FrmSweden.Position := podesktopcenter;

end;

procedure TFrmSweden.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
end;

end.
