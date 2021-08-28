unit UK_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TFrmUK = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    RedOutput: TRichEdit;
    BtnBritishCars: TButton;
    BtnBritishHistory: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnBritishHistoryClick(Sender: TObject);
    procedure BtnBritishCarsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUK: TFrmUK;
  sLine: String;
  TFile: Textfile;

implementation

uses Europe_u;
{$R *.dfm}

procedure TFrmUK.BitBtn1Click(Sender: TObject);
begin
  frmeurope.Show;
  FrmUK.Hide;
end;

procedure TFrmUK.BtnBritishCarsClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssnone;
  RedOutput.Lines.Clear;
  if fileexists('Textfile\BritishCars.txt') then
    AssignFile(TFile, 'Textfile\BritishCars.txt');
  reset(TFile);
  begin
    while not eof(TFile) do
    begin
      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmUK.BtnBritishHistoryClick(Sender: TObject);
begin
  RedOutput.ScrollBars := ssvertical;
  RedOutput.Lines.Clear;
  if fileexists('Textfile\BritishCarHist.txt') then
  begin
    AssignFile(TFile, 'Textfile\BritishCarHist.txt');
    reset(TFile);
    while not eof(TFile) do
    begin

      readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;

  end;
end;

procedure TFrmUK.FormCreate(Sender: TObject);
begin
  FrmUK.Position := podesktopcenter;

end;

procedure TFrmUK.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
end;

end.
