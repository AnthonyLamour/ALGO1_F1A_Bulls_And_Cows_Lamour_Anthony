unit Umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    BGo: TButton;
    BRaz: TButton;
    BQuit: TButton;
    LCows: TLabel;
    LMotJ: TLabel;
    LBulls: TLabel;
    EBulls: TEdit;
    ECows: TEdit;
    EResult: TEdit;
    Eessai: TEdit;
    EMotJ: TEdit;
    LMax: TLabel;
    MList: TMemo;
    Mmot: TMemo;
    LMot: TLabel;
    Lessai: TLabel;
    procedure BQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BGoClick(Sender: TObject);
    procedure BRazClick(Sender: TObject);
    procedure victoire_defaite();
    procedure init();
    procedure compter_bulls_and_cows();
    procedure EMotJKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

type
  erreur=(Car,Spe,taille,aucune);

var
  Form1: TForm1;
  //tab sert � v�rifier si l'utilisateur entre 2 fois la m�me lettre
  Tab:array [1..26] of char;

implementation

{$R *.dfm}

procedure TForm1.init();
//BUT initialiser la fen�tre les edits le mot � trouver, le nombre d'essai et les labels
//ENTREE cr�ation de la fen�tre ou click sur le boutton RAZ
//SORTIE la fen�tre initialiser
var
  nb:integer;
begin
  //chargement des mots du fichier liste dans un m�mo
  MList.lines.LoadFromFile('liste.txt');
  //s�lection al�atoire d'un mot
  randomize;
  nb:=random(MList.Lines.Count);
  //sauvegarde du mot choisi dans un m�mo
  Mmot.Lines[0]:=MList.Lines[nb];
  //calcule de la taille du mot
  nb:=length(Mmot.Lines[0]);
  //affichage de la taille du mot au joueur
  LMax.Caption:='Max '+inttostr(nb);
  //d�terminaison du nombres d'essais fonction de la taille du mot
  case nb of
    3:begin
      Eessai.Text:='4';
    end;
    4:begin
      Eessai.Text:='7';
    end;
    5:begin
      Eessai.Text:='10';
    end;
    6:begin
      Eessai.Text:='16';
    end;
    7:begin
      Eessai.Text:='20';
    end;
  end;
  //initialisation des Bulls et des Cows
  EBulls.Text:='0';
  ECows.Text:='0';
  //initialisation du edit permettant � l'utilisateur d'entrer un mot
  EMotJ.Text:='';
  //initialisation du edit de victoire/d�faite
  Eresult.Text:='';
  //d�blocage du boutton Go
  BGo.Enabled:=True;
  //effacement du mot r�v�l� de la partie pr�c�dente
  LMot.Visible:=false;
  //effacement de EResult
  EResult.Visible:=false;
end;

procedure TForm1.victoire_defaite;
//BUT d�terminer si le joueur gagne ou perd
//ENTREE le mot chercher, le mot de l'utilisateur et nombre d'essais restant
//SORTIE victoire/d�faite/rien
begin
  //Si le mot entr� par l'utilisateur est le m�me que le mot chercher alors...
  if EMotJ.Text=Mmot.Lines[0] then
    begin
      //... on afficher la victoire du joueur et on bloque le boutton Go
      EResult.Text:='Victoire !';
      EResult.Visible:=True;
      BGo.Enabled:=false;
    end
  else
    //Sinon si le nombre d'essais du joueur est 0 alors...
    begin
      if Eessai.Text='0' then
        begin
          //...on affiche la d�faite du joueur, on bloque le boutton Go et on lui r�v�le le mot
          EResult.text:='Perdu.';
          EResult.Visible:=True;
          BGo.Enabled:=False;
          LMot.Caption:='Le mot �tait : '+Mmot.Lines[0];
          LMot.Left:=Form1.width DIV 2-LMot.Width DIV 2;
          LMot.Top:=BRaz.Top-LMot.Height-25;
          LMot.Visible:=true;
        end;
    end;
end;

procedure TForm1.compter_bulls_and_cows;
//BUT compter et afficher le nombre de Bulls et de Cows
//ENTREE le mot du joueur et le mot chercher
//SORTIE le nombre de Bulls et le nombre de Cows
var
  i,j,bulls,cows:integer;
  test:boolean;
  E:erreur;
begin
  //initialisation des variables
  cows:=0;
  bulls:=0;
  test:=True;
  E:=aucune;
  for i := 1 to 26 do
    begin
      Tab[i]:=' ';
    end;
  //Si le mot du joueur est vide, trop long ou trop court alors on lui affiche une erreur
  if (EMotJ.Text=' ') or (length(EMotJ.Text)<length(Mmot.Lines[0])) or (length(EMotJ.Text)>length(Mmot.Lines[0]))  then
    begin
      showmessage('La taille de votre mot doit �tre '+inttostr(length(Mmot.Lines[0])));
      E:=taille;
    end;
  //pour chaque lettre du mot de l'utilisateur
  for i := 1 to length(EMotJ.Text) do
    begin
      //si c'est un caract�re sp�ciale alors on m�morise une erreur
      if (EMotJ.Text[i]<>'a') AND (EMotJ.Text[i]<>'b') AND (EMotJ.Text[i]<>'c') AND (EMotJ.Text[i]<>'d') AND (EMotJ.Text[i]<>'e') AND (EMotJ.Text[i]<>'f') AND (EMotJ.Text[i]<>'g') AND (EMotJ.Text[i]<>'h') AND (EMotJ.Text[i]<>'i') AND (EMotJ.Text[i]<>'j') AND (EMotJ.Text[i]<>'k') AND (EMotJ.Text[i]<>'l') AND (EMotJ.Text[i]<>'m') AND (EMotJ.Text[i]<>'n') AND (EMotJ.Text[i]<>'o') AND (EMotJ.Text[i]<>'p') AND (EMotJ.Text[i]<>'q') AND (EMotJ.Text[i]<>'r') AND (EMotJ.Text[i]<>'s') AND (EMotJ.Text[i]<>'t') AND (EMotJ.Text[i]<>'u') AND (EMotJ.Text[i]<>'v') AND(EMotJ.Text[i]<>'w') AND (EMotJ.Text[i]<>'x') AND (EMotJ.Text[i]<>'y') AND (EMotJ.Text[i]<>'z') then
        begin
          E:=Spe;
        end;
      //si la lettre existe d�j� dans le mot alors on m�morise une erreur sinon on sauvegarde la lettre dans tab
      for j := 1 to 26 do
        begin
          if (EMotJ.Text[i]=Tab[j]) and (E=aucune) then
            begin
              E:=Car;
            end
          else
            begin
              if (Tab[j]=' ') and (E<>Spe) and test then
                begin
                   test:=false;
                   Tab[j]:=EMotJ.Text[i];
                end;
            end;
        end;
    end;
  //en cas d'erreur on afficher l'erreur en question
  if E=Car then
    begin
      showmessage('Votre mot contient 2 caract�res identiques');
    end;
  if E=Spe then
    begin
      showmessage('Caract�re sp�cial ou majuscule d�tect�e');
    end;
  //sinon on compte le nombre de Bulls et de Cows et on les affiche
  if E=aucune then
    begin
      for i := 1 to length(EMotJ.Text) do
        begin
          for j := 1 to length(Mmot.Lines[0]) do
            begin
              if (EMotJ.Text[i]=Mmot.Lines[0][j]) and (i=j) then
                begin
                   bulls:=bulls+1;
                end
              else
                begin
                   if (EMotJ.Text[i]=Mmot.Lines[0][j]) then
                    begin
                       cows:=cows+1;
                    end;
                end;
            end;
        end;
        Eessai.Text:=inttostr(strtoint(Eessai.Text)-1);
        EBulls.Text:=inttostr(bulls);
        ECows.Text:=inttostr(cows);
    end;
    //on v�rifie si le joueur a perdu ou gagn� ou si il continu
    victoire_defaite;
end;

procedure TForm1.EMotJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//BUT si le joueur presse entrer alors on lance le jeu
//ENTREE la touche entrer
//SORTIE lancement du jeu
begin
  //si le joeur presse entrer et qu'il poss�de encor des essais alors on lance le jeu
  if (key=13) and (Eessai.text<>'0') then
    begin
      compter_bulls_and_cows
    end;
end;

procedure TForm1.BGoClick(Sender: TObject);
//BUT si le joueur click sur le boutton Go alors on lance le jeu
//ENTREE click sur le boutton Go
//SORTIE lancement du jeu
begin
   compter_bulls_and_cows();
end;

procedure TForm1.BQuitClick(Sender: TObject);
//BUT permettre au joueur de fermer l'application
//ENTREE click sur le boutton Quitter
//SORTIE revenir sur la fen�tre/ fermer l'application
begin
  //affichage du message et des boutton oui/non
  if MessageDlg('Voulez vous vraiment quitter ?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
            begin
              //si l'utilisateur s�lectionne oui alors on ferme l'application
              close;
            end;
end;

procedure TForm1.BRazClick(Sender: TObject);
//BUT remettre le jeu � 0
//ENTREE click sur le boutton remise � z�ro
//SORTIE la fen�tre r�initialis�
begin
  //r�initialisation
  init();
  //focus sur le edit du joueur
  EMotJ.SetFocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
//BUT cr�er la fen�tre
//ENTREE lancement de l'application
//SORTIE la fen�tre initialis�
begin
  //initialisation de la fen�tre
  init();
end;

procedure TForm1.FormResize(Sender: TObject);
//BUT aranger la fen�tre en cas de changement de taille de cette derni�re
//ENTREE changement de taille de la fen�tre
//SORTIE la fen�tre aranger par rapport � sa taille
begin
  //taille minimale de la fen�tre
  if Form1.Width<680 then
    begin
      Form1.Width:=680
    end;
  if Form1.Height<430 then
    begin
      Form1.Height:=430;
    end;
  //positionnement de EMotJ
  EMotJ.Left:=Form1.Width DIV 2-EMotJ.Width DIV 2;
  EMotJ.Top:=Form1.Height DIV 4;
  //positionnement de LMotJ
  LMotJ.Left:=EMotJ.Left-LMotJ.Width-10;
  LMotJ.Top:=EMotJ.Top;
  //positionnement de LMax
  LMax.Left:=EMotJ.Left+EMotJ.width+10;
  LMax.Top:=EMotJ.Top;
  //positionnement de LBulls
  LBulls.Left:=LMotJ.Left;
  LBulls.Top:=EMotJ.Top+EMotJ.Height+50;
  //positionnement de LCows
  LCows.Left:=LMotJ.Left;
  LCows.Top:=LBulls.Top+LBulls.Height+50;
  //positionnement de EBulls
  EBulls.Left:=LBulls.Left+LBulls.Width+10;
  EBulls.Top:=LBulls.Top;
  //positionnement de ECows
  ECows.Left:=EBulls.Left;
  ECows.Top:=LCows.Top;
  //positionnement de Eessai
  Eessai.Left:=LMax.Left+LMax.Width-Eessai.Width;
  Eessai.Top:=EBulls.Top;
  //positionnement de EResult
  EResult.Left:=Eessai.Left;
  EResult.Top:=ECows.Top;
  //positionnement de BRaz
  BRaz.Left:=Form1.Width DIV 2-BRaz.Width DIV 2;
  BRaz.Top:=ECows.Top+ECows.Height+50;
  //positionnement de BGo
  BGo.Left:=BRaz.Left-Braz.Width DIV 2-30-BGo.Width;
  BGo.Top:=BRaz.Top;
  //positionnement de BQuit
  BQuit.Left:=BRaz.Left+Braz.Width DIV 2+30+BQuit.Width;
  BQuit.Top:=BRaz.Top;
  //positionnement de Lessai
  Lessai.Left:=Eessai.Left;
  Lessai.Top:=Eessai.Top-Lessai.Height-15;
end;

end.
