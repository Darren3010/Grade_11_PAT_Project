unit HallofFame_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg;

type
  TFrmHallofFame = class(TForm)
    Imgbackground: TImage;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHallofFame: TFrmHallofFame;

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmHallofFame.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmHallofFame.Hide;
end;

procedure TFrmHallofFame.FormCreate(Sender: TObject);
begin
  FrmHallofFame.Position := podesktopcenter;
end;

end.
