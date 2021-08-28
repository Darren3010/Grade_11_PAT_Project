unit Europe_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons;

type
  TFrmEurope = class(TForm)
    ImgBackground: TImage;
    BtnSweden: TButton;
    BtnUK: TButton;
    BtnFrance: TButton;
    BtnItaly: TButton;
    BtnGermany: TButton;
    BitBtn2: TBitBtn;
    LblCountry: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnUKClick(Sender: TObject);
    procedure BtnFranceClick(Sender: TObject);
    procedure BtnItalyClick(Sender: TObject);
    procedure BtnGermanyClick(Sender: TObject);
    procedure BtnSwedenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEurope: TFrmEurope;

implementation

uses Home_u, UK_u, Sweden_u, Italy_u, Germany_u, France_u;
{$R *.dfm}

procedure TFrmEurope.BitBtn2Click(Sender: TObject);
begin
  FrmEurope.hide;
  frmhome.Show;
end;

procedure TFrmEurope.BtnFranceClick(Sender: TObject);
begin
  frmfrance.Show;
  FrmEurope.hide;
end;

procedure TFrmEurope.BtnGermanyClick(Sender: TObject);
begin
  frmgermany.Show;
  FrmEurope.hide;
end;

procedure TFrmEurope.BtnItalyClick(Sender: TObject);
begin
  frmitaly.Show;
  FrmEurope.hide;
end;

procedure TFrmEurope.BtnSwedenClick(Sender: TObject);
begin
  frmsweden.Show;
  FrmEurope.hide;
end;

procedure TFrmEurope.BtnUKClick(Sender: TObject);
begin
  frmuk.Show;
  FrmEurope.hide;
end;

procedure TFrmEurope.FormCreate(Sender: TObject);
begin
  FrmEurope.Position := podesktopcenter;
end;

end.
