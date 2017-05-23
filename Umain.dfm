object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Bulls and cows game'
  ClientHeight = 407
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object LCows: TLabel
    Left = 96
    Top = 208
    Width = 61
    Height = 22
    Caption = 'Cows :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Stencil'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object LMotJ: TLabel
    Left = 96
    Top = 72
    Width = 112
    Height = 22
    Caption = 'Votre mot :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Stencil'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object LBulls: TLabel
    Left = 96
    Top = 152
    Width = 68
    Height = 22
    Caption = 'Bulls :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Stencil'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object LMax: TLabel
    Left = 479
    Top = 72
    Width = 44
    Height = 22
    Caption = 'Max '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Stencil'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object LMot: TLabel
    Left = 184
    Top = 264
    Width = 6
    Height = 35
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = [fsUnderline]
    ParentFont = False
    Visible = False
  end
  object Lessai: TLabel
    Left = 400
    Top = 120
    Width = 126
    Height = 19
    Caption = 'Essais retant :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object BGo: TButton
    Left = 96
    Top = 320
    Width = 139
    Height = 57
    Cursor = crHandPoint
    Caption = 'GO'
    DragCursor = crNoDrop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Stencil'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 1
    OnClick = BGoClick
  end
  object BRaz: TButton
    Left = 272
    Top = 320
    Width = 139
    Height = 57
    Cursor = crHandPoint
    Caption = 'RAZ'
    DragCursor = crNoDrop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Stencil'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 2
    OnClick = BRazClick
  end
  object BQuit: TButton
    Left = 448
    Top = 320
    Width = 139
    Height = 57
    Cursor = crHandPoint
    Caption = 'Quit'
    DragCursor = crNoDrop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Stencil'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 3
    OnClick = BQuitClick
  end
  object EBulls: TEdit
    Left = 170
    Top = 151
    Width = 121
    Height = 27
    Cursor = crNo
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '0'
  end
  object ECows: TEdit
    Left = 170
    Top = 207
    Width = 121
    Height = 27
    Cursor = crNo
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = '0'
  end
  object EResult: TEdit
    Left = 400
    Top = 211
    Width = 153
    Height = 27
    Cursor = crNo
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object Eessai: TEdit
    Left = 400
    Top = 151
    Width = 153
    Height = 27
    Cursor = crNo
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Stencil'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object EMotJ: TEdit
    Left = 224
    Top = 71
    Width = 249
    Height = 27
    Cursor = crIBeam
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyDown = EMotJKeyDown
  end
  object MList: TMemo
    Left = 496
    Top = 5
    Width = 185
    Height = 89
    Lines.Strings = (
      'MList')
    TabOrder = 8
    Visible = False
  end
  object Mmot: TMemo
    Left = 496
    Top = 5
    Width = 185
    Height = 89
    Lines.Strings = (
      'Mmot')
    TabOrder = 9
    Visible = False
  end
end
