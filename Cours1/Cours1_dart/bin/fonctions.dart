

void main(){

  void method(int a, [int ? b, int c = 3]){
    print('a: $a, b: $b, c: $c');
  }
  method(0);
  method(0, 1);
  method(0, null);
  method(0, 1, 4);
  
  }

String foo({required String name, int number = 0, bool toUpperCase = false}) =>
  '${(toUpperCase ? name.toUpperCase() : name)} $number';

void useFoo() {
  print(foo(name: 'a'));
  print(foo(name: 'b', number: 1));
  print(foo(name: 'c', toUpperCase: true));
  print(foo(name: 'd', number: 2, toUpperCase: true));
}