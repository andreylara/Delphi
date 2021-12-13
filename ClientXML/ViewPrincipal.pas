unit ViewPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.StdCtrls, Datasnap.DBClient, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, cxTextEdit, cxCurrencyEdit;

type
  TFrmPrincipal = class(TForm)
    lbDescricao: TLabel;
    edtDescricao: TEdit;
    lbValor: TLabel;
    imgExcluir: TImage;
    imgSalvar: TImage;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    cdsProdutoId: TIntegerField;
    cdsProdutoDescricao: TStringField;
    cdsProdutoValor: TFloatField;
    cdsProdutoQuantidade: TFloatField;
    cdsProdutoTotal: TFloatField;
    edtQuantidade: TEdit;
    edtValor: TcxCurrencyEdit;
    procedure imgSalvarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure imgExcluirClick(Sender: TObject);
  private
    procedure LimpaCampos;
  public
    function ProximoID(Id: integer): integer;
    function CalculaTotal(Valor, Quantidade: Double): Double;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses
  uProduto;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
var
  Produto: TProdutoSingleton;
begin
  Produto := TProdutoSingleton.GetInstance;
  Produto.LerXML(cdsProduto.RecordCount, cdsProduto);
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
var
  Produto: TProdutoSingleton;
begin
  Produto := TProdutoSingleton.GetInstance;
  Produto.GerarXML(cdsProduto);
end;

procedure TFrmPrincipal.imgExcluirClick(Sender: TObject);
begin
  cdsProduto.Open;
  cdsProduto.Delete;
  LimpaCampos;
end;

procedure TFrmPrincipal.imgSalvarClick(Sender: TObject);
var
  Produto: TProdutoSingleton;
begin
  Produto := TProdutoSingleton.GetInstance;

  cdsProduto.Open;
  cdsProduto.Append;
  cdsProdutoId.Value := ProximoID(cdsProduto.RecordCount);
  cdsProdutoDescricao.Value := edtDescricao.Text;
  cdsProdutoValor.Value := edtValor.Value;
  cdsProdutoQuantidade.Value := StrToInt(edtQuantidade.Text);
  cdsProdutoTotal.Value := CalculaTotal(edtValor.Value, StrToInt(edtQuantidade.Text));
  LimpaCampos;
end;

procedure TFrmPrincipal.LimpaCampos;
begin
  edtDescricao.Text := '';
  edtValor.Text := '0';
  edtQuantidade.Text := '0';
  edtDescricao.SetFocus;
end;

function TFrmPrincipal.ProximoID(Id: integer): integer;
begin
  Result := Id + 1;
end;

function TFrmPrincipal.CalculaTotal(Valor, Quantidade: Double): Double;
begin
  Result := Valor * Quantidade;
end;

end.
