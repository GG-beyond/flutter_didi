import 'package:flutter/material.dart';
import 'package:flutter_didi/jr_order/jr_orderPage.dart';


class UserInfoDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Stack(
      alignment: const Alignment(0.3, 0.9),
      children: <Widget>[
        MyTableView(),
        Padding(padding: EdgeInsets.only(top: 400),child: UserGridView(),),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text('法律条款与计价规则>',textAlign: TextAlign.center,),
        ),
    ],
    );
  }
}

class MyTableView extends StatefulWidget{

  MyTableView({Key key}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyTableViewState();
  }
}
class MyTableViewState extends State<MyTableView>{

  
  static Widget _listHeader() {
    
    return new UserAccountsDrawerHeader(
      accountName: Text('张三'),
      accountEmail: Text('123456789@163.com'),
      currentAccountPicture: new CircleAvatar(

        backgroundImage: AssetImage('images/head.jpg'),

      ),
      onDetailsPressed: null,
    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListView.builder(
      itemBuilder:(context,index){

        if (index ==0){
          return _listHeader();
        }else{
          return ListItem(_allPages[index-1].title, _allPages[index-1].icon,context);
          }
        },
      itemCount: _allPages.length+1,
      padding: EdgeInsets.only(),

    );
  }
}

class UserGridView extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserGridViewState();
  }
}
class UserGridViewState extends State<UserGridView>{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      physics: new NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(),
        itemCount: 15,
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context int index){
          return Image.network(
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533536841326&di=682e2e7c3810ac92be325e62e173c0ea&imgtype=0&src=http%3A%2F%2Fs6.sinaimg.cn%2Fmw690%2F006LDoUHzy7auXEaYER25%26690',
          fit: BoxFit.cover,
          width: 80,
          height: 80,
          );
        },
    );
  }
}

Widget ListItem(String title,IconData icon,BuildContext context){

  return new InkWell(
      onTap: (){
        pushRouter(context);
      },
      child: new Container(
        height: 60,
        color: Colors.white10,
        padding: EdgeInsets.only(left: 0,right: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(left: 30),
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
            ),
          ],
        ),
      )
  )
  ;
}
void pushRouter(BuildContext context){
  
  Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (BuildContext context){
            return OrderPage();
          },
      )
  );
}
class _Page{

  final String title;
  final IconData icon;
  _Page({this.icon,this.title});
}

final List<_Page> _allPages= [

  _Page(title: '订单',icon: Icons.book),
  _Page(title: '安全',icon: Icons.add_alert),
  _Page(title: '钱包',icon: Icons.attach_money),
  _Page(title: '客服',icon: Icons.phone),
  _Page(title: '设置',icon: Icons.settings),
];
