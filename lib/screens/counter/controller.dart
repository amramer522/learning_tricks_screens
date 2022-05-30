
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_screens/screens/counter/states.dart';

// controller  cubit  bloc
class CounterController extends Cubit<CounterStates> {
  CounterController() : super(CounterInitialState());

  static CounterController getObject(context) {
    return BlocProvider.of(context);
  }


  int count = 1;
  int z = 0;
  void plus() {
    if (count < 10) {
      count++;
      z++;
    }
    emit(CounterPlusState());
  }

  void minus() {
    if (count > 1) {
      count--;
      z--;
    }
    emit(CounterMinusState());
  }
}
