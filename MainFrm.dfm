object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rad Studio Keygen'
  ClientHeight = 392
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 263
    Width = 109
    Height = 13
    Caption = 'Rad Studio Version:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 67
    Top = 294
    Width = 82
    Height = 13
    Caption = 'Serial Number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 45
    Top = 325
    Width = 104
    Height = 13
    Caption = 'Registration Code:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 179
    Top = 259
    Width = 214
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 441
    Height = 241
    Lines.Strings = (
      'How to Use:'
      '1. Download iso image file:'
      
        '    http://altd.embarcadero.com/download/radstudio/10.2/delphicb' +
        'uilder10_2_3_2631.iso'
      '    MD5:1bd28e95596ffed061e57e28e155666d'
      '    Version:25.0.29899.2631'
      
        '2. Mount *.iso image and run intstallation process, select langu' +
        'age,'
      
        '    Set Checkbox that you agree with License agreement, click "N' +
        'ext >" '
      '    Now you are on the "Input License" page...'
      '3. Click "< Back" button '
      '    Now use keygen...'
      '4. Click "Generate" to get new Serial Number. '
      '    !!! Do not use any other serial numbers from internet !!! '
      
        '5. now click "Next >" in the Setup page and continue installatio' +
        'n process...  '
      '6. When Installation has finished, click "Patch". '
      '7. Start RAD Studio. '
      '===================================================='
      'https://github.com/elseif/RadStudioVersion'
      'Enjoy!!!')
    ReadOnly = True
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 179
    Top = 291
    Width = 160
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 179
    Top = 324
    Width = 105
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object Button1: TButton
    Left = 34
    Top = 356
    Width = 90
    Height = 23
    Caption = 'Generate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 177
    Top = 356
    Width = 90
    Height = 23
    Caption = 'Patch'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 319
    Top = 356
    Width = 90
    Height = 23
    Caption = 'Update'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button3Click
  end
end
