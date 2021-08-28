unit EditHome_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, jpeg;

type
  TFrmEditHome = class(TForm)
    Pgctrl: TPageControl;
    TSNew: TTabSheet;
    TSHelp: TTabSheet;
    TSView: TTabSheet;
    RgrpView: TRadioGroup;
    RedOutput: TRichEdit;
    ImgFiller: TImage;
    RedDisplay: TRichEdit;
    BtnSave: TButton;
    BtnContinent: TButton;
    BtnGiftShop: TButton;
    BtnHallHelp: TButton;
    BtnCarTrivia: TButton;
    CmbCountry: TComboBox;
    LblEdtExhibit: TLabeledEdit;
    LblEdtCarName: TLabeledEdit;
    LblEdtYear: TLabeledEdit;
    BtnValidate: TButton;
    ImgContinent: TImage;
    PnlFiller: TPanel;
    TSGuest: TTabSheet;
    BtnGuestLogin: TButton;
    procedure RgrpViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnContinentClick(Sender: TObject);
    procedure BtnHallHelpClick(Sender: TObject);
    procedure BtnCarTriviaClick(Sender: TObject);
    procedure BtnGiftShopClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnValidateClick(Sender: TObject);
    procedure BtnGuestLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditHome: TFrmEditHome;
  TFile: TextFile;
  sLine: String;

implementation

uses Home_u;
{$R *.dfm}

procedure TFrmEditHome.BtnCarTriviaClick(Sender: TObject);
begin
  RedDisplay.Lines.Clear;
  if fileexists('Textfile\CarTriviaHelp.txt') then
  begin
    AssignFile(TFile, 'Textfile\CarTriviaHelp.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedDisplay.Lines.Add(sLine);
    end;
  end;
  ShowMessage(
    'If you want to make any changes to the file please enter them on the Richedit and then click on the save button.');
end;

procedure TFrmEditHome.BtnContinentClick(Sender: TObject);
begin
  RedDisplay.Lines.Clear;
  if fileexists('Textfile\ContinentText.txt') then
  begin
    AssignFile(TFile, 'Textfile\ContinentText.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedDisplay.Lines.Add(sLine);
    end;
  end;
  ShowMessage(
    'If you want to make any changes to the file please enter them on the Richedit and then click on the save button.');
end;

procedure TFrmEditHome.BtnGiftShopClick(Sender: TObject);
begin
  RedDisplay.Lines.Clear;
  if fileexists('Textfile\GiftHelp.txt') then
  begin
    AssignFile(TFile, 'Textfile\GiftHelp.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedDisplay.Lines.Add(sLine);
    end;
  end;
  ShowMessage(
    'If you want to make any changes to the file please enter them on the Richedit and then click on the save button.');
end;

procedure TFrmEditHome.BtnGuestLoginClick(Sender: TObject);
begin
  FrmEditHome.Hide;
  FrmHome.Show;
end;

procedure TFrmEditHome.BtnHallHelpClick(Sender: TObject);
begin
  RedDisplay.Lines.Clear;
  if fileexists('Textfile\HallHelp.txt') then
  begin
    AssignFile(TFile, 'Textfile\HallHelp.txt');
    Reset(TFile);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedDisplay.Lines.Add(sLine);
    end;
  end;
  ShowMessage(
    'If you want to make any changes to the file please enter them on the Richedit and then click on the save button.');
end;

procedure TFrmEditHome.BtnSaveClick(Sender: TObject);
VAR
  sFile, sChange: String;
  TFile1: TextFile;
begin
  closefile(TFile); // Ensuring that the textfiles are closed before working with them to avoid an I/O error 32
  sFile := InputBox('File Number', // determining which file the chang  must be made to
    'Please enter the number of the File that you would like to edit.', '');
  sChange := RedDisplay.Text; // Obtaining the changes from the Richedit
  RedDisplay.Lines.Clear;
  if sFile = '1' then
  begin
    AssignFile(TFile1, 'Textfile\ContinentText.txt');
    rewrite(TFile1);
    writeln(TFile1, sChange);
    closefile(TFile1);
    ShowMessage('Changes made');
  end;

  if sFile = '2' then
  begin
    AssignFile(TFile1, 'Textfile\HallHelp.txt');
    rewrite(TFile1);
    writeln(TFile1, sChange);
    closefile(TFile1);
    ShowMessage('Changes made');
  end;

  if sFile = '3' then
  begin
    AssignFile(TFile1, 'Textfile\CarTriviaHelp.txt');
    rewrite(TFile1);
    writeln(TFile1, sChange);
    closefile(TFile1);
    ShowMessage('Changes made');
  end;

  if sFile = '4' then
  begin
    AssignFile(TFile1, 'Textfile\GiftHelp.txt');
    rewrite(TFile1);
    writeln(TFile1, sChange);
    closefile(TFile1);
    ShowMessage('Changes made');
  end;
end;

procedure TFrmEditHome.BtnValidateClick(Sender: TObject);
VAR
  sExhibit, sExhibitFile, sCar, sLine: String;
  iYear, iDifference, iPos: Integer;
  TFile, TFile1: TextFile;
  bValidExhibit: Boolean;
begin
  bValidExhibit := true;
  sExhibit := LblEdtExhibit.Text;
  sCar := LblEdtCarName.Text;
  iYear := StrToInt(LblEdtYear.Text);
  case CmbCountry.ItemIndex of
    0:
      begin
        ImgContinent.Picture.LoadFromFile('Pictures\America.JPEG');
        iDifference := 2020 - iYear;
        AssignFile(TFile, 'Textfile\AmericanCars.txt');
        Reset(TFile);
        while not eof(TFile) do
        begin
          Readln(TFile, sLine);
          iPos := Pos('-', sLine);
          sExhibitFile := copy(sLine, iPos + 2, 10);
          if (uppercase(sExhibit) = uppercase(sExhibitFile)) then
            bValidExhibit := false;
        end; // While end
        if (iDifference > 29) and (bValidExhibit = true) then
        begin
          closefile(TFile);

          AssignFile(TFile1, 'Textfile\AmericanCars.txt');
          Reset(TFile1);
          append(TFile1);
          writeln(TFile1, sCar + ' - ' + sExhibit);
          closefile(TFile1);
          ShowMessage(
            'Exhibit successfully created. Please login as a Guest to see the changes.');
        end // If end
        else
        begin
          ShowMessage(
            'The car must be older than 30 years and the exhibit canno be the same as one that already exists.');
        end;
      end; // 0 end

    1:
      begin
        ImgContinent.Picture.LoadFromFile('Pictures\Asia.JPEG');
        iDifference := 2020 - iYear;
        AssignFile(TFile, 'Textfile\JapaneseCars.txt');
        Reset(TFile);
        while not eof(TFile) do
        begin
          Readln(TFile, sLine);
          iPos := Pos('-', sLine);
          sExhibitFile := copy(sLine, iPos + 2, 10);
          if (uppercase(sExhibit) = uppercase(sExhibitFile)) then
            bValidExhibit := false;
        end; // While end
        if (iDifference > 29) and (bValidExhibit = true) then
        begin
          closefile(TFile);
          AssignFile(TFile1, 'Textfile\Japanese.txt');
          Reset(TFile1);
          append(TFile1);
          writeln(TFile1, sCar + ' - ' + sExhibit);
          closefile(TFile1);
          ShowMessage(
            'Exhibit successfully created. Please login as a Guest to see the changes.');
        end // If end
        else
        begin
          ShowMessage(
            'The car must be older than 30 years and the exhibit canno be the same as one that already exists.');
        end;
      end; // 0 end

    2:
      begin
        ImgContinent.Picture.LoadFromFile('Pictures\Australia.JPEG');
        iDifference := 2020 - iYear;
        AssignFile(TFile, 'Textfile\AustralianCars.txt');
        Reset(TFile);
        while not eof(TFile) do
        begin
          Readln(TFile, sLine);
          iPos := Pos('-', sLine);
          sExhibitFile := copy(sLine, iPos + 2, 10);
          if (uppercase(sExhibit) = uppercase(sExhibitFile)) then
            bValidExhibit := false;
        end; // While end
        if (iDifference > 29) and (bValidExhibit = true) then
        begin
          closefile(TFile);
          AssignFile(TFile1, 'Textfile\AustralianCars.txt');
          Reset(TFile1);
          append(TFile1);
          writeln(TFile1, sCar + ' - ' + sExhibit);
          closefile(TFile1);
          ShowMessage(
            'Exhibit successfully created. Please login as a Guest to see the changes.');
        end // If end
        else
        begin
          ShowMessage(
            'The car must be older than 30 years and the exhibit canno be the same as one that already exists.');
        end;
      end; // 0 end

    3:
      begin
        ImgContinent.Picture.LoadFromFile('Pictures\Europe Green.JPEG');
        iDifference := 2020 - iYear;
        AssignFile(TFile, 'Textfile\SwedishCars.txt');
        Reset(TFile);
        while not eof(TFile) do
        begin
          Readln(TFile, sLine);
          iPos := Pos('-', sLine);
          sExhibitFile := copy(sLine, iPos + 2, 10);
          if (uppercase(sExhibit) = uppercase(sExhibitFile)) then
            bValidExhibit := false;
        end; // While end
        if (iDifference > 29) and (bValidExhibit = true) then
        begin
          closefile(TFile);
          AssignFile(TFile1, 'Textfile\SwedishCars.txt');
          Reset(TFile1);
          append(TFile1);
          writeln(TFile1, sCar + ' - ' + sExhibit);
          closefile(TFile1);
          ShowMessage(
            'Exhibit successfully created. Please login as a Guest to see the changes.');
        end // If end
        else
        begin
          ShowMessage(
            'The car must be older than 30 years and the exhibit canno be the same as one that already exists.');
        end;
      end; // 0 end

    4:
      begin
        ImgContinent.Picture.LoadFromFile('Pictures\Europe Green.JPEG');
        iDifference := 2020 - iYear;
        AssignFile(TFile, 'Textfile\FrenchCars.txt');
        Reset(TFile);
        while not eof(TFile) do
        begin
          Readln(TFile, sLine);
          iPos := Pos('-', sLine);
          sExhibitFile := copy(sLine, iPos + 2, 10);
          if (uppercase(sExhibit) = uppercase(sExhibitFile)) then
            bValidExhibit := false;
        end; // While end
        if (iDifference > 29) and (bValidExhibit = true) then
        begin
          closefile(TFile);
          AssignFile(TFile1, 'Textfile\FrenchCars.txt');
          Reset(TFile1);
          append(TFile1);
          writeln(TFile1, sCar + ' - ' + sExhibit);
          closefile(TFile1);
          ShowMessage(
            'Exhibit successfully created. Please login as a Guest to see the changes.');
        end // If end
        else
        begin
          ShowMessage(
            'The car must be older than 30 years and the exhibit canno be the same as one that already exists.');
        end;
      end; // 0 end

    5:
      begin
        ImgContinent.Picture.LoadFromFile('Pictures\Europe Green.JPEG');
        iDifference := 2020 - iYear;
        AssignFile(TFile, 'Textfile\ItalianCars.txt');
        Reset(TFile);
        while not eof(TFile) do
        begin
          Readln(TFile, sLine);
          iPos := Pos('-', sLine);
          sExhibitFile := copy(sLine, iPos + 2, 10);
          if (uppercase(sExhibit) = uppercase(sExhibitFile)) then
            bValidExhibit := false;
        end; // While end
        if (iDifference > 29) and (bValidExhibit = true) then
        begin
          closefile(TFile);
          AssignFile(TFile1, 'Textfile\ItalianCars.txt');
          Reset(TFile1);
          append(TFile1);
          writeln(TFile1, sCar + ' - ' + sExhibit);
          closefile(TFile1);
          ShowMessage(
            'Exhibit successfully created. Please login as a Guest to see the changes.');
        end // If end
        else
        begin
          ShowMessage(
            'The car must be older than 30 years and the exhibit canno be the same as one that already exists.');
        end;
      end; // 0 end

    6:
      begin
        ImgContinent.Picture.LoadFromFile('Pictures\Europe Green.JPEG');
        iDifference := 2020 - iYear;
        AssignFile(TFile, 'Textfile\GermanCars.txt');
        Reset(TFile);
        while not eof(TFile) do
        begin
          Readln(TFile, sLine);
          iPos := Pos('-', sLine);
          sExhibitFile := copy(sLine, iPos + 2, 10);
          if (uppercase(sExhibit) = uppercase(sExhibitFile)) then
            bValidExhibit := false;
        end; // While end
        if (iDifference > 29) and (bValidExhibit = true) then
        begin
          closefile(TFile);
          AssignFile(TFile1, 'Textfile\GermanCars.txt');
          Reset(TFile1);
          append(TFile1);
          writeln(TFile1, sCar + ' - ' + sExhibit);
          closefile(TFile1);
          ShowMessage(
            'Exhibit successfully created. Please login as a Guest to see the changes.');
        end // If end
        else
        begin
          ShowMessage(
            'The car must be older than 30 years and the exhibit canno be the same as one that already exists.');
        end;
      end; // 0 end

    7:
      begin
        ImgContinent.Picture.LoadFromFile('Pictures\Europe Green.JPEG');
        iDifference := 2020 - iYear;
        AssignFile(TFile, 'Textfile\BritishCars.txt');
        Reset(TFile);
        while not eof(TFile) do
        begin
          Readln(TFile, sLine);
          iPos := Pos('-', sLine);
          sExhibitFile := copy(sLine, iPos + 2, 10);
          if (uppercase(sExhibit) = uppercase(sExhibitFile)) then
            bValidExhibit := false;
        end; // While end
        if (iDifference > 29) and (bValidExhibit = true) then
        begin
          closefile(TFile);
          AssignFile(TFile1, 'Textfile\BritishCars.txt');
          Reset(TFile1);
          append(TFile1);
          writeln(TFile1, sCar + ' - ' + sExhibit);
          closefile(TFile1);
          ShowMessage(
            'Exhibit successfully created. Please login as a Guest to see the changes.');
        end // If end
        else
        begin
          ShowMessage(
            'The car must be older than 30 years and the exhibit canno be the same as one that already exists.');
        end;
      end; // 0 end
  end; // Case end
end;

procedure TFrmEditHome.FormCreate(Sender: TObject);
begin
  FrmEditHome.Position := podesktopcenter;
  RedDisplay.ReadOnly := false;
  Pgctrl.TabIndex := 0;
end;

procedure TFrmEditHome.RgrpViewClick(Sender: TObject);
VAR
  iView, I, iPos1, iPos2: Integer;
  sName, sAge, sSurname, sLine, sPrize: String;
begin
  TSView.Enabled := true;
  RedOutput.Lines.Clear;
  I := 0;
  iView := RgrpView.ItemIndex;
  if iView = 0 then
  begin
    AssignFile(TFile, 'Textfile\Name_Surname_Age.txt');
    Reset(TFile);
    RedOutput.Lines.Add('Name' + #9 + 'Surname' + #9 + #9 + 'Age' + #13);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      iPos1 := Pos('@', sLine);
      iPos2 := Pos('#', sLine);
      sName := copy(sLine, 1, iPos1 - 1);
      sSurname := copy(sLine, iPos1 + 1, ((iPos2 - 1) - (iPos1)));
      sAge := copy(sLine, iPos2 + 1);
      RedOutput.Lines.Add(sName + #9 + sSurname + #9 + sAge);
    end; // while end
  end; // rgrp if end

  if iView = 1 then
  begin
    AssignFile(TFile, 'Textfile\CarTriviaWinners.txt');
    Reset(TFile);
    RedOutput.Lines.Add('Name and Surname' + #9 + 'Prize' + #13);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      iPos1 := Pos('@', sLine);
      sName := copy(sLine, 1, iPos1 - 1);
      sPrize := copy(sLine, iPos1 + 1);
      RedOutput.Lines.Add(sName + #9 + sPrize);
    end; // While end
  end; // If end

  if iView = 2 then
  begin
    AssignFile(TFile, 'Textfile\Reciept.txt');
    Reset(TFile);
    RedOutput.Lines.Add(
      'These reciepts are from purchases made from the Model Shop.' + #13 +
        #13);
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end; // While end
  end; // If end

  if iView = 3 then
  begin
    AssignFile(TFile, 'Textfile\Email.txt');
    Reset(TFile);
    RedOutput.Lines.Add('These are the e-mail addresses of Admin users.');
    while not eof(TFile) do
    begin
      Readln(TFile, sLine);
      RedOutput.Lines.Add(sLine);
    end; // While end
  end; // If end

end;

end.
