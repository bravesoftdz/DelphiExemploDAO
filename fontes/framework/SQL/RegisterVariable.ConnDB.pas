unit RegisterVariable.ConnDB;

interface

uses
  Data.SqlExpr;

type
  TRegisterVariable = class
  strict private
    class var FConnDB: TSQLConnection;
    class function GetConnDB: TSQLConnection; static;

  public
    class property ConnDB: TSQLConnection read GetConnDB;
    class procedure Register( const AConnDB: TSQLConnection );
  end;

implementation

{ TRegisterVariable }

class function TRegisterVariable.GetConnDB: TSQLConnection;
begin
  Result:= FConnDB;
end;



class procedure TRegisterVariable.Register(const AConnDB: TSQLConnection);
begin
  FConnDB:= AConnDB;
end;



end.
