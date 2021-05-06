abstract class HomeState {}
class AppInitialState extends HomeState{}
class ChangeBottomNavState extends HomeState{
  final int index;

  ChangeBottomNavState({this.index});

}
class ChangeBottomSheetState extends HomeState{}
class CreateDataBaseState extends HomeState{}
class GetDataBaseState extends HomeState{}
class InsertDataBaseState extends HomeState{}
class LoadingDataBaseState extends HomeState{}
class UpdateDataBaseState extends HomeState{}
class DeleteDataBaseState extends HomeState{}

