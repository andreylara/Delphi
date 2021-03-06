unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxBarBuiltInMenu, cxContainer, cxEdit,
  Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls, cxButtons, Vcl.ComCtrls, cxGroupBox,
  cxPC, dxGDIPlusClasses, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, uUtil_FD, REST.Types,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Datasnap.DBClient, System.JSON, cxCurrencyEdit, Vcl.Grids, Vcl.DBGrids,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, Generics.Collections, Model.Cliente,
  Model.Cidade;

type
  TFrmPrincipal = class(TForm)
    tabControl: TcxPageControl;
    tabLista: TcxTabSheet;
    tabCadastro: TcxTabSheet;
    gbFuncaoLista: TcxGroupBox;
    lbTelefone: TLabel;
    edtFone: TEdit;
    lbEmail: TLabel;
    edtEmail: TEdit;
    lbNome: TLabel;
    edtNome: TEdit;
    imgSalvar: TImage;
    imgExcluir: TImage;
    imgAdicionar: TImage;
    dbgCliente: TDBGrid;
    dsCliente: TDataSource;
    tabControlLista: TcxPageControl;
    tabLsitaCidade: TcxTabSheet;
    tabListaCliente: TcxTabSheet;
    dbgCidade: TDBGrid;
    dsCidade: TDataSource;
    cdsCidade: TClientDataSet;
    cdsCidadeId: TIntegerField;
    cdsCidadeNome: TStringField;
    cdsCidadeEstado: TStringField;
    tabControlCadastro: TcxPageControl;
    tabCadCliente: TcxTabSheet;
    tabCadCidade: TcxTabSheet;
    gbFuncaoCad: TcxGroupBox;
    lbCidade: TLabel;
    edtCidade: TEdit;
    lbEstado: TLabel;
    edtEstado: TEdit;
    cdsCliente: TClientDataSet;
    cdsClienteId: TIntegerField;
    cdsClienteNome: TStringField;
    cdsClienteEmail: TStringField;
    cdsClienteFone: TStringField;
    gbFiltroCidade: TcxGroupBox;
    Label1: TLabel;
    cbbFiltroCidades: TcxComboBox;
    cbbCidadeCliente: TcxComboBox;
    lbCidadeCliente: TLabel;
    cdsClienteCidade: TIntegerField;
    procedure imgAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgSalvarClick(Sender: TObject);
    procedure imgExcluirClick(Sender: TObject);
    procedure AddClienteGrid(oCliente: TCliente);
    procedure AddCidadeGrid(oCidade: TCidade);
    procedure AlteraPagina(page: integer);
    procedure GETClientes;
    procedure GETCidades;
    procedure LimpaCampos;
    procedure dbgClienteDblClick(Sender: TObject);
    procedure dbgCidadeDblClick(Sender: TObject);
    procedure cbbFiltroCidadesPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FIdCliente, FIdCidade: integer;
    FListaClientes: TObjectList<TCliente>;
    FListaCidades: TObjectList<TCidade>;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses Model.Dados, Controller.Cliente, Controller.Cidade;

procedure TFrmPrincipal.AlteraPagina(page: integer);
begin
  if tabControl.ActivePageIndex = 0 then
    tabControlCadastro.ActivePageIndex := tabControlLista.ActivePageIndex
  else
    tabControlLista.ActivePageIndex := tabControlCadastro.ActivePageIndex;
  tabControl.ActivePageIndex := page;
end;

procedure TFrmPrincipal.cbbFiltroCidadesPropertiesChange(Sender: TObject);
begin
  if cbbFiltroCidades.ItemIndex > 0 then
    FIdCidade := cbbFiltroCidades.ItemIndex
  else
    FIdCidade := 0;
  GETClientes;
end;

procedure TFrmPrincipal.dbgClienteDblClick(Sender: TObject);
begin
  imgExcluir.Visible := True;
  FIdCliente := cdsClienteId.Value;
  edtNome.Text := cdsClienteNome.Value;
  edtEmail.Text := cdsClienteEmail.Value;
  edtFone.Text := cdsClienteFone.Value;
  AlteraPagina(1);
end;

procedure TFrmPrincipal.dbgCidadeDblClick(Sender: TObject);
begin
  imgExcluir.Visible := True;
  FIdCliente := cdsCidadeId.Value;
  edtCidade.Text := cdsCidadeNome.Value;
  edtEstado.Text := cdsCidadeEstado.Value;
  AlteraPagina(1);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  FListaClientes := TObjectList<TCliente>.Create;
  FListaCidades := TObjectList<TCidade>.Create;
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListaClientes);
  FreeAndNil(FListaCidades);
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  AlteraPagina(0);
  GETClientes;
  GETCidades;
end;

procedure TFrmPrincipal.GETClientes;
var
  sErro: string;
  oClienteController: TClienteController;
  i: integer;
  oCliente: TCliente;
begin
  cdsCliente.EmptyDataSet;
  oCliente := nil;
  try
    try
      FListaClientes := oClientecontroller.Pesquisar(FIdCidade, sErro);
      if FListaClientes <> nil then
      begin
        for i := 0 to FListaClientes.Count - 1 do
        begin
          oCliente := FListaClientes.Items[i];
          AddClienteGrid(oCliente);
        end;
      end;
    finally
    end;
  except
    on ex: exception do
      raise Exception.Create(sErro)
  end;
end;

procedure TFrmPrincipal.AddClienteGrid(oCliente: TCliente);
begin
  cdsCliente.Open;
  cdsCliente.Append;
  cdsClienteId.Value := oCliente.Id;
  cdsClienteNome.Value := oCliente.Nome;
  cdsClienteEmail.Value := oCliente.Email;
  cdsClienteFone.Value := oCliente.Fone;
  cdsClienteCidade.Value := oCliente.Cidade;
end;

procedure TFrmPrincipal.GETCidades;
var
  sErro: string;
  oCidadeController: TCidadeController;
  i: integer;
  oCidade: TCidade;
begin
  cdsCidade.EmptyDataSet;
  oCidade := nil;
  try
    try
      FListaCidades := oCidadeController.Pesquisar(sErro);
      if FListaCidades <> nil then
      begin
        for i := 0 to FListaCidades.Count - 1 do
        begin
          oCidade := FListaCidades.Items[i];
          AddCidadeGrid(oCidade);
          cbbFiltroCidades.Properties.Items.Add(oCidade.ID.ToString + '-' + oCidade.Nome);
          cbbCidadeCliente.Properties.Items.Add(oCidade.ID.ToString + '-' + oCidade.Nome);
        end;
        cbbFiltroCidades.ItemIndex := 0;
        cbbCidadeCliente.ItemIndex := 0;
      end;
    finally
    end;
  except
    on ex: exception do
      raise Exception.Create(sErro)
  end;
end;

procedure TFrmPrincipal.AddCidadeGrid(oCidade: TCidade);
begin
  cdsCidade.Open;
  cdsCidade.Append;
  cdsCidadeId.Value := oCidade.Id;
  cdsCidadeNome.Value := oCidade.Nome;
  cdsCidadeEstado.Value := oCidade.Estado;
end;

procedure TFrmPrincipal.imgAdicionarClick(Sender: TObject);
begin
  LimpaCampos;
  AlteraPagina(1);
end;

procedure TFrmPrincipal.imgSalvarClick(Sender: TObject);
var
  sErro: string;
  verbo: TRestRequestMethod;
  oCliente: TCliente;
  oClienteController: TClienteController;
  oCidade: TCidade;
  oCidadeController: TCidadeController;
begin
  if tabControlCadastro.ActivePageIndex = 0 then
  begin
    oCliente := TCliente.Create;
    oClienteController := TClienteController.Create;
    try
      oCliente.Id := FIdCliente;   
      oCliente.Nome := edtNome.Text;
      oCliente.Email := edtEmail.Text;
      oCliente.Fone := edtFone.Text;
      oCliente.Cidade := cbbCidadeCliente.ItemIndex;

      if not oClienteController.Salvar(oCliente, sErro) then
        raise Exception.Create(sErro)
      else
      begin
        GETClientes;
        LimpaCampos;
        AlteraPagina(0);
      end;
    finally
      FreeAndNil(oCliente);
      FreeAndNil(oClienteController);
    end;
  end else
  begin
    oCidade := TCidade.Create;
    oCidadeController := TCidadeController.Create;
    try
      oCidade.Id := FIdCidade;
      oCidade.Nome := edtNome.Text;
      oCidade.Estado := edtEstado.Text;

      if not oCidadeController.Salvar(oCidade, sErro) then
        raise Exception.Create(sErro)
      else
      begin
        GETCidades;
        LimpaCampos;
        AlteraPagina(0);
      end;
    finally
      FreeAndNil(oCidade);
      FreeAndNil(oCidadeController);
    end;
  end;
end;

procedure TFrmPrincipal.LimpaCampos;
begin
  edtNome.Text := '';
  edtEmail.Text := '';
  edtFone.Text := '';
  edtCidade.Text := '';
  edtEstado.Text := '';
  imgExcluir.Visible := false;
  FIdCliente := 0;
  FIdCidade := 0;
end;

procedure TFrmPrincipal.imgExcluirClick(Sender: TObject);
var
  oClienteController: TClienteController;
  oCidadeController: TCidadeController;
  sErro: string;
begin
  if tabControlCadastro.ActivePageIndex = 0 then
  begin
    oClienteController := TClienteController.Create;
    try
      if not oClienteController.Excluir(FIdCliente, sErro) then
        ShowMessage(sErro)
      else
      begin
        GETClientes;
        LimpaCampos;
        AlteraPagina(0);
      end;
    finally
      FreeAndNil(oClienteController);
    end;
  end
  else
  begin
    oCidadeController := TCidadeController.Create;
    try
      if not oCidadeController.Excluir(FIdCidade, sErro) then
        ShowMessage(sErro)
      else
      begin
        GETCidades;
        LimpaCampos;
        AlteraPagina(0);
      end;
    finally
      FreeAndNil(oCidadeController);
    end;
  end;
end;

end.
