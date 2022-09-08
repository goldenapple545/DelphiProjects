unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    CreateBut: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Alert: TLabel;
    procedure CreateButClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CreateButClick(Sender: TObject);
var i: integer; ext: string; count: integer;
begin

  if (Edit1.Text <> '') and (Edit2.Text <> '') then
  begin
    if (StrToInt(Edit1.Text) > 1) then
    begin
      Alert.Caption := ''; //Убрать предыдущее предупреждение
      count := StrToInt(Edit1.Text);
      ext := Edit2.Text;

      for i := 1 to count do
        //ExtractFilePath(Application.ExeName) - получение относительного пути
        FileCreate( ExtractFilePath(Application.ExeName)+'\файлы\' + IntToStr(i)
        + '.' + ext );

      CreateBut.Caption := 'Выполнено!';
    end
    else
      Alert.Caption := 'Число меньше 2!';
  end;

end;


end.

