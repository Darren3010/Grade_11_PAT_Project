unit Japan_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg, ComCtrls;

type
  TFrmJapan = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    RedOutput: TRichEdit;
    BtnJapaneseCars: TButton;
    BtnJapaneseHistory: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnJapaneseCarsClick(Sender: TObject);
    procedure BtnJapaneseHistoryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmJapan: TFrmJapan;
  sLine: String;
  TFile: Textfile;

implementation

uses Asia_u;
{$R *.dfm}

procedure TFrmJapan.BitBtn1Click(Sender: TObject);
begin
  frmasia.Show;
  FrmJapan.Hide;
end;

procedure TFrmJapan.BtnJapaneseCarsClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssnone;
  RedOutput.Lines.Clear;
  if fileexists('Textfile\JapaneseCars.txt') then
  begin
    assignfile(TFile, 'Textfile\JapaneseCars.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmJapan.BtnJapaneseHistoryClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssvertical;
  RedOutput.Lines.Clear;
  if fileexists('Textfile\JapaneseHist.txt') then
  begin
    assignfile(TFile, 'Textfile\JapaneseHist.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmJapan.FormCreate(Sender: TObject);
begin
  FrmJapan.Position := podesktopcenter;
end;

procedure TFrmJapan.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
end;

end.
