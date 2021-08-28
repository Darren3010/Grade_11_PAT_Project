program PAT_p;

uses
  Forms,
  Splash_u in 'Splash_u.pas' {FrmSplash},
  Login_u in 'Login_u.pas' {FrmLogin},
  Home_u in 'Home_u.pas' {FrmHome},
  EditHome_u in 'EditHome_u.pas' {FrmEditHome},
  Europe_u in 'Europe_u.pas' {FrmEurope},
  America_u in 'America_u.pas' {FrmAmerica},
  Asia_u in 'Asia_u.pas' {FrmAsia},
  Oceanic_u in 'Oceanic_u.pas' {FrmOceanic},
  Italy_u in 'Italy_u.pas' {FrmItaly},
  Sweden_u in 'Sweden_u.pas' {FrmSweden},
  Germany_u in 'Germany_u.pas' {FrmGermany},
  France_u in 'France_u.pas' {FrmFrance},
  UK_u in 'UK_u.pas' {FrmUK},
  USA_u in 'USA_u.pas' {FrmUSA},
  Japan_u in 'Japan_u.pas' {FrmJapan},
  Australia_u in 'Australia_u.pas' {FrmAustralia},
  Porsche911_u in 'Porsche911_u.pas' {FrmPorsche911},
  Mustang_u in 'Mustang_u.pas' {FrmMustang},
  Miura_u in 'Miura_u.pas' {FrmMiura},
  Merc300SL_u in 'Merc300SL_u.pas' {Frm300SL},
  F40_u in 'F40_u.pas' {FrmF40},
  GT40_u in 'GT40_u.pas' {FrmGT40},
  DB5_u in 'DB5_u.pas' {FrmDB5},
  Golf_u in 'Golf_u.pas' {FrmGolf},
  EType_u in 'EType_u.pas' {FrmEType},
  Corvette_u in 'Corvette_u.pas' {FrmCorvette},
  Year_u in 'Year_u.pas' {FrmYear},
  Races_u in 'Races_u.pas' {FrmRaces},
  TopSpeed_u in 'TopSpeed_u.pas' {FrmTopSpeed},
  Clothes_u in 'Clothes_u.pas' {FrmClothes},
  One_u in 'One_u.pas' {FrmOne};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TFrmEurope, FrmEurope);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmHome, FrmHome);
  Application.CreateForm(TFrmEditHome, FrmEditHome);
  Application.CreateForm(TFrmAmerica, FrmAmerica);
  Application.CreateForm(TFrmAsia, FrmAsia);
  Application.CreateForm(TFrmOceanic, FrmOceanic);
  Application.CreateForm(TFrmItaly, FrmItaly);
  Application.CreateForm(TFrmSweden, FrmSweden);
  Application.CreateForm(TFrmGermany, FrmGermany);
  Application.CreateForm(TFrmFrance, FrmFrance);
  Application.CreateForm(TFrmUK, FrmUK);
  Application.CreateForm(TFrmUSA, FrmUSA);
  Application.CreateForm(TFrmJapan, FrmJapan);
  Application.CreateForm(TFrmAustralia, FrmAustralia);
  Application.CreateForm(TFrmPorsche911, FrmPorsche911);
  Application.CreateForm(TFrmMustang, FrmMustang);
  Application.CreateForm(TFrmMiura, FrmMiura);
  Application.CreateForm(TFrm300SL, Frm300SL);
  Application.CreateForm(TFrmF40, FrmF40);
  Application.CreateForm(TFrmGT40, FrmGT40);
  Application.CreateForm(TFrmDB5, FrmDB5);
  Application.CreateForm(TFrmGolf, FrmGolf);
  Application.CreateForm(TFrmEType, FrmEType);
  Application.CreateForm(TFrmCorvette, FrmCorvette);
  Application.CreateForm(TFrmYear, FrmYear);
  Application.CreateForm(TFrmRaces, FrmRaces);
  Application.CreateForm(TFrmTopSpeed, FrmTopSpeed);
  Application.CreateForm(TFrmClothes, FrmClothes);
  Application.CreateForm(TFrmOne, FrmOne);
  Application.Run;
end.
