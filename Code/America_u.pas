unit America_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons;

type
  TFrmAmerica = class(TForm)
    ImgBackground: TImage;
    BtnAmerica: TButton;
    BitBtn1: TBitBtn;
    LblCountry: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnAmericaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAmerica: TFrmAmerica;

implementation

uses Home_u, USA_u;
{$R *.dfm}

procedure TFrmAmerica.BitBtn1Click(Sender: TObject);
begin
  FrmAmerica.Hide;
  frmhome.Show;
end;

procedure TFrmAmerica.BtnAmericaClick(Sender: TObject);
begin
  frmusa.Show;
  FrmAmerica.Hide;
end;

procedure TFrmAmerica.FormCreate(Sender: TObject);
begin
  FrmAmerica.Position := podesktopcenter;
end;

end.
