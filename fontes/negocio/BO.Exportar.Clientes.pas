{
  Businnes Object
  Declara o m�todo de exporta��o dos dados do cliente
}

unit BO.Exportar.Clientes;

interface

uses VO.Cliente, BO.Exportar.Clientes.Leiaute;

type
  TBOExportarClientes = class
  public
    class procedure Exportar( const AClientes: TVOClienteLista );
  end;


implementation

{ TBOExportarClientes }

class procedure TBOExportarClientes.Exportar(const AClientes: TVOClienteLista);
var
  Leiaute: IVersaoLeiaute;
begin
  Leiaute:= TLeiauteFactory.Instance( {tleitCaractereSeparador}  tleitBlocado );

  Leiaute.Exportar( AClientes );
end;



end.
