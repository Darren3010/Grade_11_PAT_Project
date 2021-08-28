object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 396
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PgCtrlLogin: TPageControl
    Left = 0
    Top = 0
    Width = 705
    Height = 396
    ActivePage = TbShtLogin
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TbShtLogin: TTabSheet
      Caption = 'Login'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Century Gothic'
      Font.Style = []
      ParentFont = False
      object PnlBackground: TPanel
        Left = 16
        Top = 16
        Width = 657
        Height = 321
        Color = clGradientInactiveCaption
        ParentBackground = False
        TabOrder = 0
        object LblHeading: TLabel
          Left = 194
          Top = 32
          Width = 271
          Height = 44
          Caption = 'Login as Admin'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -37
          Font.Name = 'Century Gothic'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object LblAccount: TLabel
          Left = 152
          Top = 264
          Width = 254
          Height = 24
          Caption = 'Don'#39't have an account?'
        end
        object LblLink: TLabel
          Left = 412
          Top = 264
          Width = 73
          Height = 24
          Cursor = crHandPoint
          Caption = 'Sign Up'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -21
          Font.Name = 'Century Gothic'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = LblLinkClick
        end
        object LblEdtUsername: TLabeledEdit
          Left = 127
          Top = 141
          Width = 202
          Height = 29
          EditLabel.Width = 82
          EditLabel.Height = 21
          EditLabel.Caption = 'Username:'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Century Gothic'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Century Gothic'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object LblEdtPassword: TLabeledEdit
          Left = 127
          Top = 197
          Width = 202
          Height = 29
          EditLabel.Width = 76
          EditLabel.Height = 21
          EditLabel.Caption = 'Password:'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Century Gothic'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Century Gothic'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object RgrpOptions: TRadioGroup
          Left = 348
          Top = 141
          Width = 193
          Height = 85
          Caption = 'Password Options'
          Color = clGradientInactiveCaption
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Century Gothic'
          Font.Style = []
          Items.Strings = (
            'See Password'
            'Hide Password')
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          OnClick = RgrpOptionsClick
        end
        object BtnLogin: TButton
          Left = 288
          Top = 232
          Width = 89
          Height = 33
          Caption = 'Login'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Century Gothic'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 3
          OnClick = BtnLoginClick
        end
      end
    end
    object TbShtSign: TTabSheet
      Caption = 'Sign-Up'
      ImageIndex = 1
      object PnlBackground1: TPanel
        Left = 3
        Top = 3
        Width = 691
        Height = 351
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 0
        object LblSignUp: TLabel
          Left = 264
          Top = 8
          Width = 135
          Height = 44
          Caption = 'Sign-Up'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -37
          Font.Name = 'Century Gothic'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object LblEdtUser: TLabeledEdit
          Left = 112
          Top = 163
          Width = 209
          Height = 29
          EditLabel.Width = 82
          EditLabel.Height = 21
          EditLabel.Caption = 'Username:'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Century Gothic'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Century Gothic'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object LblEdtPass: TLabeledEdit
          Left = 112
          Top = 213
          Width = 209
          Height = 29
          EditLabel.Width = 76
          EditLabel.Height = 21
          EditLabel.Caption = 'Password:'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Century Gothic'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Century Gothic'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TextHint = 'Enter 5 digits.'
        end
        object LblEdtConfirm: TLabeledEdit
          Left = 360
          Top = 163
          Width = 209
          Height = 29
          EditLabel.Width = 142
          EditLabel.Height = 21
          EditLabel.Caption = 'Re-Type Password:'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Century Gothic'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Century Gothic'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object BtnSignUp: TButton
          Left = 282
          Top = 248
          Width = 103
          Height = 33
          Caption = 'Sign-Up'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Century Gothic'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 3
          OnClick = BtnSignUpClick
        end
        object Panel1: TPanel
          Left = 40
          Top = 88
          Width = 25
          Height = 193
          Color = clInactiveCaption
          ParentBackground = False
          TabOrder = 4
        end
        object Panel2: TPanel
          Left = 592
          Top = 88
          Width = 25
          Height = 193
          Color = clInactiveCaption
          ParentBackground = False
          TabOrder = 5
        end
        object LblEdtEmail: TLabeledEdit
          Left = 360
          Top = 213
          Width = 209
          Height = 29
          EditLabel.Width = 205
          EditLabel.Height = 21
          EditLabel.Caption = 'E - Mail Address(Optional):'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Century Gothic'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Century Gothic'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object LblEdtName: TLabeledEdit
          Left = 112
          Top = 112
          Width = 209
          Height = 29
          EditLabel.Width = 161
          EditLabel.Height = 21
          EditLabel.Caption = 'Name and Surname:'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Century Gothic'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Century Gothic'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object LblEdtAge: TLabeledEdit
          Left = 360
          Top = 112
          Width = 209
          Height = 29
          EditLabel.Width = 38
          EditLabel.Height = 21
          EditLabel.Caption = 'Age:'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Century Gothic'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Century Gothic'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
      end
    end
    object TbShtGuest: TTabSheet
      Caption = 'Guest'
      ImageIndex = 2
      object PnlBackground2: TPanel
        Left = 16
        Top = 16
        Width = 657
        Height = 321
        Color = clActiveCaption
        ParentBackground = False
        TabOrder = 0
        object BtnGuest: TButton
          Left = 232
          Top = 141
          Width = 201
          Height = 41
          Caption = 'Sign in as Guest'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Century Gothic'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 0
          OnClick = BtnGuestClick
        end
      end
    end
  end
end
