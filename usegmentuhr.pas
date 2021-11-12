unit usegmentuhr;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  uuhr;

type

  { TFSegmentUhr }

  TFSegmentUhr = class(TForm)
    BEingabe: TButton;
    BAusgeben: TButton;
    BTick: TButton;
    EAusgabe: TEdit;
    EEingabe: TEdit;
    procedure BAusgebenClick(Sender: TObject);
    procedure BEingabeClick(Sender: TObject);
    procedure BTickClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public

  end;

var
  FSegmentUhr: TFSegmentUhr;
  oUhr : TUhr;

implementation

{$R *.lfm}

{ TFSegmentUhr }

procedure TFSegmentUhr.FormCreate(Sender: TObject);
const
  iX : integer = 0;
  iY : integer = 0;
  iMassstab : integer = 10;
begin
  oUhr := TUhr.Create(self, iX, iY + FSegmentUhr.Height, iMassstab, clBlack);
  self.Width := iX*2 + iMassstab*3 + iMassstab*11*4;
  self.Height := FSegmentUhr.Height + iY*2 + iMassstab*18;
end;

procedure TFSegmentUhr.BEingabeClick(Sender: TObject);
begin
  if not(oUhr.boSetzeZeit(EEingabe.Text)) then
    ShowMessage('Bitte gib die Zeit im 24-Stunden Format an!');
end;

procedure TFSegmentUhr.BTickClick(Sender: TObject);
begin
  oUhr.Tick;
end;

procedure TFSegmentUhr.BAusgebenClick(Sender: TObject);
begin
  EAusgabe.Text := oUhr.sGibZeit;
end;

procedure TFSegmentUhr.FormDestroy(Sender: TObject);
begin
  oUhr.Destroy;
  oUhr := nil;
  oUhr.Free;
end;

end.

