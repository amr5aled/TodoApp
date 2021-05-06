import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import 'package:testapp/modules/bmicalculate/Calcluate.dart';

import 'Bloc/ageCubit.dart';
import 'Bloc/ageStates.dart';

class BmiCalculate extends StatelessWidget {
  bool isMal = true;
  double height = 120;
  int weight = 120;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AgeCubit(),
      child: BlocConsumer<AgeCubit,AgeStates>(
        listener: (context,state){
          if(state is PlusStateAge) print(state.age);
          if(state is MinusStateAge) print(state.age);

        },
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('BmiCalculator'),
            ),
            body: Column(
              children: [
                Expanded(
                    child: Container(
                      color: Colors.black45,
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: isMal ? Colors.blue : Colors.grey[300]),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.ac_unit,
                                          size: 40,
                                        ),
                                        Text(
                                          'Male',
                                          style: TextStyle(fontSize: 25),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: isMal ? Colors.grey[300] : Colors.blue),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.ac_unit,
                                          size: 40,
                                        ),
                                        Text(
                                          'Female',
                                          style: TextStyle(fontSize: 25),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    )),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          color: Colors.grey[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Height',
                                style: TextStyle(fontSize: 25.0),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    '${height.round()}',
                                    style: TextStyle(fontSize: 25.0),
                                  ),
                                  Text('CM')
                                ],
                              ),
                              Slider(
                                value: height,
                                min: 100,
                                max: 300,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    child: Container(
                      color: Colors.black45,
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Weight',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        '$weight',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            FloatingActionButton(
                                              child: Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                              heroTag: 'W--',
                                              onPressed: () {},
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            FloatingActionButton(
                                              child: Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                              heroTag: 'W++',
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Age',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                      ' ${ AgeCubit.get(context).age}',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            FloatingActionButton(
                                              child: Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                              heroTag: 'age--',
                                              onPressed: () {
                                                 AgeCubit.get(context).minus();
                                              },
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            FloatingActionButton(
                                              child: Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                              heroTag: 'age++',
                                              onPressed: () {
                                                AgeCubit.get(context).plus();
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    )),
                Container(
                    width: double.infinity,
                    height: 50.0,
                    child: MaterialButton(
                      onPressed: () {
                        double Result = weight / pow(height / 100, 2);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Calculate(
                                  ismal: isMal,
                                  result: Result,
                                  height: height,
                                )));
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.blue,
                    ))
              ],
            ),
          );
        },




      ),
    );
  }
}
