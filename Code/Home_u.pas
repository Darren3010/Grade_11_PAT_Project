unit Home_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Menus, StdCtrls, Buttons, Europe_u, America_u,
  Asia_u, Oceanic_u, ComCtrls;

type
  TFrmHome = class(TForm)
    ImgBackground: TImage;
    PnlNavigation: TPanel;
    CmbContinents: TComboBox;
    CmbHallofFame: TComboBox;
    CmbHelp: TComboBox;
    CmbTrivia: TComboBox;
    CmbShop: TComboBox;
    BtBtn: TBitBtn;
    RedOutput: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmbContinentsChange(Sender: TObject);
    procedure CmbHallofFameChange(Sender: TObject);
    procedure CmbHelpChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmbShopChange(Sender: TObject);
    procedure CmbTriviaChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHome: TFrmHome;

implementation

uses Corvette_u, DB5_u, EType_u, F40_u, Golf_u, GT40_u, Merc300SL_u, Miura_u,
  Mustang_u, Porsche911_u, CarTrivia_u, ContinentsHelp_u, GiftShop_u,
  HallofFame_u, Year_u, TopSpeed_u, Races_u, Clothes_u, Model_u, One_u;
{$R *.dfm}

procedure TFrmHome.CmbContinentsChange(Sender: TObject);
begin
  if CmbContinents.ItemIndex = 0 then
  begin
    FrmHome.Hide;
    frmeurope.Show;
  end;
  if CmbContinents.ItemIndex = 1 then
  begin
    FrmHome.Hide;
    frmamerica.Show;
  end;
  if CmbContinents.ItemIndex = 2 then
  begin
    FrmHome.Hide;
    frmasia.Show;
  end;
  if CmbContinents.ItemIndex = 3 then
  begin
    FrmHome.Hide;
    frmoceanic.Show;
  end;
end;

procedure TFrmHome.CmbHallofFameChange(Sender: TObject);
begin
  if CmbHallofFame.ItemIndex = 0 then
  begin
    frmporsche911.Show;
    FrmHome.Hide;
  end;
  if CmbHallofFame.ItemIndex = 1 then
  begin
    frmmustang.Show;
    FrmHome.Hide;
  end;
  if CmbHallofFame.ItemIndex = 2 then
  begin
    frmmiura.Show;
    FrmHome.Hide;
  end;
  if CmbHallofFame.ItemIndex = 3 then
  begin
    frm300sl.Show;
    FrmHome.Hide;
  end;
  if CmbHallofFame.ItemIndex = 4 then
  begin
    frmf40.Show;
    FrmHome.Hide;
  end;
  if CmbHallofFame.ItemIndex = 5 then
  begin
    frmgt40.Show;
    FrmHome.Hide;
  end;
  if CmbHallofFame.ItemIndex = 6 then
  begin
    frmdb5.Show;
    FrmHome.Hide;
  end;
  if CmbHallofFame.ItemIndex = 7 then
  begin
    frmgolf.Show;
    FrmHome.Hide;
  end;
  if CmbHallofFame.ItemIndex = 8 then
  begin
    frmetype.Show;
    FrmHome.Hide;
  end;
  if CmbHallofFame.ItemIndex = 9 then
  begin
    frmcorvette.Show;
    FrmHome.Hide;
  end;

end;

procedure TFrmHome.CmbHelpChange(Sender: TObject);
VAR
  sLine: String;
  TFile: Textfile;
begin
  if CmbHelp.ItemIndex = 0 then
  begin
    RedOutput.Visible := true;
    RedOutput.Lines.Clear;
    assignfile(TFile, 'Textfile\ContinentText.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;

  if CmbHelp.ItemIndex = 1 then
  begin
    RedOutput.Visible := true;
    RedOutput.Lines.Clear;
    assignfile(TFile, 'Textfile\HallHelp.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;

  if CmbHelp.ItemIndex = 2 then
  begin
    RedOutput.Visible := true;
    RedOutput.Lines.Clear;
    assignfile(TFile, 'Textfile\CarTriviaHelp.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;

  if CmbHelp.ItemIndex = 3 then
  begin
    RedOutput.Visible := true;
    RedOutput.Lines.Clear;
    assignfile(TFile, 'Textfile\GiftHelp.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end;
  end;
end;

procedure TFrmHome.CmbShopChange(Sender: TObject);
begin
  if CmbShop.ItemIndex = 0 then
  begin
    frmclothes.Show;
    FrmHome.Hide;
  end;
  if CmbShop.ItemIndex = 1 then
  begin
    frmone.Show;
    FrmHome.Hide;
  end;

end;

procedure TFrmHome.CmbTriviaChange(Sender: TObject);
begin
  if CmbTrivia.ItemIndex = 0 then
  begin
    FrmYear.Show;
    FrmHome.Hide;
  end;
  if CmbTrivia.ItemIndex = 1 then
  begin
    FrmRaces.Show;
    FrmHome.Hide;
  end;
  if CmbTrivia.ItemIndex = 2 then
  begin
    FrmTopSpeed.Show;
    FrmHome.Hide;
  end;
end;

procedure TFrmHome.FormCreate(Sender: TObject);
begin
  FrmHome.Position := podesktopcenter;
end;

procedure TFrmHome.FormShow(Sender: TObject);
begin
  CmbContinents.SetFocus;
  RedOutput.Lines.Clear;
  RedOutput.Visible := false;
  CmbContinents.Text := 'Continents';
  CmbHallofFame.Text := 'Hall of Fame';
  CmbHelp.Text := 'Help';
  CmbTrivia.Text := 'Car Trivia';
  CmbShop.Text := 'Gift Shop';
end;

end.
