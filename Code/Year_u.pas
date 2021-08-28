unit Year_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmYear = class(TForm)
    ImgBackground: TImage;
    BitBtn1: TBitBtn;
    BtnStart: TButton;
    BtnRules: TButton;
    RedDisplay: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnRulesClick(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmYear: TFrmYear;
  sArrQuestion: Array [1 .. 20] of String = (
    'Alfa Romeo Spider 1600 Duetto',
    'Ferrari 365 Daytona',
    'Ferrari GTO',
    'Ferrari F40',
    'Lamborghini Diablo',
    'Lancia Stratos',
    'Alpine A110 1600S',
    'Peugot 905B Evo 1',
    'BMW 507',
    'BMW 2002 Turbo',
    'Mercedes Sauber C9',
    'Jaguar E-Type',
    'Triumph Spitfire 1500',
    'Honda NSX',
    'Mazda MX-5',
    'Nissan Skyline R32',
    'Toyota 7',
    'Chevrolette Corvette 1 Generation',
    'Ford Mach 1 Mustang',
    'Ford GT40 Gulf Livery'
  );
  sArrAnswer: Array [1 .. 20] of String = (
    '1966',
    '1971',
    '1984',
    '1990',
    '1976',
    '1977',
    '1966',
    '1981',
    '1957',
    '1973',
    '1989',
    '1960',
    '1965',
    '1990',
    '1990',
    '1990',
    '1967',
    '1969',
    '1970',
    '1967'
  );

  sArrPrizes: Array [1 .. 5] of String = (
    'Free trip to the GT Classic Car Museum',
    '1:8 Scale Model of a Mercedes 300SL',
    'Ferrari Scuderia #16 Shirt',
    'Tickets for 2 fully accomodated for the Le Mans America.',
    '1:17 Scale model of the SF2004.'
  );

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmYear.BitBtn1Click(Sender: TObject);
begin
  frmhome.Show;
  FrmYear.Hide;
end;

procedure TFrmYear.BtnRulesClick(Sender: TObject);
begin
  RedDisplay.Visible := true;
  BtnRules.Caption := 'Hide Rules.';
end;

procedure TFrmYear.BtnStartClick(Sender: TObject);
VAR
  sAnswer, sPrize, sName: String;
  I, iCount: Integer;
  TFile: Textfile;
begin
  sName := InputBox('Enter your name', 'Please enter your name and surname.',
    '');
  RedDisplay.Visible := false;
  iCount := 0;
  I := 0;
  for I := 1 to 20 do // Using a loop to display the questions and obtain the answers from an inputbox
  begin
    sAnswer := InputBox('In which year was the ',
      sArrQuestion[I] + ' manufactured?', '');
    if sAnswer = sArrAnswer[I] then
    begin
      inc(iCount); // Using a counter variable to keep track of the correct answers
    end;
  end;
  RedDisplay.Visible := true;
  RedDisplay.Lines.Clear;
  RedDisplay.Lines.Add('You have got ' + IntToStr(iCount)
      + ' answers correct.');
  if iCount > 17 then // If statement to determine if the user has met the minimum standards to win a prize
  begin
    sPrize := sArrPrizes[random(7) + 1]; // Randomly deciding on a prize with the possibilty of not winning anything
    if sPrize <> '' then
    begin
      RedDisplay.Lines.Add('You have won: ' + sPrize); // Displaying the prize
      if fileexists('CarTriviaWinners.txt') then
      begin
        AssignFile(TFile, 'CarTriviaWinners.txt');
        Reset(TFile);
        Append(TFile);
        Writeln(TFile, sName + '@' + sPrize);
        closefile(TFile);
      end; // if fileexists end
    end
    else
    begin
      ShowMessage(
        'While you had enough correct answers to stand a chance of winning a prize you did not win a prize.');
      ShowMessage('Better luck next time.');
    end;
  end
  else
  begin
    RedDisplay.Lines.Add(
      'You do not have enough correct answers to win a prize.');
  end;
end;

procedure TFrmYear.FormCreate(Sender: TObject);
begin
  FrmYear.Position := podesktopcenter;
end;

procedure TFrmYear.FormShow(Sender: TObject);
begin
  BtnRules.Caption := 'Rules';
  RedDisplay.Visible := false;
end;

end.
