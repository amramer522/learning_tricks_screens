
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_screens/helper/cache_helper.dart';
import 'package:learning_screens/screens/counter/states.dart';

// controller  cubit  bloc
class CounterController extends Cubit<CounterStates> {
  CounterController() : super(CounterInitialState());

  static CounterController getObject(context) {
    return BlocProvider.of(context);
  }


  int count = CacheHelper.readCounter();
  int z = 0;
  Future<void> plus() async{
    if (count < 10) {
      count++;
      await CacheHelper.saveCountNumber(count);
      z++;
    }
    emit(CounterPlusState());
  }

  Future<void> minus() async{
    if (count > 1) {
      count--;
      await CacheHelper.saveCountNumber(count);
      z--;
    }
    emit(CounterMinusState());
  }
}
