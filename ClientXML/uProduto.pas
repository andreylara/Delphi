unit uProduto;

interface

uses
  System.Classes, DBClient, XMLDoc, XMLIntf;

const
  Path = 'C:\Visual Software\Teste.xml';
  
type
  TProdutoSingleton = class(TComponent)
  private
    constructor Create(AOWner: TComponent); override;
  public
    class function GetInstance: TProdutoSingleton;

    class function NewInstance: TObject; override;

    procedure GerarXML(pProdutos: TClientDataSet);
    procedure LerXML(Id: Integer; out pProdutos: TClientDataSet);

    destructor Destroy; override;
  end;

var
  Instance: TProdutoSingleton;

implementation

uses
  Forms, SysUtils;

{ TProdutoSingleton }

constructor TProdutoSingleton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TProdutoSingleton.Destroy;
begin
  FreeAndNil(Instance);
  inherited;
end;

class function TProdutoSingleton.NewInstance: TObject;
begin
  if not Assigned(Instance) then
  begin
    Instance := TProdutoSingleton(inherited NewInstance);
  end;

  Result := Instance;
end;

procedure TProdutoSingleton.GerarXML(pProdutos: TClientDataSet);
var
  Doc: TXMLDocument;
  NodeArquivo, NodeRegistro: IXMLNode;
begin
  Doc := TXMLDocument.Create(nil);
  try
    Doc.Active := True;
    NodeArquivo := Doc.AddChild('XML');
    pProdutos.First;
    while not pProdutos.Eof do
    begin
      NodeRegistro := NodeArquivo.AddChild('Produto');
      NodeRegistro.ChildValues['Id'] := pProdutos.FieldByName('Id').AsString;
      NodeRegistro.ChildValues['Descricao'] := pProdutos.FieldByName('Descricao').AsString;
      NodeRegistro.ChildValues['Valor'] := pProdutos.FieldByName('Valor').AsString;
      NodeRegistro.ChildValues['Quantidade'] := pProdutos.FieldByName('Quantidade').AsString;
      NodeRegistro.ChildValues['Total'] := pProdutos.FieldByName('Total').AsString;
      pProdutos.Next;
    end;
    Doc.SaveToFile(Path);
  finally
    Doc.Free;
  end;
end;

class function TProdutoSingleton.GetInstance: TProdutoSingleton;
begin
  Result := TProdutoSingleton.Create(nil);
end;

procedure TProdutoSingleton.LerXML(Id: Integer; out pProdutos: TClientDataSet);
var
  Doc: IXMLDocument;
  Node: IXMLNode;
  I, vId: Integer;
begin  
  Doc := LoadXMLDocument(Path);
  Node := Doc.DocumentElement;
  vId := 0;
  with Node do
  begin
    for I := 0 to ChildNodes.Count - 1 do
    begin
      if Id = 0 then
        vId := vId + 1
      else
        vId := StrToInt(ChildNodes[I].ChildNodes['Id'].Text);

      pProdutos.Open;
      pProdutos.Append;
      pProdutos.FieldByName('Id').AsInteger := vId;
      pProdutos.FieldByName('Descricao').AsString := ChildNodes[I].ChildNodes['Descricao'].Text;
      pProdutos.FieldByName('Valor').AsFloat := StrToFloat(ChildNodes[I].ChildNodes['Valor'].Text);
      pProdutos.FieldByName('Quantidade').AsFloat := StrToFloat(ChildNodes[I].ChildNodes['Quantidade'].Text);
      pProdutos.FieldByName('Total').AsFloat := StrToFloat(ChildNodes[I].ChildNodes['Total'].Text);
    end;
  end;
end;

end.
