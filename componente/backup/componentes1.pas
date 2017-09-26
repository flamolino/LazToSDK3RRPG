unit componentes1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LCLType, LCLProc, LCLIntf, ActnList, LazUTF8, Menus,
  FileUtil, ExtCtrls, Buttons, DbCtrls;

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
    property AsNumber: Double read FNumber write FNumber;
    property Text;
    property Visible;
  end;

type
  TSDK3FlowLayout = class(TCustomFlowPanel)
  private
    autoH: Boolean;
    maxCon, maxCol: Integer;
    lineS, contentW, contentH: Double;
    frameS, frameR: String;
  protected

  public

  published
    property Align;
    property AutoHeight: Boolean read autoH write autoH;
    //horzAlign
    //orientation
    property MaxControlsPerLine: Integer read maxCon write maxCon;
    property MaxColumns: Integer read maxCol write maxCol;
    property LineSpacing: Double read lineS write lineS;
    property ContentWidth: Double read contentW write contentW;
    property ContentHeight: Double read contentH write contentH;
    property FrameStyle: String read frameS write frameS;
    property FrameRegion: String read frameR write frameR;
    property Enabled;
    property Visible;
  end;

type
  TSDK3Image = class(TCustomImage)
  private
    FSrc, FField, FURLWhileLoading: String;
    FCenter, FOptimize, FShowP, Feditable: Boolean;
    FnaturalWidth: Double;
  protected

  public

  published
    property Align;
    property Src: String read FSrc write FSrc;
    property URLWhileLoading: String read FURLWhileLoading write FURLWhileLoading;
    property Field: String read FField write FField;
    //showStyle
    property Center: Boolean read FCenter write FCenter;
    property Optimize: Boolean read FOptimize write FOptimize;
    property ShowProgress: Boolean read FShowP write FShowP;
    property Editable: Boolean read Feditable write Feditable;
    property NaturalWidth: Double read FnaturalWidth write FnaturalWidth;
    property Enabled;
    property Visible;
  end;

type
  TSDK3Layout = class(TCustomPanel)
  private
    frameS, frameR: String;
  protected

  public

  published
    property Align;
    property FrameStyle: String read frameS write frameS;
    property FrameRegion: String read frameR write frameR;
    property Enabled;
    property Visible;
  end;

procedure Register;

implementation

procedure Register;
begin
  {$I componentes1_icon.lrs}
  RegisterComponents('RRPGSDK3',[TSDK3Button, TSDK3ColorComboBox, TSDK3ComboBox,
  TSDK3CheckBox, TSDK3Edit, TSDK3FlowLayout, TSDK3Image, TSDK3Layout]);
end;

end.
