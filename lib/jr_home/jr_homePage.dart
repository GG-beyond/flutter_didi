import 'package:flutter/material.dart';
import 'package:flutter_didi/jr_userInfoPage/jr_userInfoPage.dart';
import 'jr_homePop.dart';

class HomePage extends StatelessWidget{

  final title;
  HomePage({Key key,this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: HomePageBar(title: title),
    );
  }
}


class HomePageBar extends StatefulWidget{

  final title;
  HomePageBar({Key key,this.title});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageBarState();
  }
}
TabController _tabController;

class _HomePageBarState extends State<HomePageBar> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: _allTrafficType.length, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(

        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[

          IconButton(
              icon: Icon(Icons.mail),
              onPressed: null,
          ),
          HomePop(),
        ],
        bottom: new TabBar(

          indicatorColor:Colors.blue,
          labelColor: Colors.white,
          controller: _tabController,
          isScrollable: true,
          tabs:_allTrafficType.map((_Mode mode){

            return new Tab(
              text: mode.title,
              icon: Icon(mode.icon),
            );
          }).toList(),
        ),
      ),
      drawer: Drawer(
        child: UserInfoDrawer(),
      ),
      body: MyTabbarView(),
    );
  }

}

//创建tabbar
class MyTabbarView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyTabbarViewState();
  }
}
class _MyTabbarViewState extends State<MyTabbarView> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new TabBarView(
      children: _allTrafficType.map((_Mode mode){
        return Container(
          child: Card(
            child: Center(
              child: new Icon(
                mode.icon,
                size: 128,
                color: Theme.of(context).accentColor,
              ),
            ),
          )
        );
      }).toList(),
      controller: _tabController,
    );
  }
}

_Mode selectChoise(int index){
  
  return _allTrafficType[index];
  
}
class _Mode{

  final String title;
  final IconData icon;
  _Mode({this.title,this.icon});
}

final List<_Mode> _allTrafficType= [

  _Mode(title: '快车',icon: Icons.directions_car),
  _Mode(title: '出租车',icon: Icons.local_taxi),
  _Mode(title: '拼车',icon: Icons.directions_car),
  _Mode(title: '顺风车',icon: Icons.directions_boat),
  _Mode(title: '单车',icon: Icons.directions_bike),
  _Mode(title: '公交',icon: Icons.directions_bus),
  _Mode(title: '礼橙专车',icon: Icons.directions_railway),
  _Mode(title: '豪华车',icon: Icons.directions_subway),
  _Mode(title: '二手车',icon: Icons.directions_car),
  _Mode(title: '代驾',icon: Icons.directions_transit),
];
