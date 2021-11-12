unit usegment7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Graphics, Controls, extctrls;

type

  { TSegment7 }

  TSegment7 = class(TImage)
  private
    iWert : integer;
    iMassstab : integer;
    clFarbe : TColor;
    procedure ZeichneSegment(iSegment : integer);
    procedure Bereinigen;
  public
    constructor Create(AOwner : TWinControl; iX, iY, iParMassstab : integer; clParFarbe : TColor); reintroduce;
    destructor Destroy; reintroduce;
    procedure SetzeWert(iParWert : integer);
    function iGibWert : integer;
  end;

implementation

{ TSegment7 }

procedure TSegment7.ZeichneSegment(iSegment: integer);
var
  apPolygon0,
  apPolygon1,
  apPolygon2,
  apPolygon3,
  apPolygon4,
  apPolygon5,
  apPolygon6 : array[0..5] of TPoint;
  iSchleife : integer;
begin
  apPolygon0[0] := TPoint.Create(2*iMassstab, 2*iMassstab); 
  apPolygon0[1] := TPoint.Create(3*iMassstab, 1*iMassstab);
  apPolygon0[2] := TPoint.Create(8*iMassstab, 1*iMassstab);
  apPolygon0[3] := TPoint.Create(9*iMassstab, 2*iMassstab);
  apPolygon0[4] := TPoint.Create(8*iMassstab, 3*iMassstab);
  apPolygon0[5] := TPoint.Create(3*iMassstab, 3*iMassstab);
  
  apPolygon1[0] := TPoint.Create(9*iMassstab, 2*iMassstab);
  apPolygon1[1] := TPoint.Create(10*iMassstab, 3*iMassstab);
  apPolygon1[2] := TPoint.Create(10*iMassstab, 8*iMassstab);
  apPolygon1[3] := TPoint.Create(9*iMassstab, 9*iMassstab);
  apPolygon1[4] := TPoint.Create(8*iMassstab, 8*iMassstab);
  apPolygon1[5] := TPoint.Create(8*iMassstab, 3*iMassstab);

  for iSchleife := 0 to 5 do
    apPolygon2[iSchleife] := TPoint.Create(apPolygon1[iSchleife].x, apPolygon1[iSchleife].y + 7*iMassstab);
  for iSchleife := 0 to 5 do
    apPolygon3[iSchleife] := TPoint.Create(apPolygon0[iSchleife].x, apPolygon0[iSchleife].y + 14*iMassstab);
  for iSchleife := 0 to 5 do
    apPolygon4[iSchleife] := TPoint.Create(apPolygon1[iSchleife].x - 7*iMassstab, apPolygon1[iSchleife].y + 7*iMassstab);
  for iSchleife := 0 to 5 do
    apPolygon5[iSchleife] := TPoint.Create(apPolygon1[iSchleife].x - 7*iMassstab, apPolygon1[iSchleife].y);
  for iSchleife := 0 to 5 do
    apPolygon6[iSchleife] := TPoint.Create(apPolygon0[iSchleife].x, apPolygon0[iSchleife].y + 7*iMassstab);

  case iSegment of
    0: Canvas.Polygon(apPolygon0);
    1: Canvas.Polygon(apPolygon1);
    2: Canvas.Polygon(apPolygon2);
    3: Canvas.Polygon(apPolygon3);
    4: Canvas.Polygon(apPolygon4);
    5: Canvas.Polygon(apPolygon5);
    6: Canvas.Polygon(apPolygon6);
  end;
end;

procedure TSegment7.Bereinigen;
begin
  Canvas.Brush.Color := clWhite;
  Canvas.FillRect(0, 0, Width, Height);  
  Canvas.Brush.Color := clFarbe;
end;

constructor TSegment7.Create(AOwner: TWinControl; iX, iY,
  iParMassstab: integer; clParFarbe: TColor);
begin
  inherited Create(AOwner);
  Parent := AOwner;

  iMassstab := iParMassstab;
  clFarbe := clParFarbe;

  Left := iX;
  Top := iY;
  Width := iMassstab * 11;
  Height := iMassstab * 18;

  Canvas.Pen.Color := clWhite;
  Canvas.Brush.Color := clWhite;
  Canvas.FillRect(0, 0, Width, Height);
  Canvas.Brush.Color := clParFarbe;

  SetzeWert(0);
end;

destructor TSegment7.Destroy;
begin
 inherited Destroy;
end;

procedure TSegment7.SetzeWert(iParWert: integer);
begin
  iWert := iParWert;
  Bereinigen;
  case iParWert of
    0:
      begin
        ZeichneSegment(0); 
        ZeichneSegment(1);  
        ZeichneSegment(2);
        ZeichneSegment(3);   
        ZeichneSegment(4);
        ZeichneSegment(5);
      end;      
    1:
      begin
        ZeichneSegment(1);
        ZeichneSegment(2);
      end;    
    2:
      begin
        ZeichneSegment(0);
        ZeichneSegment(1);
        ZeichneSegment(3);
        ZeichneSegment(4);
        ZeichneSegment(6);
      end;
    3:
      begin
        ZeichneSegment(0);
        ZeichneSegment(1);
        ZeichneSegment(2);
        ZeichneSegment(3);  
        ZeichneSegment(6);
      end;
    4:
      begin
        ZeichneSegment(1);
        ZeichneSegment(2);
        ZeichneSegment(5);
        ZeichneSegment(6);
      end;
    5:
      begin
        ZeichneSegment(0);
        ZeichneSegment(2);
        ZeichneSegment(3); 
        ZeichneSegment(5);  
        ZeichneSegment(6);
      end;
    6:
      begin
        ZeichneSegment(0);
        ZeichneSegment(2);
        ZeichneSegment(3);
        ZeichneSegment(4);
        ZeichneSegment(5);
        ZeichneSegment(6);
      end;   
    7:
      begin
        ZeichneSegment(0);  
        ZeichneSegment(1);
        ZeichneSegment(2);
      end;
    8:
      begin
        ZeichneSegment(0);
        ZeichneSegment(1);
        ZeichneSegment(2); 
        ZeichneSegment(3);
        ZeichneSegment(4);
        ZeichneSegment(5);
        ZeichneSegment(6);
      end;
    9:
      begin
        ZeichneSegment(0);
        ZeichneSegment(1);
        ZeichneSegment(2);
        ZeichneSegment(3);
        ZeichneSegment(5);
        ZeichneSegment(6);
      end;
  end;
end;

function TSegment7.iGibWert: integer;
begin
  Result := iWert;
end;

end.

