unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, StdCtrls, LCLIntf, Buttons, DbCtrls, ExtDlgs,
  componentes1;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    SDK3Button1: TSDK3Button;

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

    procedure FormCreate(Sender: TObject);
    procedure Finalizar(Sender: TObject);
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
     'items="' + item.Items + '" values="' + item.values + '" value="' + item.value+'" '+#13+#9+#9;

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
     'naturalWidth="' + floattostr(item.NaturalWidth) + '" optimize="' +
     LowerCase(booltostr(item.Optimize)) + '" showProgress="' +
     LowerCase(booltostr(item.ShowProgress)) + '" src="' + item.Src + '" '+#13+#9+#9 +
     'URLWhileLoading="' + item.URLWhileLoading + '" ';

     s := s + ' ' + AlignsNotWinControl(item.Align, item) + '/>';
     result := Replaces(s);
end;

procedure TfrmMain.Finalizar(Sender: TObject);
var
  i, lyt: integer;
  memo: TMemo;
  svdlg: TSaveDialog;
begin

     memo := TMemo.Create(self);
     memo.Visible := false;
     memo.Clear;
     svdlg := TSaveDialog.Create(self);
     svdlg.Filter := '.TXT|*.txt';
     svdlg.Title := 'Criar arquivo para SDK3';

     lyt := 0;{treho de código ainda em desenvolvimento}
     for i := 0 to ComponentCount - 1 do
     begin
          if Components[i] is TSDK3FlowLayout then
          begin
               lyt := lyt + 1;
          end;
     end;///////////////////////////////////////////////

     for i := 0 to ComponentCount - 1 do
     begin
       if Components[i] is TSDK3Button then
       begin
            if lyt = 0 then
            begin
              memo.Lines.add(#9 + MakeButton((Components[i] as TSDK3Button)));
              memo.lines.add('');
            end;
       end
       else
       if Components[i] is TSDK3ColorComboBox then
       begin
            if lyt = 0 then
            begin
              memo.Lines.add(#9 + MakeColorComboBox((Components[i] as TSDK3ColorComboBox)));
              memo.lines.add('');
            end;
       end
       else
       if Components[i] is TSDK3ComboBox then
       begin
            if lyt = 0 then
            begin
              memo.Lines.add(#9 + MakeComboBox((Components[i] as TSDK3ComboBox)));
              memo.lines.add('');
            end;
       end
       else
       if Components[i] is TSDK3CheckBox then
       begin
            if lyt = 0 then
            begin
              memo.Lines.add(#9 + MakeCheckBox((Components[i] as TSDK3CheckBox)));
              memo.lines.add('');
            end;
       end
       else
       if Components[i] is TSDK3Edit then
       begin
            if lyt = 0 then
            begin
              memo.Lines.add(#9 + MakeEdit((Components[i] as TSDK3Edit)));
              memo.lines.add('');
            end;
       end
       else
       if Components[i] is TSDK3FlowLayout then
       begin
            if lyt = 0 then
            begin
              memo.Lines.add(#9 + MakeflowLayout((Components[i] as TSDK3FlowLayout)));
              memo.lines.add('');
            end;
       end
       else
       if Components[i] is TSDK3Image then
       begin
            if lyt = 0 then
            begin
              memo.Lines.add(#9 + MakeImage((Components[i] as TSDK3Image)));
              memo.lines.add('');
            end;
       end
     end;

     if svdlg.Execute then
     begin
          memo.Lines.SaveToFile(svdlg.FileName);
     end;
     memo.free;
     svdlg.Free;



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
               f := 'left="' + inttostr(item.Left) + '" top="' + inttostr(item.top) +
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
     s := stringReplace(s, 'showProgress="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'showProgress="-1"', 'showProgress="true"', [rfReplaceALL]);

     s := stringReplace(s, 'hint=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'fontSize="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'fontColor="#000000"', '', [rfReplaceALL]);
     s := stringReplace(s, 'fontFamily="default"', '', [rfReplaceALL]);
     s := stringReplace(s, 'field=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'items=""', 'items="{}"', [rfReplaceALL]);
     s := stringReplace(s, 'values=""', 'values="{}"', [rfReplaceALL]);
     s := stringReplace(s, 'value=""', '', [rfReplaceALL]);

     s := stringReplace(s, 'autoHeight="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'maxControlsPerLine=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'MmxColumns=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'lineSpacing=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'contentWidth="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'contentHeight="0"', '', [rfReplaceALL]);
     s := stringReplace(s, 'frameStyle=""', '', [rfReplaceALL]);
     s := stringReplace(s, 'frameRegion=""', '', [rfReplaceALL]);

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

end.

