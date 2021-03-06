unit TestViewPrincipal;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, System.Variants, Data.DB, cxCurrencyEdit, cxTextEdit,
  Datasnap.DBClient, Winapi.Windows, Vcl.Dialogs, Vcl.Grids, cxGraphics, Vcl.Forms,
  cxControls, cxLookAndFeelPainters, System.SysUtils, Vcl.ExtCtrls, Vcl.Controls,
  dxSkinsCore, cxContainer, System.Classes, dxGDIPlusClasses, cxEdit, Winapi.Messages,
  Vcl.Graphics, cxLookAndFeels, Vcl.DBGrids, Vcl.StdCtrls, ViewPrincipal;

type
  // Test methods for class TFrmPrincipal

  TestTFrmPrincipal = class(TTestCase)
  strict private
    FFrmPrincipal: TFrmPrincipal;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestProximoID;
    procedure TestCalculaTotal;
  end;

implementation

procedure TestTFrmPrincipal.SetUp;
begin
  FFrmPrincipal := TFrmPrincipal.Create(nil);
end;

procedure TestTFrmPrincipal.TearDown;
begin
  FFrmPrincipal.Free;
  FFrmPrincipal := nil;
end;

procedure TestTFrmPrincipal.TestProximoID;
var
  ReturnValue: Integer;
  Id: Integer;
begin
  Id := 1;

  ReturnValue := FFrmPrincipal.ProximoID(Id);

  CheckEquals(2, ReturnValue, 'A fun??o para buscar o pr?ximo ID falhou!');
end;

procedure TestTFrmPrincipal.TestCalculaTotal;
var
  ReturnValue: Double;
  Quantidade: Double;
  Valor: Double;
begin
  Quantidade := 2;
  Valor := 2;

  ReturnValue := FFrmPrincipal.CalculaTotal(Valor, Quantidade);

  CheckEquals(4, ReturnValue, 'A fun??o para calcular o valor total falhou!');
end;

initialization
  RegisterTest(TestTFrmPrincipal.Suite);
end.

