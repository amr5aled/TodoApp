
import 'package:flutter/material.dart';
import 'package:testapp/models/users/usermodel.dart';


class Jobs extends StatelessWidget {
  List<Model>_user=[
    Model(Id: 1, name: 'Amr khaled', phone: '01277856368'),
    Model(Id: 2, name: 'Mayada khaled', phone: '01277856368'),
    Model(Id: 3, name: 'Amr khaled', phone: '01277856368'),
    Model(Id: 4, name: 'Hamo khaled', phone: '01277856368'),
    Model(Id: 5, name: 'Amr khaled', phone: '01277856368'),
    Model(Id: 6, name: 'Mayada khaled', phone: '01277856368'),
    Model(Id: 7, name: 'Amr khaled', phone: '01277856368'),
    Model(Id: 8, name: 'Hamo khaled', phone: '01277856368'),
    Model(Id: 9, name: 'Amr khaled', phone: '01277856368'),
    Model(Id: 10, name: 'Mayada khaled', phone: '01277856368'),
    Model(Id: 11, name: 'Amr khaled', phone: '01277856368'),
    Model(Id: 12, name: 'Hamo khaled', phone: '01277856368'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        centerTitle: true,

      ),
      body: ListView.separated(
        itemCount: _user.length,
        itemBuilder: (context,index)=>buildList(_user[index]),
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Divider(),
        ),

      ),
    );
  }

  Widget buildList(Model user) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            child: Text('${user.Id}'),

          ),
          SizedBox(
            width: 12.0,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${user.name}',style: TextStyle(fontSize: 20),),
              SizedBox(
                height: 8.0,
              ),
              Text('${user.phone}')

            ],
          )
        ],
      ),
    );


  }
}
