

void main() {
  List<String> greetings = [
    'World',
    'Mars',
    'Oregon',
    'Barry',
    'David Bowie',
  ];
   for (var name in greetings){
     helloDart(name);
   }
}

void helloDart(name) {
  print('Hello $name');

}
