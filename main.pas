unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, StdCtrls, LCLIntf, Buttons, DbCtrls, ComCtrls,
  componentes1;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    chkTagForm: TCheckBox;
    cbbTemplate: TComboBox;
    cbbTheme: TComboBox;
    edtDataType: TEdit;
    edtTitle: TEdit;
    edtNome: TEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;

    procedure cbbThemeChange(Sender: TObject);
    procedure chkTagFormChange(Sender: TObject);
    function TColorToHex(Cor: TColor): string;
    function Replaces(s: string): String;
    function Aligns(item: TWinControl): String;
    function AlignsNotWinControl(itemA: TAlign; item: TControl): String;
    function Fonts(item: TFont): String;

    function MakeButton(item: TSDK3Button): String;
    function MakeColorComboBox(item: TSDK3ColorComboBox): String;
    function MakeComboBox(item: TSDK3ComboBox): String;
    function MakeCheckBox(item: TSDK3CheckBox): String;
    function MakeEdit(item: TSDK3Edit): String;
    function MakeFlowLayout(item: TSDK3FlowLayout): String;
    function MakeImage(item: TSDK3Image): String;
    function MakeLayout(item: TSDK3Layout): String;
    function MakeFlowPart(item: TSDK3FlowPart): String;
    function MakeImageCheckBox(item: TSDK3ImageCheckBox): String;
    function MakeLabel(item: TSDK3Label): String;

    procedure FormCreate(Sender: TObject);
    procedure Finalizar(Sender: TObject);
    function geraTags(comp: TComponent; memo: TMemo): String;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

function TfrmMain.MakeButton(item: TSDK3Button): String;
var
  s: String;
begin
     s := '<button text="' + item.Caption + '" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + item.Hint + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+#13+#9+#9+' fontColor="#' + TColorToHex(item.Font.Color) +
     '" fontFamily="' + item.Font.Name + '" fontSize="' + inttostr(item.Font.Size);

     s := s + '"' + Fonts(item.Font)+#13+#9+#9;
     s := s + ' ' + Aligns(item) + '/>';

     result := Replaces(s);
end;

function TfrmMain.MakeColorComboBox(item: TSDK3ColorComboBox): String;
var
  s: String;
begin
     s := '<colorComboBox color="Null" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + item.Hint + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + item.Field + '" '+#13+#9+#9;

     s := s + ' ' + Aligns(item) + '/>';
     result := Replaces(s);
end;

function TfrmMain.MakeComboBox(item: TSDK3ComboBox): String;
var
  s: String;
begin
     s := '<comboBox enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + item.Hint + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + item.Field + '" '+#13+#9+#9 +
     'fontColor="#' + TColorToHex(item.Font.Color) +
     '" fontFamily="' + item.Font.Name + '" fontSize="' + inttostr(item.Font.Size) + '"'+
     ' items="' + item.Items + '" values="' + item.values + '" value="' + item.value+'" '+#13+#9+#9;

     s := s + Fonts(item.Font);
     s := s + ' ' + Aligns(item) + '/>';
     result := Replaces(s);
end;

function TfrmMain.MakeCheckBox(item: TSDK3CheckBox): String;
var
  s: String;
begin
     s := '<checkBox text="' + item.Caption + '" checked="' + LowerCase(booltostr(item.Checked)) +
     '" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + item.Hint + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + item.Field + '"'+
     'fontColor="#' + TColorToHex(item.Font.Color) +
     '" fontFamily="' + item.Font.Name + '" fontSize="' + inttostr(item.Font.Size) + '" '+#13+#9+#9;

     s := s + Fonts(item.Font);
     s := s + ' ' + Aligns(item) + '/>';
     result := Replaces(s);
end;

function TfrmMain.MakeEdit(item: TSDK3Edit): String;
var
  s: String;
begin
     s := '<edit text="' + item.Caption + '" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + item.Hint + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + item.Field + '" '+
     'fontColor="#' + TColorToHex(item.Font.Color) +
     '" fontFamily="' + item.Font.Name + '" fontSize="' + inttostr(item.Font.Size) + '"'+#13+#9+#9+
     'textPrompt="' + item.TextPrompt + '" transparent="' + LowerCase(booltostr(item.Transparent))+
     '" isPasswordEdit="' + LowerCase(booltostr(item.IsPasswordEdit)) + '" min="' + floattostr(item.Min) +
     '" max="' + floattostr(item.Max) + '" decimalPlaces="'+ inttostr(item.DecimalPlaces) + '" asNumber="'+
     floattostr(item.asNumber)+'"'+#13+#9+#9;

     s := s + Fonts(item.Font);
     s := s + ' ' + Aligns(item) + '/>';
     result := Replaces(s);
end;

function TfrmMain.MakeFlowLayout(item: TSDK3FlowLayout): String;
var
  s: String;
begin
     s := '<flowLayout enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + item.Hint + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+#13+#9+#9 +
     'autoHeight="' + LowerCase(booltostr(item.AutoHeight)) + '" maxControlsPerLine="' +
     inttostr(item.MaxControlsPerLine) + '" maxColumns="' + inttostr(item.MaxColumns)+
     '" lineSpacing="' + floattostr(item.LineSpacing) + '" '+#13+#9+#9+'contentWidth="' +
     floattostr(item.ContentWidth) + '" contentHeight="' + floattostr(item.ContentHeight) +
     '" frameStyle="' + item.FrameStyle + '" frameRegion="' + item.FrameRegion +'"'+#13+#9+#9;

     s := s + ' ' + Aligns(item) + '>';
     result := Replaces(s);
end;

function TfrmMain.MakeImage(item: TSDK3Image): String;
var
  s: String;
begin
     s := '<image enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + item.Hint + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+#13+#9+#9 +
     ' center="' + LowerCase(booltostr(item.Center)) + '" editable="' +
     LowerCase(booltostr(item.Editable)) + '" field="' + item.Field + '" '+
     'naturalWidth="' + floattostr(item.NaturalWidth) + '" naturalHeight="' +
     floattostr(item.NaturalHeight) + '" optimize="' +
     LowerCase(booltostr(item.Optimize)) + '" showProgress="' +
     LowerCase(booltostr(item.ShowProgress)) + '" src="' + item.Src + '" '+#13+#9+#9 +
     'URLWhileLoading="' + item.URLWhileLoading + '" ';

     s := s + ' ' + AlignsNotWinControl(item.Align, item) + '/>';
     result := Replaces(s);
end;

function TfrmMain.MakeLayout(item: TSDK3Layout): String;
var
  s: String;
begin
     s := '<layout enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + item.Hint + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+#13+#9+#9 +
     'frameStyle="' + item.FrameStyle + '" frameRegion="' + item.FrameRegion +'" ';

     s := s  + Aligns(item) + '>';
     result := Replaces(s);
end;

function TfrmMain.MakeFlowPart(item: TSDK3FlowPart): String;
var
  s: String;
begin
     s := '<flowPart enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + item.Hint + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" '+#13+#9+#9 +
     'frameStyle="' + item.FrameStyle + '" frameRegion="' + item.FrameRegion +
     '" minWidth="' + floattostr(item.MinWidth) +'" maxWidth="' + floattostr(item.MaxWidth) +
     '" minScaledWidth="'+ floattostr(item.MinScaledWidth) + '" maxScaledWidth="' +
     floattostr(item.MaxScaledWidth) + '" avoidScale="' + LowerCase(booltostr(item.AvoidScale)) +
     '" ' + #13+#9+#9 + ' stepSizes="' + item.StepSizes + '" adjustHeightToLine="' +
     LowerCase(booltostr(item.adjustHeightToLine)) + '" ' ;

     s := s  + Aligns(item) + '>';
     result := Replaces(s);
end;

function TfrmMain.MakeImageCheckBox(item: TSDK3ImageCheckBox): String;
var
  s: String;
begin
     s := '<imageCheckBox checked="' + LowerCase(booltostr(item.Checked)) +
     '" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + item.Hint + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + item.Field + '" '+#13+#9+#9+
     ' checkedImage="' + item.CheckedImage + '" uncheckedImage="' + item.UncheckedImage +
     '" optimize="'+ LowerCase(booltostr(item.Optimize)) + '" autoChange="' +
     LowerCase(booltostr(item.AutoChange)) + '" ';

     s := s  + AlignsNotWinControl(item.Align, item) + '/>';
     result := Replaces(s);
end;

function TfrmMain.MakeLabel(item: TSDK3Label): String;
var
  s: String;
begin
     s := '<label text="' + item.Caption + '" enabled="' + LowerCase(booltostr(item.Enabled)) +
     '" hint="' + item.Hint + '" tabOrder="' + inttostr(item.Tag) + '" visible="' +
     LowerCase(booltostr(item.Visible)) + '" field="' + item.Field + '" '+
     'fontColor="#' + TColorToHex(item.Font.Color) +
     '" fontFamily="' + item.Font.Name + '" fontSize="' + inttostr(item.Font.Size) +
     '" autoSize="' + LowerCase(booltostr(item.AutoSize)) + '" ';

     s := s + Fonts(item.Font);
     s := s + ' ' + AlignsNotWinControl(item.Align, item) + '/>';
     result := Replaces(s);
end;

procedure TfrmMain.Finalizar(Sender: TObject);
var
  i, j, c, lyt: integer;
  memo: TMemo;
  svdlg: TSaveDialog;
  memos: array of TMemo;
begin

     memo := TMemo.Create(self);
     memo.Visible := false;
     memo.Clear;
     svdlg := TSaveDialog.Create(self);
     svdlg.Filter := '.TXT|*.txt';
     svdlg.Title := 'Criar arquivo para SDK3';

     if chkTagForm.Checked then
     begin
       memo.Lines.Add('<?xml version="1.0" encoding="UTF-8"?>'+#13+#9);
       memo.Lines.Add('<form formType="'+cbbTemplate.Text+'" dataType="'+edtDataType.Text+'" ');
       memo.Lines.Add('title="'+edtTitle.Text+'" name="'+edtNome.Text+'" theme="'+cbbTheme.Text+'">'+#13);
     end;

     lyt := 0;
     for i := 0 to ComponentCount - 1 do
     begin
          if (Components[i] is TSDK3FlowLayout) or
          (Components[i] is TSDK3Layout) or
          (Components[i] is TSDK3FlowPart) then
          begin
               lyt := lyt + 1;
          end;
     end;

     if lyt = 0 then
     begin
       for i := 0 to ComponentCount - 1 do
       begin
            memo.text := geraTags(Components[i], memo);
       end;
     end
     else
     begin
          setLength(memos, lyt);
          for i := 0 to lyt do
          begin
               memos[i] := TMemo.Create(self);
               memos[i].Visible := false;
               memos[i].Clear;
          end;

          c := 0;
          for i := 0 to ComponentCount - 1 do
          begin
               if (Components[i] is TSDK3Layout) then
               begin
                    memos[c].text := geraTags(Components[i], memos[c]);
                    for j := 0 to ComponentCount - 1 do
                    begin
                         if Components[j].GetParentComponent = Components[i] then
                            memos[c].text := geraTags(Components[j], memos[c]);
                    end;
                    memos[c].lines.Add(#13+#9+'</layout>');
                    c := c + 1;
               end
               else
               if (Components[i] is TSDK3FlowLayout) then
               begin
                    memos[c].text := geraTags(Components[i], memos[c]);
                    for j := 0 to ComponentCount - 1 do
                    begin
                         if Components[j].GetParentComponent = Components[i] then
                            memos[c].text := geraTags(Components[j], memos[c]);
                    end;
                    memos[c].lines.Add(#13+#9+'</flowLayout>');
                    c := c + 1;
               end
               else
               if (Components[i] is TSDK3FlowPart) then
               begin
                    memos[c].text := geraTags(Components[i], memos[c]);
                    for j := 0 to ComponentCount - 1 do
                    begin
                         if Components[j].GetParentComponent = Components[i] then
                            memos[c].text := geraTags(Components[j], memos[c]);
                    end;
                    memos[c].lines.Add(#13+#9+'</flowPart>');
                    c := c + 1;
               end
               else
               if (Components[i].GetParentComponent = frmMain) then
               begin
                    memo.text := geraTags(Components[i], memo);
               end;
          end;

          for i := 0 to lyt do
          begin
               memo.lines.Add(memos[i].text);
               memos[i].free;
          end;
     end;

     if chkTagForm.Checked then
     begin
       memo.Lines.Add(#13+'</form>');
     end;

     if svdlg.Execute then
     begin
          memo.Lines.SaveToFile(svdlg.FileName);
     end;
     memo.free;
     svdlg.Free;

end;

function TfrmMain.geraTags(comp: TComponent; memo: TMemo): String;
begin
         if comp is TSDK3Button then
         begin
                memo.Lines.add(#9 + MakeButton((comp as TSDK3Button)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3ColorComboBox then
         begin
                memo.Lines.add(#9 + MakeColorComboBox((comp as TSDK3ColorComboBox)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3ComboBox then
         begin
                memo.Lines.add(#9 + MakeComboBox((comp as TSDK3ComboBox)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3CheckBox then
         begin
                memo.Lines.add(#9 + MakeCheckBox((comp as TSDK3CheckBox)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3Edit then
         begin
                memo.Lines.add(#9 + MakeEdit((comp as TSDK3Edit)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3FlowLayout then
         begin
                memo.Lines.add(#9 + MakeflowLayout((comp as TSDK3FlowLayout)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3Image then
         begin
                memo.Lines.add(#9 + MakeImage((comp as TSDK3Image)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3Layout then
         begin
                memo.Lines.add(#9 + MakeLayout((comp as TSDK3Layout)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3FlowPart then
         begin
                memo.Lines.add(#9 + MakeFlowPart((comp as TSDK3FlowPart)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3ImageCheckBox then
         begin
                memo.Lines.add(#9 + MakeImageCheckBox((comp as TSDK3ImageCheckBox)));
                memo.lines.add('');
         end
         else
         if comp is TSDK3Label then
         begin
                memo.Lines.add(#9 + MakeLabel((comp as TSDK3Label)));
                memo.lines.add('');
         end;
         result := memo.text;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  menuBar: TMainMenu;
  item: TMenuItem;
begin
  menuBar := TmainMenu.Create(frmMain);
  item := TMenuItem.Create(menuBar);
  item.Caption:='GERAR FICHA!';
  item.OnClick := @Finalizar;
  menuBar.Items.Add(item);
end;

function TfrmMain.Fonts(item: TFont): String;
var
   f: string;
begin
     f := '';
       if item.Style <> [] then
     begin
          if fsBold in item.Style then
             f := f + 'bold ';
          if fsItalic in item.Style then
             f := f + 'italic ';
          if fsUnderline in item.Style then
             f := f + 'underline ';
          if fsStrikeout in item.Style then
             f := f + 'strikeout ';

          f := ' fontStyle="'+ f +'"';
     end;
       result := f;
end;

function TfrmMain.Aligns(item: TWinControl): String;
var
  f: String;
begin
       f := '';
     if item.Align <> alClient then
     begin
          if item.Align = alNone then
               f := 'left="' + inttostr(item.Left) + '" top="' + inttostr(item.top) +
               '" width="' + inttostr(item.Width) + '" height="' + inttostr(item.Height) + '"'
          else
          begin
            if item.Align = alTop then
               f := 'align="top" height="' + inttostr(item.Height) + '"'
            else
            if item.Align = alRight then
               f := 'align="right" width="' + inttostr(item.Width) + '"'
            else
            if item.Align = alBottom then
               f := 'align="bottom" height="' + inttostr(item.Height) + '"'
            else
            if item.Align = alLeft then
               f := 'align="left" width="' + inttostr(item.Width) + '"';
          end;
     end
     else
     begin
          f := 'align="client"';
     end;
     result := f;
end;

function TfrmMain.AlignsNotWinControl(itemA: TAlign; item: TControl): String;
var
  f: String;
begin
       f := '';
     if itemA <> alClient then
     begin
          if itemA = alNone then
               f := 'left="' + inttostr(item.Left) + '" top="' + inttostr(item.top - 26) +
               '" width="' + inttostr(item.Width) + '" height="' + inttostr(item.Height) + '"'
          else
          begin
            if itemA = alTop then
               f := 'align="top" height="' + inttostr(item.Height) + '"'
            else
            if itemA = alRight then
               f := 'align="right" width="' + inttostr(item.Width) + '"'
            else
            if itemA = alBottom then
               f := 'align="bottom" height="' + inttostr(item.Height) + '"'
            else
            if itemA = alLeft then
               f := 'align="left" width="' + inttostr(item.Width) + '"';
          end;
     end
     else
     begin
          f := 'align="client"';
     end;
     result := f;
end;

function TfrmMain.Replaces(s: string): String;
begin
     s := stringReplace(s, 'enabled="0"', 'enabled="false"', [rfReplaceALL]);
     s := stringReplace(s, 'enabled="-1"', '', [rfReplaceALL]);
     s := stringReplace(s, 'visible="0"', 'visible="false"', [rfReplaceALL]);
     s := stringReplace(s, 'visible="-1"', '', [rfReplaceALL]);
     s := stringReplace(s, 'checked="0"', 'checked="false"', [rfReplaceALL]);
     s := stringReplace(s, 'checked="-1"', 'checked="true"', [rfReplaceALL]);
     s := stringReplace(s, 'isPasswordEdit="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'isPasswordEdit="-1"', 'isPasswordEdit="true"', [rfReplaceALL]);
     s := stringReplace(s, 'transparent="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'transparent="-1"', 'transparent="true"', [rfReplaceALL]);
     s := stringReplace(s, 'center="0"', 'center="false"', [rfReplaceALL]);
     s := stringReplace(s, 'center="-1"', '', [rfReplaceALL]);
     s := stringReplace(s, 'editable="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'editable="-1"', 'editable="true"', [rfReplaceALL]);
     s := stringReplace(s, 'optimize="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'optimize="-1"', 'optimize="true"', [rfReplaceALL]);
     s := stringReplace(s, 'showProgress="-1"', '', [rfReplaceALL]);
     s := stringReplace(s, 'showProgress="0"', 'showProgress="true"', [rfReplaceALL]);
     s := stringReplace(s, 'autoChange="-1"', 'autoChange="false"', [rfReplaceALL]);
     s := stringReplace(s, 'autoChange="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'autoSize="-1"', '', [rfReplaceALL]);
     s := stringReplace(s, 'autoSize="0"', 'autoSize="true"', [rfReplaceALL]);

     s := stringReplace(s, 'hint=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'fontSize="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'fontColor="#000000"', '', [rfReplaceALL]);
     s := stringReplace(s, 'fontFamily="default"', '', [rfReplaceALL]);
     s := stringReplace(s, 'field=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'items=""', 'items="{}"', [rfReplaceALL]);
     s := stringReplace(s, 'values=""', 'values="{}"', [rfReplaceALL]);
     s := stringReplace(s, 'value=""', '', [rfReplaceALL]);

     s := stringReplace(s, 'tabOrder="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'autoHeight="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'maxControlsPerLine="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'MmxColumns="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'lineSpacing="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'contentWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'contentHeight="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'contentHeight="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'naturalWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'naturalHeight="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'minWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'maxWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'minScaledWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'maxScaledWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'avoidScale="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'adjustHeightToLine="0"', '', [rfReplaceALL]);

     s := stringReplace(s, 'stepSizes=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'frameStyle=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'frameRegion=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'URLWhileLoading=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'uncheckedImage=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'checkedImage=""', '', [rfReplaceALL]);

     s := stringReplace(s, '   ', ' ', [rfReplaceALL]);
     s := stringReplace(s, '  ', ' ', [rfReplaceALL]);
     result:= s;
end;

function TfrmMain.TColorToHex(Cor: TColor): string;
begin
  Result :=
    IntToHex( GetRValue( Cor ), 2 ) +
    IntToHex( GetGValue( Cor ), 2 ) +
    IntToHex( GetBValue( Cor ), 2 );
end;

procedure TfrmMain.chkTagFormChange(Sender: TObject);
begin
     if chkTagForm.Checked then
     begin
          cbbTemplate.Enabled:=true;
          cbbTheme.Enabled:=true;
          edtDataType.Enabled:=true;
          edtNome.Enabled:=true;
          edtTitle.Enabled:=true;
     end
     else
     begin
          cbbTemplate.Enabled:=false;
          cbbTheme.Enabled:=false;
          edtDataType.Enabled:=false;
          edtNome.Enabled:=false;
          edtTitle.Enabled:=false;
     end;
end;

procedure TfrmMain.cbbThemeChange(Sender: TObject);
begin
  if cbbTheme.ItemIndex <> 1 then
     frmMain.Color:=$004E4E4E
  else
     frmMain.Color:=clWhite;
end;

end.























