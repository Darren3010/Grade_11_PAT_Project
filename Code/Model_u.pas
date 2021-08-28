unit Model_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TFrmModel = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmModel: TFrmModel;

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmModel.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmModel.Hide;
end;

procedure TFrmModel.FormCreate(Sender: TObject);
begin
  FrmModel.Position := podesktopcenter;
end;

end.
