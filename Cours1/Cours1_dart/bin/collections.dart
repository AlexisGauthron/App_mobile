void main(){

  final list1 = [1, 2, 3];
  final list2 = [...list1];

  list2.add(4);
  // Le résultat est [1, 2, 3, 4] car les deux variables sont liées au même objet en mémoire.


  print(list1);
  print(list2);
  

  
  List<int> list = [25,42,79,12];

  list.sort((int a, int b) {
    return b.compareTo(a);
  });

  print(list);

  List<int> doubled = list.map((int el) => el * 2).toList();
  print(doubled);

  List<int> evens = list.where((n) => n.isEven).toList();
  print(evens);
}