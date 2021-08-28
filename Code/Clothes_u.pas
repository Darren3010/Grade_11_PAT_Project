unit Clothes_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmClothes = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    LblDisplay: TLabel;
    LblPoints: TLabel;
    BtnCheckout: TButton;
    LblEdtName: TLabeledEdit;
    LblEdtAddress: TLabeledEdit;
    CmbShirts: TComboBox;
    RedOutput: TRichEdit;
    BtnClear: TButton;
    BtnPoints: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCheckoutClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnPointsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClothes: TFrmClothes;
  iPoints: Integer;

implementation

uses Home_u, TopSpeed_u;
{$R *.dfm}

procedure TFrmClothes.BitBtn1Click(Sender: TObject);
begin
  frmhome.show;
  FrmClothes.Hide;
end;

procedure TFrmClothes.BtnCheckoutClick(Sender: TObject);
VAR
  sName, sAddress: String;
  iItem, iNewPoints: Integer;
begin
  iNewPoints := 0;
  sName := LblEdtName.Text;
  sAddress := LblEdtAddress.Text;
  case CmbShirts.ItemIndex of
    - 1:
      begin
        ShowMessage('No item selected.');
        Exit;
      end;
    0:
      begin
        iItem := 100;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 0 end

    1:
      begin
        iItem := 150;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 1 end

    2:
      begin
        iItem := 100;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 2 end

    3:
      begin
        iItem := 90;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 3 end

    4:
      begin
        iItem := 110;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 4 end

    5:
      begin
        iItem := 50;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 5 end

    6:
      begin
        iItem := 75;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 6 end

    7:
      begin
        iItem := 30;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 7 end

    8:
      begin
        iItem := 55;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 8 end

    9:
      begin
        iItem := 200;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 9 end

    10:
      begin
        iItem := 250;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 10 end

    11:
      begin
        iItem := 175;
        iNewPoints := StrToInt(LblPoints.Caption);
        iNewPoints := iNewPoints - iItem;
        if LblEdtName.Text = '' then
        begin
          ShowMessage('No name entered.');
          Exit;
        end;
        if LblEdtAddress.Text = '' then
        begin
          ShowMessage('No address entered.');
          Exit;
        end;
        if iNewPoints > 0 then
        begin
          RedOutput.Lines.Add(sName);
          RedOutput.Lines.Add(sAddress);
          RedOutput.Lines.Add(CmbShirts.Text);
          RedOutput.Lines.Add(DateToStr(now));
          RedOutput.Lines.Add('Remaining points: ' + IntToStr(iNewPoints));
          LblPoints.Caption := IntToStr(iNewPoints);
          ShowMessage('Your ' + CmbShirts.Text +
              ' will be delivered within 3-5 working days.');
        end
        else
        begin
          ShowMessage(
            'Your previous Items if ordered will be refunded. Insufficient points. Please play more Car Trivia to earn more points.');
          LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
        end;
      end; // 11 end
  end; // case end
end;

procedure TFrmClothes.BtnClearClick(Sender: TObject);
begin
  RedOutput.Lines.Clear;
  RedOutput.Lines.Add('Item');
  RedOutput.Lines.Add('***************');
end;

procedure TFrmClothes.BtnPointsClick(Sender: TObject);
begin
  LblPoints.Caption := IntToStr(FrmTopSpeed.iTotalPoints);
end;

procedure TFrmClothes.FormCreate(Sender: TObject);
begin
  RedOutput.Lines.Clear;
  RedOutput.Lines.Add('Item');
  RedOutput.Lines.Add('***************');
  RedOutput.ReadOnly := true;
  FrmClothes.position := podesktopcenter;

end;

procedure TFrmClothes.FormShow(Sender: TObject);
begin
  RedOutput.Lines.Clear;
  RedOutput.Lines.Add('Item');
  RedOutput.Lines.Add('***************');
  LblEdtName.Text := '';
  LblEdtAddress.Text := '';
  CmbShirts.Text := 'Shirts';
  CmbShirts.ItemIndex := -1;
end;

end.
