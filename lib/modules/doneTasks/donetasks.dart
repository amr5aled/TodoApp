import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/shared/BlocHome/HomeCubit.dart';
import 'package:testapp/shared/BlocHome/HomeState.dart';
import 'package:testapp/shared/components/components.dart';

class DoneTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitHome, HomeState>(
        listener: (context, HomeState state) {
          if (state is ChangeBottomNavState) print('index:${state.index}');
        }, builder: (context, HomeState state) {
      var tasks = CubitHome.get(context).donetasks;
      return BuildList(
          tasks: tasks
      );
    });
  }

}