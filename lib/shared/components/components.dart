import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:testapp/shared/BlocHome/HomeCubit.dart';

Widget defaultTextForm(
    {TextEditingController edit,
    String label,
    IconData icon,
    double radius = 10,
    Function functionValidator,
    TextInputType textInputType,
    Function onTap}) {
  return TextFormField(
    controller: edit,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
    ),
    validator: functionValidator,
    keyboardType: textInputType,
    onFieldSubmitted: (value) {
      print('value is :value');
    },
    onTap: onTap,
  );
}

Widget defaultbuildtask(Map model, BuildContext context) {
  return Dismissible(
    key: Key('${model['id'].toString()}'),
    background: Container(
      color: Colors.red,
    ),
    direction: DismissDirection.startToEnd,
    onDismissed: (direction) => CubitHome.get(context).delete(id: model['id']),
    child: ListTile(
      leading: CircleAvatar(
        radius: 40.0,
        child: Text(
          '${model['time']}',
          maxLines: 2,
          style: TextStyle(fontSize: 12.0),
        ),
      ),
      title: Text('${model['title']}'),
      subtitle: Text('${model['date']}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.check_box),
            color: Colors.green,
            onPressed: () {
              CubitHome.get(context).updateDb(status: 'done', id: model['id']);
            },
          ),
          IconButton(
            icon: Icon(Icons.archive),
            color: Colors.grey[500],
            onPressed: () {
              CubitHome.get(context)
                  .updateDb(status: 'archive', id: model['id']);
            },
          ),
        ],
      ),
    ),
  );

}
Widget BuildList({@required List<Map>tasks})
{
  return ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (BuildContext context) {
        return ListView.separated(
            itemBuilder: (context, index) =>
                defaultbuildtask(tasks[index], context),
            separatorBuilder: (context, index) => Divider(
              thickness: 2.0,
            ),
            itemCount: tasks.length);
      },
      fallback: (context) {
        return Center(
          child: Text(
            'No Task yet please add some tasks',
            style: TextStyle(fontSize: 20.0, color: Colors.blue),
          ),
        );
      });
}
