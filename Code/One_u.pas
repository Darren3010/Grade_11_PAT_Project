unit One_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmOne = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    CmbSale: TComboBox;
    BtnCheckout: TButton;
    ImgGoodForSale: TImage;
    RedDisplay: TRichEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCheckoutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOne: TFrmOne;

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmOne.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmOne.Hide;
end;

procedure TFrmOne.BtnCheckoutClick(Sender: TObject);
VAR
  iCmbOption, iExpireMonth, iExpireYear, iCurrentMonth, iCurrentYear, i,
    k: Integer;
  sCardNumber, sCVC, sExpireDate, sName, sDate, sItem: String;
  dDate: TDate;
  bValidCardNumber, bValidCVC, bValidExpiryDate: Boolean;
  rPrice, rVat: Real;
  TFile: Textfile;
begin
  dDate := Date;
  bValidCardNumber := true;
  bValidCVC := true;
  bValidExpiryDate := false; // Setting the boolean variable to false because the default value is True
  i := 0;
  k := 0;
  RedDisplay.Paragraph.TabCount := 1;
  RedDisplay.Paragraph.Tab[0] := 90;
  iCmbOption := CmbSale.ItemIndex; // Storing the Item chosen
  sName := InputBox('Name and Surname', 'Enter your name and surname', '');
  sCardNumber := InputBox('Card Number', 'Enter your card number(16 digits)',
    '');
  sCVC := InputBox('CVC', 'Enter your card''s CVC', '');
  sExpireDate := InputBox('Expiry Date', 'Enter you cards Expiry Date',
    'YYYYMM');
  sDate := FormatDateTime('dd/mm/yyyy', dDate); // Formatting the date
  iCurrentMonth := StrToInt(copy(sDate, 4, 2));
  // Obtaining the current month date
  iCurrentYear := StrToInt(copy(sDate, 7, 2));
  // Obtaining the current year date
  iExpireYear := StrToInt(copy(sExpireDate, 1, 4));
  // Obtaining card expiry year
  iExpireMonth := StrToInt(copy(sExpireDate, 5, 2));
  // obtaining card expiry month

  case iCmbOption of // using a case statement to determine the price of the Item
    0:
      begin
        sItem := CmbSale.Text;
        rVat := 15600 * 0.15;
        rPrice := (15600) + rVat;
        RedDisplay.Lines.Add(sName + #13);
        RedDisplay.Lines.Add(sItem);
        RedDisplay.Lines.Add('Price excl. VAT:' + #9 + '$15600');
        RedDisplay.Lines.Add('Price with VAT: ' + #9 + FloatToStrF(rPrice,
            ffcurrency, 9, 2));
      end;

    1:
      begin
        sItem := CmbSale.Text;
        rVat := 10000 * 0.15;
        rPrice := (10000) + rVat;
        RedDisplay.Lines.Add(sName + #13);
        RedDisplay.Lines.Add(sItem);
        RedDisplay.Lines.Add('Price excl. VAT:' + #9 + '$10000');
        RedDisplay.Lines.Add('Price with VAT: ' + #9 + FloatToStrF(rPrice,
            ffcurrency, 9, 2));
      end;

    2:
      begin
        sItem := CmbSale.Text;
        rVat := 13000 * 0.15;
        rPrice := (13000) + rVat;
        RedDisplay.Lines.Add(sName + #13);
        RedDisplay.Lines.Add(sItem);
        RedDisplay.Lines.Add('Price excl. VAT:' + #9 + '$13000');
        RedDisplay.Lines.Add('Price with VAT: ' + #9 + FloatToStrF(rPrice,
            ffcurrency, 9, 2));
      end;

    3:
      begin
        sItem := CmbSale.Text;
        rVat := 12500 * 0.15;
        rPrice := (12500) + rVat;
        RedDisplay.Lines.Add(sName + #13);
        RedDisplay.Lines.Add(sItem);
        RedDisplay.Lines.Add('Price excl. VAT:' + #9 + '$12500');
        RedDisplay.Lines.Add('Price with VAT: ' + #9 + FloatToStrF(rPrice,
            ffcurrency, 9, 2));
      end;

    4:
      begin
        sItem := CmbSale.Text;
        rVat := 14000 * 0.15;
        rPrice := (14000) + rVat;
        RedDisplay.Lines.Add(sName + #13);
        RedDisplay.Lines.Add(sItem);
        RedDisplay.Lines.Add('Price excl. VAT:' + #9 + '$14000');
        RedDisplay.Lines.Add('Price with VAT: ' + #9 + FloatToStrF(rPrice,
            ffcurrency, 9, 2));
      end;

  end;
  for i := 1 to length(sCardNumber) do // Using a loop to run through each character in the variable
  begin
    if sCardNumber[i] in ['A' .. 'Z', 'a' .. 'z'] then // Making sure there are no letters entered in the card number
    begin
      bValidCardNumber := false;
    end; // if end
  end; // for end
  for i := 1 to length(sCVC) do // Using a loop to run through each character in the variable
  begin
    if sCVC[i] in ['A' .. 'Z', 'a' .. 'z'] then // Making sure there are no letters entered in the CVC
    begin
      bValidCVC := false;
    end; // if end
  end; // for end
  if (bValidCardNumber = false) and (bValidCVC = false) then
  begin
    showmessage('Incorect Card details entered.');
    Exit;
  end;
  if ((iExpireYear > iCurrentYear) and (iExpireMonth >= iCurrentMonth)) then
  begin
    bValidExpiryDate := true;
  end; // if end
  if (length(sCardNumber) = 16) and (length(sCVC) = 4) and // Multiple conditions checking whether correct details have been entered.
    (bValidCardNumber = true) and (bValidCVC = true) and
    (bValidExpiryDate = true) then
  begin
    AssignFile(TFile, 'Reciept.txt');
    reset(TFile);
    Append(TFile);
    writeln(TFile, sName);
    writeln(TFile, sItem);
    writeln(TFile, FloatToStrF(rPrice, ffcurrency, 9, 2));
    writeln(TFile, sDate);
    CloseFile(TFile);
    showmessage('Payment successfully processed.');
  end
  else
  begin
    showmessage('Incorrect Details entered.');
    Exit; // Exiting program if conditions are not met
  end;
end;

procedure TFrmOne.FormCreate(Sender: TObject);
begin
  FrmOne.Position := podesktopcenter; // Aligning the form with the center of the desktop
end;

procedure TFrmOne.FormShow(Sender: TObject);
begin
  CmbSale.ItemIndex := -1;
  RedDisplay.Lines.Clear;
  ImgGoodForSale.Picture := Nil;
end;

end.
