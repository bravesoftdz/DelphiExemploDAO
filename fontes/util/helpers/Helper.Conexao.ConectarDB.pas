{
  Classe utilit�ria
  Declara m�todos para conex�o com o DB
}

unit Helper.Conexao.ConectarDB;

interface

uses
  SqlExpr, Util.Constantes;
type
  TConnConectDB = class
  strict private
    const
      DB_SENHA = 'masterkey';
      DB_USER = 'SYSDBA';

      DATABASE = 'F:\DelphiExemploDAO\compilacao\dados.fdb';
      //DIR_APLICACAO + 'dados.fdb';

  public
    class procedure Connect( ASQLConnection: TSQLConnection );
  end;

implementation

{ TUtilConexaoConectarDB }

class procedure TConnConectDB.Connect(ASQLConnection: TSQLConnection);
begin
  if (ASQLConnection.Connected) then
    ASQLConnection.Close;

  ASQLConnection.ConnectionName := 'FBConnection';
  ASQLConnection.DriverName := 'Firebird';
  ASQLConnection.LoadParamsOnConnect := False;
  ASQLConnection.LoginPrompt:= False;

  with ASQLConnection.Params do
  begin
    Values['Database'] := DATABASE;

    Values['Password'] := DB_SENHA;
    Values['User_Name'] := DB_USER;
  end;

  ASQLConnection.Open;
end;


end.
