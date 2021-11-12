unit uuhr;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Graphics, Controls, extctrls, usegment7;

type

  { TUhr }

  TUhr = class(TPanel)
  public
    constructor Create(AOwner : TWinControl; iX, iY, iMassstab : integer; clFarbe : TColor); reintroduce;
    destructor Destroy; reintroduce;  
    procedure Tick;
    function boSetzeZeit(sZeit : String) : boolean;
    function sGibZeit : String;
  end;

var
  oZiffer1 : TSegment7;
  oZiffer2 : TSegment7;
  oZiffer3 : TSegment7;
  oZiffer4 : TSegment7;

implementation

{ TUhr }

constructor TUhr.Create(AOwner: TWinControl; iX, iY, iMassstab: integer;
  clFarbe: TColor);
begin
  inherited Create(AOwner);
  Parent := AOwner;

  self.Left := iX;
  self.Top := iY;   
  self.Width := iMassstab*3 + iMassstab * 11 * 4;
  self.Height := iMassstab * 18;

  oZiffer1 := TSegment7.Create(self, 0, 0, iMassstab, clFarbe);
  oZiffer2 := TSegment7.Create(self, iMassstab*11, 0, iMassstab, clFarbe);
  oZiffer3 := TSegment7.Create(self, iMassstab*3 + iMassstab*11*2, 0, iMassstab, clFarbe);
  oZiffer4 := TSegment7.Create(self, iMassstab*3 + iMassstab*11*3, 0, iMassstab, clFarbe);
end;

destructor TUhr.Destroy;
begin
  oZiffer1.Destroy;
  oZiffer1 := nil;
  oZiffer1.Free;

  oZiffer2.Destroy;
  oZiffer2 := nil;
  oZiffer2.Free;

  oZiffer3.Destroy;
  oZiffer3 := nil;
  oZiffer3.Free;

  oZiffer4.Destroy;
  oZiffer4 := nil;
  oZiffer4.Free;

  inherited Destroy;
end;

function TUhr.boSetzeZeit(sZeit: String): boolean;  
var
  iMinuten : integer;
  iStunden : integer;
begin
  if Length(sZeit) = 4 then
  begin
    iMinuten := StrToInt(sZeit[3]) * 10 + StrToInt(sZeit[4]);
    iStunden := StrToInt(sZeit[1]) * 10 + StrToInt(sZeit[2]);
    if (iMinuten > 59) or (iStunden > 23) then
       Result := False
    else
      begin
        oZiffer1.SetzeWert(StrToInt(sZeit[1]));
        oZiffer2.SetzeWert(StrToInt(sZeit[2]));
        oZiffer3.SetzeWert(StrToInt(sZeit[3]));
        oZiffer4.SetzeWert(StrToInt(sZeit[4])); 
        Result := True;
      end;
  end
  else
    Result := False;
end;

procedure TUhr.Tick;
var
  iMinuten : integer;
  iStunden : integer;
begin
  iMinuten := oZiffer3.iGibWert * 10 + oZiffer4.iGibWert;
  iStunden := oZiffer1.iGibWert * 10 + oZiffer2.iGibWert;

  if iMinuten >= 59 then
  begin
    oZiffer3.SetzeWert(0);
    oZiffer4.SetzeWert(0);
    if iStunden >= 23 then
    begin
      oZiffer1.SetzeWert(0);
      oZiffer2.SetzeWert(0);
    end
    else
      begin
        Inc(iStunden);   
        oZiffer1.SetzeWert(iStunden div 10);
        oZiffer2.SetzeWert(iStunden mod 10);
      end;
  end
  else
    begin
      Inc(iMinuten);
      oZiffer3.SetzeWert(iMinuten div 10);
      oZiffer4.SetzeWert(iMinuten mod 10);
    end;
end;

function TUhr.sGibZeit: String;
begin
  Result := IntToStr(oZiffer1.iGibWert) + IntToStr(oZiffer2.iGibWert) + ':' + IntToStr(oZiffer3.iGibWert) + IntToStr(oZiffer4.iGibWert);
end;

end.

