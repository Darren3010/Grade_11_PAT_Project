unit Italy_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TFrmItaly = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    RedOutput: TRichEdit;
    BtnItalianCars: TButton;
    BtnItalianHist: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnItalianCarsClick(Sender: TObject);
    procedure BtnItalianHistClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmItaly: TFrmItaly;
  sLine: String;
  TFile: Textfile;

implementation

uses Europe_u;
{$R *.dfm}

procedure TFrmItaly.BitBtn1Click(Sender: TObject);
begin
  frmeurope.Show;
  FrmItaly.hide;
end;

procedure TFrmItaly.BtnItalianCarsClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssnone;
  RedOutput.Lines.Clear;
  if fileexists('ItalianCars.txt') then
  begin
    assignfile(TFile, 'ItalianCars.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmItaly.BtnItalianHistClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssvertical;
  RedOutput.Lines.Clear;
  if fileexists('ItalianHist.txt') then
  begin
    assignfile(TFile, 'ItalianHist.txt');
    reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmItaly.FormCreate(Sender: TObject);
begin
  FrmItaly.Position := podesktopcenter;
end;

procedure TFrmItaly.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
end;

end.
