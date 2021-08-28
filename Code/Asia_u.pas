unit Asia_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons;

type
  TFrmAsia = class(TForm)
    ImgBackground: TImage;
    BtnJapan: TButton;
    BitBtn1: TBitBtn;
    LblCountry: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnJapanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAsia: TFrmAsia;

implementation

uses Home_u, Japan_u;
{$R *.dfm}

procedure TFrmAsia.BitBtn1Click(Sender: TObject);
begin
  FrmAsia.Hide;
  frmhome.Show;
end;

procedure TFrmAsia.BtnJapanClick(Sender: TObject);
begin
  frmjapan.Show;
  FrmAsia.Hide;
end;

procedure TFrmAsia.FormCreate(Sender: TObject);
begin
  FrmAsia.Position := podesktopcenter;
end;

end.
