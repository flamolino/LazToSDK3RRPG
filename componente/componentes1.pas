unit componentes1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LCLType, LCLProc, LCLIntf, ActnList, LazUTF8, Menus;

type
  TSDK3Button = class(TCustomButton)
  private

  protected

  public

  published
    property Align;
    property Caption;
    property Font;
    property Enabled;
    property Visible;
  end;

type
  TSDK3ColorComboBox = class(TCustomComboBox)
  private
    FField: String;
  protected

  public

  published
    property Align;
    property Enabled;
    property Field: String read FField write FField;
    property Visible;
  end;

type
  TSDK3ComboBox = class(TCustomComboBox)
  private
    FField, FValues, FValue, FItems: String;
  protected

  public

  published
    property Align;
    property Enabled;
    property Field: String read FField write FField;
    property Font;
    property Items: String read FItems write FItems;
    property Text;
    property Value: String read FValue write FValue;
    property Values: String read FValues write FValues;
    property Visible;
  end;

type
  TSDK3CheckBox = class(TCustomCheckBox)
  private
    FField: String;
  protected

  public

  published
    property Align;
    property Caption;
    property Font;
    property Checked;
    property Field: String read FField write FField;
    property Enabled;
    property Visible;
  end;

type
  TSDK3Edit = class(TCustomEdit)
  private
    FField, FTextP, FType: String;
    FTransp, FPass: Boolean;
    FMin, FMax, FNumber: Double;
    FDecP: Integer;
  protected

  public

  published
    property Align;
    property Transparent: Boolean read FTransp write FTransp;
    property IsPasswordEdit: Boolean read FPass write FPass;
    property TextPrompt: String read FTextP write FTextP;
    property Font;
   // property Typee: String read FType write FType;
   //keyboardType
   // enterKeyType
    property Min: Double read FMin write FMin;
    property Max: Double read FMax write FMax;
    property DecimalPlaces: Integer read FDecP write FDecP;
    property Field: String read FField write FField;
    property Enabled;
    property asNumber: Double read FNumber write FNumber;
    property Text;
    property Visible;
  end;

procedure Register;

implementation

procedure Register;
begin
  {$I componentes1_icon.lrs}
  RegisterComponents('RRPGSDK3',[TSDK3Button, TSDK3ColorComboBox, TSDK3ComboBox,
  TSDK3CheckBox, TSDK3Edit]);
end;

end.
