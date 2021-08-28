unit CarTrivia_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg, ComCtrls;

type
  TFrmCarTrivia = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    RedOutput: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCarTrivia: TFrmCarTrivia;

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmCarTrivia.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmCarTrivia.Hide;
end;

procedure TFrmCarTrivia.FormCreate(Sender: TObject);
begin
  FrmCarTrivia.Position := podesktopcenter;
end;

end.
