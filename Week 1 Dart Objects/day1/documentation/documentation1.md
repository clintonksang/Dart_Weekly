// Documentation



**dart.academy/creating-objects-and-classes-in-dart-and-flutter**

#Object-Oriented Programming

defines an object as “any entity that has a defined boundary.” An object has the following −

##State − Describes the object. The fields of a class represent the object’s state.

##Behavior − Describes what an object can do.

There are two steps in creating an object. 
First, we define a class. A class is a template for an object. It is a blueprint which describes the state and behavior that the objects of the class all share. A class can be used to create many objects. Objects created at runtime from a class are called instances of that particular class. A new instance is created with the new keyword; since Dart 2.0, the keyword is optional.



Identity − A unique value that distinguishes an object from a set of similar other objects. Two or more objects can share the state and behavior but not the identity.

The period operator (.) is used in conjunction with the object to access a class’ data members.


```
class Student { 
   void test_method() { 
      print("This is a  test method"); 
   } 
   
   void test_method1() { 
      print("This is a  test method1"); 
   } 
}  
void main()    { 
   Student s1 = new Student(); 
   s1.test_method(); 
   s1.test_method1(); 
}
```

#Output 
`This is a test method 
This is a test method1`
