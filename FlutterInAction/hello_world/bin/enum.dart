enum Status{
  none,
  initial,
  done
}

enum Color{
  red,
  green,
  blue
}

void findColor(Color color){

  switch (color) {
    case Color.red:
      print('itsRed');  
      break;
    
      case Color.blue:
      print('itsblue');
      break;
      
      case Color.green:
      print('itsgreen');
      break;

  default :
  print('No Color');
  
  }
}
void main (){

  Status.values.forEach((element) {print(element);});


// Pass in args
  findColor(Color.red);
}