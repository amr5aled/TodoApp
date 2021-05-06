import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/modules/bmi/Bloc/ageStates.dart';

class AgeCubit extends Cubit<AgeStates>
{
  int age=10;
  AgeCubit() : super(intialStateAge());
  // instance of Bloc//
   static AgeCubit get(BuildContext context)=>BlocProvider.of(context);
void plus()
{
  age++;
  emit(PlusStateAge(age));

}
  void minus()
  {
age--;
emit(MinusStateAge(age));
  }


}
