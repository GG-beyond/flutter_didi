import 'package:flutter/material.dart';

class HomePop extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePopState();
  }
}
class HomePopState extends State<HomePop>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new PopupMenuButton(
      itemBuilder: (BuildContext context){

        return _allPopItems.map((_PopItem item){

          return PopupMenuItem(
            child: ListItem(item.title, item.icon),
            value: '选项内容:${item.title}',
          );
        }).toList();
      },
      onSelected: (String value){print('点击了item=$value');},
    );
  }
}

Widget ListItem(String title,IconData icon){

  return new Container(
    height: 48,
    padding: EdgeInsets.only(left: 0,right: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(left: 10),
          child: new Icon(
            icon,
            size: 20,
          ),
        ),
        new Padding(
            padding: EdgeInsets.only(left: 10),
            child: new Text(
              title,
              style: TextStyle(
                fontSize: 15,
              ),
            )
        )
      ],
    ),
  );
}

class _PopItem{

  final String title;
  final IconData icon;
  _PopItem({this.title,this.icon});
}
final List<_PopItem> _allPopItems = [

  _PopItem(title: '发起群聊',icon: Icons.sms),
  _PopItem(title: '添加朋友',icon: Icons.people),
  _PopItem(title: '扫一扫',icon: Icons.track_changes),
  _PopItem(title: '收付款',icon: Icons.money_off),
];