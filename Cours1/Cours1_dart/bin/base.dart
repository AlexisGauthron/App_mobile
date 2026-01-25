// ============================================================
// EXERCICE 1 : Les bases - Types et Null Safety en Dart
// ============================================================
// Questions du cours :
// 1. Indiquer quelles lignes compilent ou non
// 2. Essayer de corriger, puis indiquer celles qui plantent à l'exécution
// 3. Faire en sorte que l'ensemble du code soit fonctionnel


void main() {
  // COMPILE : OUI | EXÉCUTION : OK (a = null)
  int? a;

  // COMPILE : OUI | EXÉCUTION : OK (b = 5)
  int b = a ?? 5;


  // CODE ORIGINAL DU COURS : int c = a!;
  // COMPILE : OUI | EXÉCUTION : PLANTE ! (a est null, donc erreur)
  //
  // CODE CORRIGÉ : int? c = a;
  // COMPILE : OUI | EXÉCUTION : OK (c = null)
  int? c = a;

  // COMPILE : OUI | EXÉCUTION : OK (affiche "null")
  print(c);


  // COMPILE : OUI | EXÉCUTION : OK (a = 3)
  if (a == null) {
    a = 3;
  }

  // COMPILE : OUI | EXÉCUTION : OK (affiche "false" car 3 est impair)
  print(a.isEven);
}
