unit GiftShop_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg;

type
  TFrmGiftShop = class(TForm)
    ImgBackgorund: TImage;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGiftShop: TFrmGiftShop;

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmGiftShop.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmGiftShop.Hide;
end;

procedure TFrmGiftShop.FormCreate(Sender: TObject);
begin
  FrmGiftShop.Position := podesktopcenter;
end;

end.
