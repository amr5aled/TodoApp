abstract class AgeStates{}
class intialStateAge extends AgeStates{}
class PlusStateAge extends AgeStates{
  final int age;

  PlusStateAge(this.age);
}
class MinusStateAge extends AgeStates{
  final int age;

  MinusStateAge(this.age);
}
