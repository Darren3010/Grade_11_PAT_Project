unit Oceanic_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons;

type
  TFrmOceanic = class(TForm)
    ImgBackground: TImage;
    BtnAustralia: TButton;
    BitBtn1: TBitBtn;
    LblCountry: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnAustraliaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOceanic: TFrmOceanic;

implementation

uses Home_u, Australia_u;
{$R *.dfm}

procedure TFrmOceanic.BitBtn1Click(Sender: TObject);
begin
  FrmOceanic.Hide;
  frmhome.Show;
end;

procedure TFrmOceanic.BtnAustraliaClick(Sender: TObject);
begin
  frmaustralia.Show;
  FrmOceanic.Hide;
end;

procedure TFrmOceanic.FormCreate(Sender: TObject);
begin
  FrmOceanic.Position := podesktopcenter;
end;

end.
