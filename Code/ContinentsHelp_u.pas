unit ContinentsHelp_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TFrmContinents = class(TForm)
    ImgEurope: TImage;
    ImgAsia: TImage;
    ImgAmerica: TImage;
    ImgOceanic: TImage;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContinents: TFrmContinents;

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmContinents.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmContinents.Hide;
end;

procedure TFrmContinents.FormCreate(Sender: TObject);
begin
  FrmContinents.Position := podesktopcenter;
end;

end.
