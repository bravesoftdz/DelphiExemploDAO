{
  Value Object
  VO da entidade cliente
}

unit Model.Cliente;

interface

uses
  Generics.Collections;

type
  TModelCliente = class
  private
    FID: Integer;
    FNome: string;
  public
    property ID:  Integer read FID write FID;
    property Nome: string read FNome write FNome;
  end;

  TModelListaCliente = class(TObjectList< TModelCliente >)
  end;

implementation

end.
