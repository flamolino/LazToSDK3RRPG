unit componentes1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LCLType, LCLProc, LCLIntf, ActnList, LazUTF8, Menus, ComCtrls,
  FileUtil, ExtCtrls, Buttons, DbCtrls;

{   Classes, SysUtils, types, LCLStrConsts, LCLType, LCLProc, LMessages, Graphics,
  ExtendedStrings, LCLIntf, ActnList, Controls, TextStrings, LazUTF8,
  Forms, Menus, LResources;}
type
  TSDK3Button = class(TCustomButton)
  private

  protected

  public

  published
    property Align;
    property Text;
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
    FField, FValue: String;
    FValues, FItems: TStrings ;
  protected
    procedure SetValues(const Value: TStrings); virtual;
    procedure SetItems(const Value: TStrings); virtual;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Align;
    property Enabled;
    property Field: String read FField write FField;
    property Font;
    property Items: TStrings read FItems write SetItems;
    property Text;
    property Value: String read FValue write FValue;
    property Values: TStrings read FValues write SetValues;
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

  TMyType = (text, number, float);
  TMyKeyType = (default, numbersAndPunctuation, numberPad,
  phonePad, alphabet, url, email);
  TEnterKeyType = (defaullt, done, go, next, search, send);

  TSDK3Edit = class(TCustomEdit)
  private
    FField, FTextP: String;
    FTransp, FPass: Boolean;
    FMin, FMax, FNumber: Double;
    FDecP: Integer;
    FType: TMyType;
    FKeyType: TMyKeyType;
    FEnterKey: TEnterKeyType;
  protected

  public

  published
    property Align;
    property Transparent: Boolean read FTransp write FTransp;
    property IsPasswordEdit: Boolean read FPass write FPass;
    property TextPrompt: String read FTextP write FTextP;
    property Font;
    property Typee: TMyType read FType write FType;
    property KeyboardType: TMyKeyType read FKeyType write FKeyType;
    property EnterKeyType: TEnterKeyType read FEnterKey write FEnterKey;
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

  THorzAlign = (leading, center, trailing, justify);
  TOrientation = (horizontal, vertical);

  TSDK3FlowLayout = class(TCustomFlowPanel)
  private
    autoH: Boolean;
    maxCon, maxCol: Integer;
    lineS, contentW, contentH: Double;
    frameS, frameR: String;
    FOri: TOrientation;
    FHorz: THorzAlign;
  protected

  public

  published
    property Align;
    property AutoHeight: Boolean read autoH write autoH;
    property HorzAlign: THorzAlign read FHorz write FHorz;
    property Orientation: TOrientation read FOri write FOri;
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

  TShowStyle = (proportional, autoFit, originalSize, stretchh);

  TSDK3Image = class(TCustomImage)
  private
    FSrc, FField, FURLWhileLoading: String;
    FCenter, FOptimize, FShowP, Feditable: Boolean;
    FnaturalWidth, FnaturalHeight: Double;
    FShowStyle: TShowStyle;
  protected

  public

  published
    property Align;
    property Src: String read FSrc write FSrc;
    property URLWhileLoading: String read FURLWhileLoading write FURLWhileLoading;
    property Field: String read FField write FField;
    property ShowStyle: TShowStyle read FShowStyle write FShowStyle;
    property Center: Boolean read FCenter write FCenter;
    property Optimize: Boolean read FOptimize write FOptimize;
    property ShowProgress: Boolean read FShowP write FShowP;
    property Editable: Boolean read Feditable write Feditable;
    property NaturalWidth: Double read FnaturalWidth write FnaturalWidth;
    property NaturalHeight: Double read FnaturalHeight write FnaturalHeight;
    property Enabled;
    property Picture;
    property Visible;
  end;

type

  { TSDK3Layout }

  TSDK3Layout = class(TCustomPanel)
  private
    frameS, frameR: String;
  protected

  public
    constructor Create(aOwner: TComponent); override;
  published
    property Align;
    property FrameStyle: String read frameS write frameS;
    property FrameRegion: String read frameR write frameR;
    property Enabled;
    property Visible;
  end;

type

  TVertAlign = (leadingg, centerr, trailingg);

  TSDK3FlowPart = class(TCustomPanel)
  private
    FminWidth, FMaxWidth, FminScaledWidth, FMaxScaledWidth: Double;
    FAvoid, FadjustHeightToLine: Boolean;
    FstepSizes: String;
    frameS, frameR: String;
    FVert: TVertAlign;
  protected

  public

  published
    property Align;
    property FrameStyle: String read frameS write frameS;
    property FrameRegion: String read frameR write frameR;
    property Enabled;
    property Visible;
    property MinWidth: Double read FminWidth write FminWidth;
    property MaxWidth: Double read FMaxWidth write FMaxWidth;
    property MinScaledWidth: Double read FminScaledWidth write FminScaledWidth;
    property MaxScaledWidth: Double read FMaxScaledWidth write FMaxScaledWidth;
    property AvoidScale: Boolean read FAvoid write FAvoid;
    property AdjustHeightToLine: Boolean read FadjustHeightToLine write FadjustHeightToLine;
    property VertAlign: TVertAlign read FVert write FVert;
    property StepSizes: String read FstepSizes write FstepSizes;
end;

type
  TSDK3ImageCheckBox = class(TCustomImage)
  private
         FField, FcheckedImage, FUncheckedImage: String;
         FautoChange, FCheck, FOptimize: Boolean;
  protected

  public

  published
    property Align;
    property Field: String read FField write FField;
    property Checked: Boolean read FCheck write FCheck;
    property Optimize: Boolean read FOptimize write FOptimize;
    property Enabled;
    property Visible;
    property Caption;
    property Picture;
    property CheckedImage: String read FcheckedImage write FcheckedImage;
    property UncheckedImage: String read FUncheckedImage write FUncheckedImage;
    property AutoChange: Boolean read FautoChange write FautoChange;
  end;

type
  TSDK3Label = class(TCustomLabel)
  private
    FField: String;
  protected

  public

  published
    property Align;
    property Font;
    property Field: String read FField write FField;
    property Enabled;
    property Text;
    property Visible;
    property AutoSize;
  end;

type

  TColorMode = (defaultt, hl);

  TSDK3ProgressBar = class(TCustomProgressBar)
  private
    FField, FFMin, FFMax: String;
    FmouseGlow: Boolean;
    FMin, FMax, FPosition: Double;
    FColorM: TColorMode;
  protected

  public

  published
    property Align;
    property Color;
    property Position: Double read FPosition write FPosition;
    property Field: String read FField write FField;
    property Enabled;
    property Min: Double read FMin write FMin;
    property Max: Double read FMax write FMax;
    property FieldMin: String read FFMin write FFMax;
    property FieldMax: String read FFMax write FFMax;
    property ColorMode: TColorMode read FColorM write FColorM;
    property MouseGlow: Boolean read FmouseGlow write FmouseGlow;
    property Visible;
  end;

type
  TSDK3RadioButton = class(TCustomCheckBox)
  private
    FField, FGroupName, FFieldValue: String;
  protected

  public

  published
    property Align;
    property Caption;
    property Font;
    property Checked;
    property GroupName: String read FGroupName write FGroupName;
    property FieldValue: String read FFieldValue write FFieldValue;
    property Field: String read FField write FField;
    property Enabled;
    property Visible;
  end;

type
  TSDK3TabControl = class(TCustomTabControl)
  private
         FTab: Integer;
  protected

  public

  published
    property Align;
    property Enabled;
    property TabIndex: Integer read FTab write FTab;
    property Visible;
  end;
{
type
  TSDK3Rectangle = class(TShape)
  private

  protected

  public

  published

  end;
}

type
  TSDK3RichEdit = class(TCustomMemo)
  private
    FROnly, FshowToolbar, FhideSelection: Boolean;
    FField: String;
    FBackColor, fdefaultFontColor: TColor;
    FdefaultFontSize: Double;
  protected

  public

  published
    property Align;
    property BackgroundColor: TColor read FBackColor write FBackColor;
    property DefaultFontColor: Tcolor read FdefaultFontColor write FdefaultFontColor;
    property DefaultFontSize: Double read FdefaultFontSize write FdefaultFontSize;
    property Enabled;
    property Field: String read FField write FField;
    property ReadyOnly: Boolean read FROnly write FROnly;
    property ShowToolbar: Boolean read FshowToolbar write FshowToolbar;
    property HideSelection: Boolean read FhideSelection write FhideSelection;
    property Visible;
  end;

type
  TSDK3ScrollBox = class(TScrollBox)
  private

  protected

  public

  published

  end;


type

  TStrokeCap = (flat, round);
  TstrokeJoin = (miter, roundd, bevel);
  TstrokeDash = (solid, dash, dot, dashDot, dashDotDot);

  { TSDK3Shapes }

  TSDK3Shapes = class(TGraphicControl)
  private
    FstrokeC, Fcolor: TColor;
    FstrokeS: Double;
    FstrokeCapp: TStrokeCap;
    FstrokeJoinn: TStrokeJoin;
    FstrokeDashh: TStrokeDash;
    fchanged: Boolean;
    procedure setcColor(value: TColor);
    procedure setStrokeC(value: TColor);
    procedure setStrokeCap(AValue: TStrokeCap);
    procedure setStrokeS(value: Double);
  protected

  public
    constructor Create(aOwner: TComponent); override;
  published
    property Color: TColor read Fcolor write setcColor;
    property StrokeColor: TColor read FstrokeC write setStrokeC;
    property StrokeSize: Double read FstrokeS write setStrokeS;
    property StrokeCap: TStrokeCap read FstrokeCapp write setStrokeCap;
    property StrokeJoin: TStrokeJoin read FstrokeJoinn write FstrokeJoinn;
    property StrokeDash: TstrokeDash read FstrokeDashh write FstrokeDashh;
  end;

type
  TCorners = (topLeft, topRight, bottomLeft, bottomRight);
  TConCorners = set of TCorners;
  TCornerType = (rectangle, rounndd, bevell, innerRound, innerLine);
  TSides = (top, left, bottom, right);
  TConSides = set of TSides;

  { TSDK3Rectangle }

  TSDK3Rectangle = class(TSDK3Shapes)
  private
    FCorner: TConCorners;
    FCornerType: TCornerType;
    FSides: TConSides;
    fxr, fyr: Double;
    procedure setCornerType(AValue: TCornerType);
  protected
    procedure Paint; override;
  public
    constructor Create(aOwner: TComponent); override;
  published
    property Corners: TConCorners read Fcorner write FCorner;
    property CornerType: TCornerType read FCornerType write setCornerType;
    property Sides: TConSides read FSides write FSides;
    property Xradius: Double read FxR write FxR;
    property Yradius: Double read FyR write FyR;
  end;

procedure Register;

implementation

procedure Register;
begin
  {$I componentes1_icon.lrs}
  RegisterComponents('RRPGSDK3',[TSDK3Button, TSDK3ColorComboBox, TSDK3ComboBox,
  TSDK3CheckBox, TSDK3Edit, TSDK3FlowLayout, TSDK3Image, TSDK3Layout, TSDK3FlowPart,
  TSDK3ImageCheckBox, TSDK3Label, TSDK3ProgressBar, TSDK3RadioButton, TSDK3TabControl,
  TCustomPage, TSDK3RichEdit, TSDK3ScrollBox, TSDK3Rectangle]);
end;

{ TSDK3Layout }

constructor TSDK3Layout.Create(aOwner: TComponent);
begin
  inherited;
  Caption := ' asdasdas';
  BevelOuter := TPanelBevel.bvNone;
  BorderStyle := TFormBorderStyle.bsSingle;
end;





{COMBOBOX}
constructor TSDK3ComboBox.Create(aOwner: TComponent);
begin
     inherited;
     FItems := TStringList.Create();
     FItems.Clear;
     FValues := TStringList.Create();
     FValues.Clear;
end;

destructor TSDK3ComboBox.Destroy;
begin
     FItems.Free;
     FValues.Free;
     inherited Destroy;
end;

procedure TSDK3ComboBox.SetItems(const Value: TStrings);
begin
     FItems.Assign(value);
end;

procedure TSDK3ComboBox.SetValues(const Value: TStrings);
begin
     FValues.Assign(value);
end;






{SHAPES E RECTANGLE}
procedure TSDK3Shapes.setcColor(value: TColor);
begin
  inherited
  setColor(value);
  fColor := value;
  Repaint;
end;

procedure TSDK3Shapes.setStrokeC(value: TColor);
begin
  fStrokeC := value;
  Repaint;
end;

procedure TSDK3Shapes.setStrokeCap(AValue: TStrokeCap);
begin
  if FstrokeCapp=AValue then Exit;
  FstrokeCapp:=AValue;
  repaint;
end;

procedure TSDK3Shapes.setStrokeS(value: Double);
begin
  fStrokeS := value;
  Repaint;
end;

constructor TSDK3Shapes.Create(aOwner: TComponent);
begin
     inherited;
     Width := 50;
     Height := 50;
     FColor := clwhite;
     FstrokeC := clBlack;
     fStrokeS := 1;
     FStrokeCapp := TStrokeCap.flat;
     FStrokeJoinn := TStrokeJoin.miter;
     FStrokeDashh := TStrokeDash.solid;
     fchanged := true;
end;


constructor TSDK3Rectangle.Create(aOwner: TComponent);
begin
     inherited;
     FCorner := [TCorners.bottomLeft, TCorners.bottomRight, TCorners.topLeft,
              TCorners.topRight];
     FCornerType := TCornerType.rectangle;
     FSides := [TSides.bottom, TSides.left, TSides.right, TSides.top];
     Fxr := 0;
     Fyr := 0;
end;

procedure TSDK3Rectangle.setCornerType(AValue: TCornerType);
begin
  if FCornerType=AValue then Exit;
  FCornerType:=AValue;
  repaint;
end;

procedure TSDK3Rectangle.Paint;
begin
     inherited;
     Canvas.Brush.Color := FColor;
     Canvas.Brush.Style := bsSolid;
     Canvas.Pen.Color := FstrokeC;
     Canvas.Pen.Width := trunc(FStrokeS);

     if FstrokeCapp = TstrokeCap.flat then
     begin
          if FCornerType = TCornerType.rectangle then
             Canvas.Rectangle(ClientRect)
          else
              Canvas.RoundRect(clientRect, trunc(fxr), trunc(fyr));
     end
     else
     begin
          Canvas.Ellipse(ClientRect);
     end;
end;

end.
