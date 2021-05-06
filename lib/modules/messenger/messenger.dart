import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 8.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Text('Amr'),
          ),
        ),
        title: Text(
          'Chats',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
        actions: <Widget>[
          CircleAvatar(
            child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                ),
                color: Colors.black,
                iconSize: 20,
                onPressed: () {}),
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(
            width: 5.0,
          ),
          CircleAvatar(
            child: IconButton(
                icon: Icon(Icons.edit), color: Colors.black, onPressed: () {}),
            radius: 18.0,
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 38.0,
                padding:  const EdgeInsetsDirectional.only(start: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 18,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                    itemBuilder: (context, index) => buildStory(),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10.0,
                        ),
                    itemCount: 10),
              ),
              ListView.separated(
                  itemBuilder: (context, index) => buildChat(),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.0,
                      ),
                  itemCount: 15),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildStory() {
  return Container(
    width: 60.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300],
            ),
            CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.grey[300],
            ),
            CircleAvatar(
              radius: 8.0,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Text(
            'Mayada Khaled Mohamed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

Widget buildChat() {
  return Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
          ),
          CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.grey[300],
          ),
          CircleAvatar(
            radius: 8.0,
          )
        ],
      ),
      SizedBox(
        width: 10.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mohamed khaled'),
          Row(
            children: [
              Text('Missed Call'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  width: 7.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text('12:50 Pm'),
            ],
          )
        ],
      )
    ],
  );
}
