void main(){

var dog = Dog();
dog.color = 'Red';
dog.name = 'Bruno';
dog.eat();
print(dog.color);
print(dog.name);


var cat = Cat();
cat.color = 'Brown';
cat.name = 'Mercy';
cat.eat();
print(cat.color);
print(cat.name);

}
// iNHERITANCE  1

// superclass
// class Animal {
// String name;
// String color;

// int legCount;
// String ? sound;
//   Animal({
//     required this.name,
//     required this.legCount,
//     required this.color,
//     this.sound ,
//   });
// }

// create class Cat that extends Animal
// class Cat extends Animal {
//   Cat(
//   String name,
//      int legCount,
//   ) : super(
//     name: name,
//     legCount: legCount,
//     color: 'Black',
//   );
// }
  
//   // create class Dog that extends Animal and add function bark
//   class Dog extends Animal {
//     Dog(
//     String age,
//     int legCount,
//   ) : super(
//     name: age,
//     legCount: legCount,
//     color: 'Brown',
//   );
//   void bark() {
//     print('Woof');
//   }
// }




// superclass
class Animal {
String ? name;
String ?color;

void eat (){
  print('I eat');
}

}

class Cat extends Animal {


}

  class Dog extends Animal {

    
}


