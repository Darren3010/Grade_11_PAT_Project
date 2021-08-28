unit Splash_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls, Login_u;

type
  TFrmSplash = class(TForm)
    ImgBackground: TImage;
    LblHeading: TLabel;
    PbProgress: TProgressBar;
    LblLoading: TLabel;
    LblProgress: TLabel;
    TimProgBar: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TimLabelTimer(Sender: TObject);
    procedure TimProgBarTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;
  K: Integer = 0;
  TimLabel: TTimer; // Dynamic Component

implementation

{$R *.dfm}

procedure TFrmSplash.FormCreate(Sender: TObject);
begin
  FrmSplash.Position := podesktopcenter;
  TimLabel := TTimer.Create(FrmSplash);
  TimLabel.Interval := 200;
  TimLabel.OnTimer := TimLabelTimer; // event for timer
  TimLabel.Enabled := true;
  FrmSplash.DoubleBuffered := true; // Stopping the label from flickering
end;

procedure TFrmSplash.TimLabelTimer(Sender: TObject); // dynamic timer event
var
  chartemp: String;
  temp: String;
begin
  chartemp := ''; // setting temp. string to null
  chartemp := LblHeading.Caption[1]; // setting first character of label caption ,only getting first letter
  temp := LblHeading.Caption; // keeping entire caption
  delete(temp, 1, 1); // delete the first char from first pos in var lastly how much will i delete[1 character in this example]
  LblHeading.Caption := temp + '' + chartemp; // sumthin

end;

procedure TFrmSplash.TimProgBarTimer(Sender: TObject);
begin
  PbProgress.StepIt; // increase the green bar
  K := K + 1;
  LblProgress.Caption := inttostr(K) + '%';
  if (K = 101) then // Set to 101 so that you can see the progress reach 100
  begin
    TimProgBar.Enabled := false;
    FrmSplash.Hide;
    frmlogin.show;
  end;
end;

end.
