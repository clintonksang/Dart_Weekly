void main(){
Cat cat = Cat('Mimi', 4) ;

print(cat.color);

}
// iNHERITANCE

// superclass
class Animal {
String name;
String color;
int legCount;
  Animal({
    required this.name,
    required this.legCount,
    required this.color,
  });
}

// create class Cat that extends Animal
class Cat extends Animal {
  Cat(
  String name,
     int legCount,
  ) : super(
    name: name,
    legCount: legCount,
    color: 'Black',
  );
}