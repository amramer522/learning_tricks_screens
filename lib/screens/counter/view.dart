import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_screens/screens/counter/controller.dart';
import 'package:learning_screens/screens/counter/states.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // provider
    return BlocProvider(
      create: (context) => CounterController(),
      child: Builder(builder: (context) {
        final controller = CounterController.getObject(context);
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterController,CounterStates>(
                  builder: (context, state) {
                    return Text(controller.z.toString());
                  },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      controller.plus();
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // consumer   listen
                  BlocBuilder<CounterController, CounterStates>(
                    builder: (context, state) {
                      return Text(
                        controller.count.toString(),
                        style: TextStyle(fontSize: 35),
                      );
                    },
                  ),

                  SizedBox(
                    width: 10,
                  ),
                  // consumer   listen
                  FloatingActionButton(
                    onPressed: () {
                      controller.minus();
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
