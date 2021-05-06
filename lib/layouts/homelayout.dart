import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:testapp/shared/BlocHome/HomeCubit.dart';
import 'package:testapp/shared/BlocHome/HomeState.dart';
import 'package:testapp/shared/components/components.dart';

class MyHomeLayout extends StatelessWidget {
  final keyScaffold = GlobalKey<ScaffoldState>();
  final keyForm = GlobalKey<FormState>();

  TextEditingController titlecontroll = TextEditingController();
  TextEditingController datacontroll = TextEditingController();
  TextEditingController timecontroll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CubitHome()..createdatabase(),
        child: BlocConsumer<CubitHome, HomeState>(
          listener: (context, HomeState state) {
            if (state is ChangeBottomNavState) print('index:${state.index}');
            if (state is InsertDataBaseState) {
              Navigator.pop(context);
            }
          },
          builder: (context, HomeState state) {
            CubitHome cubit = CubitHome.get(context);
            return Scaffold(
              key: keyScaffold,
              appBar: AppBar(
                title: Text(cubit.menu[cubit.currentindex]),
                centerTitle: true,
              ),
              body: ConditionalBuilder(
                condition:state is ! LoadingDataBaseState,
                builder: (context) => cubit.modules[cubit.currentindex],
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                heroTag: 'plus',
                child: Icon(cubit.icon),
                onPressed: () {
                  if (cubit.isbottomsheet) {
                    if (keyForm.currentState.validate()) {
                      cubit
                          .insertToDatabase(
                              title: titlecontroll.text,
                              time: timecontroll.text,
                              date: datacontroll.text)
                          .then((value) {
                            titlecontroll.clear();
                            timecontroll.clear();
                            datacontroll.clear();

                      }).catchError((error) {
                        print('error is ${error.toString()}');
                      });
                      cubit.changeBottomSheet(false, Icons.edit);
                    }
                  } else {
                    keyScaffold.currentState
                        .showBottomSheet((context) {
                          return Container(
                            width: double.infinity,
                            height: 200.0,
                            color: Colors.grey[300],
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Form(
                                  key: keyForm,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        defaultTextForm(
                                            edit: titlecontroll,
                                            label: 'title task',
                                            icon: Icons.title,
                                            functionValidator: (value) {
                                              if (value.isEmpty) {
                                                return 'please enter title ';
                                              }
                                              return null;
                                            },
                                            textInputType: TextInputType.text),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        defaultTextForm(
                                          edit: timecontroll,
                                          label: 'time task',
                                          icon: Icons.watch_later_outlined,
                                          functionValidator: (value) {
                                            if (value.isEmpty) {
                                              return 'please enter time ';
                                            }
                                            return null;
                                          },
                                          textInputType: TextInputType.datetime,
                                          onTap: () {
                                            showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now())
                                                .then((value) {
                                              timecontroll.text = value
                                                  .format(context)
                                                  .toString();
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        defaultTextForm(
                                          edit: datacontroll,
                                          label: 'date task',
                                          icon: Icons.calendar_today_rounded,
                                          functionValidator: (value) {
                                            if (value.isEmpty) {
                                              return 'please enter date';
                                            }
                                            return null;
                                          },
                                          textInputType: TextInputType.datetime,
                                          onTap: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:
                                                  DateTime.parse('2021-06-12'),
                                            ).then((value) {
                                              datacontroll.text =
                                                  DateFormat.yMMMd()
                                                      .format(value);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        })
                        .closed
                        .then((value) {
                          cubit.changeBottomSheet(false, Icons.edit);
                        });
                    cubit.changeBottomSheet(true, Icons.add);
                  }
                },
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentindex,
                elevation: 30,
                iconSize: 20,
                onTap: (index) {
                  cubit.ChangeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu), label: 'tasks'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.done), label: 'Done'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive), label: 'archive'),
                ],
              ),
            );
          },
        ));
  }
}
