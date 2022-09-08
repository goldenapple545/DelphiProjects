unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Add: TButton;
    Del: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    procedure AddClick(Sender: TObject);
    procedure DelClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.AddClick(Sender: TObject);
begin
   //Элемент списка не выбран
   if (Edit1.Text <> '') and (ListBox1.ItemIndex = -1) then
   begin
     ListBox1.Items.Add(Edit1.Text);
     Edit1.Text := '';
   end;
   //Элемент списка выбран
   if (Edit1.Text <> '') and (ListBox1.ItemIndex <> -1) then
   begin
     ListBox1.Items[ListBox1.ItemIndex] := Edit1.Text;
     ListBox1.ItemIndex := -1;
     Add.Caption := 'Добавить';
     Edit1.Text := '';
   end;
end;

procedure TForm1.DelClick(Sender: TObject);
begin
  if (ListBox1.ItemIndex <> -1) then
    begin
      ListBox1.Items.Delete(ListBox1.ItemIndex);
      Edit1.Text := '';
      Add.Caption := 'Добавить';
      ListBox1.ItemIndex := -1;
    end;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
  if (ListBox1.ItemIndex = -1) then
    Edit1.Text:='';
end;

//При клике по элементу, элемент добавляется в Edit1
procedure TForm1.ListBox1Click(Sender: TObject);
begin
  if (ListBox1.ItemIndex <> -1) then
    begin
      Edit1.Text := ListBox1.Items[ListBox1.ItemIndex];
      Add.Caption := 'Изменить';
    end;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
   Form2.Show;
end;

end.

