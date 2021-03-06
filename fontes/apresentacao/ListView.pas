unit ListView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DAO.Cliente, Model.Cliente, CadastroDeClientes,
  BO.Exportar.Clientes;

type
  TFrmListView = class(TForm)
    BitBtn1: TBitBtn;
    ListBox1: TListBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);

  private
    { Private declarations }
    procedure AtualizarListaDeClientes();
  public
    { Public declarations }

    class procedure AbrirFormulario();
  end;

implementation

{$R *.dfm}

{ TFrmTreeView }

class procedure TFrmListView.AbrirFormulario;
var
  FrmListiew: TFrmListView;
begin
  FrmListiew:= TFrmListView.Create( nil );
  try
    FrmListiew.ShowModal();

  finally
    FreeAndNil( FrmListiew )
  end;


end;

procedure TFrmListView.AtualizarListaDeClientes;
var
  DAOCliente: TDAOCliente;
  Clientes: TModelListaCliente;
  Cliente: TModelCliente;
begin
  // Popula o ClientDataSet com a lista de clientes
  DAOCliente := TDAOCliente.Create();
  try
    try
      Clientes := DAOCliente.ListarTodos();

      ListBox1.Clear();

      for Cliente in Clientes do
      begin
        with ListBox1 do
        begin
          ListBox1.AddItem( IntToStr(Cliente.ID) +  ' - ' + Cliente.Nome,  Cliente );
        end;
      end

    finally
      FreeAndNil(Clientes)
    end;

  finally
    FreeAndNil(DAOCliente)

  end;
end;


procedure TFrmListView.BitBtn1Click(Sender: TObject);
begin
   TFrmCadastroDeClientes.CadastrarCliente();

   // {TODO} Implementar forma de identificar que um novo cliente foi cadastrado
   // para evitar fazer uma consulta no DB
   AtualizarListaDeClientes();
end;



procedure TFrmListView.BitBtn2Click(Sender: TObject);
begin
  if ( ListBox1.ItemIndex >= 0 ) then
  begin
    TFrmCadastroDeClientes.CadastrarCliente( TModelCliente( ListBox1.Items.Objects[ ListBox1.ItemIndex ] ).ID );

    AtualizarListaDeClientes();
  end;
end;



procedure TFrmListView.BitBtn3Click(Sender: TObject);
var
  DAOCliente: TDAOCliente;
begin
  if ( ListBox1.ItemIndex >= 0 ) then
  begin

    DAOCliente:= TDAOCliente.Create();
    try
      DAOCliente.Excluir( TModelCliente( ListBox1.Items.Objects[ ListBox1.ItemIndex ] ) );

      AtualizarListaDeClientes();
    finally
      FreeAndNil(DAOCliente)
    end;

  end;

end;


procedure TFrmListView.BitBtn5Click(Sender: TObject);
var
  DAOCliente: TDAOCliente;
  Clientes: TModelListaCliente;

begin
  DAOCliente := TDAOCliente.Create();
  try
    try
      Clientes := DAOCliente.ListarTodos();
      TBOExportarClientes.Exportar( Clientes );
    finally
      FreeAndNil( Clientes )
    end;
  finally
    FreeAndNil( DAOCliente );
  end;

end;



procedure TFrmListView.FormCreate(Sender: TObject);
begin
  AtualizarListaDeClientes();
end;


end.
