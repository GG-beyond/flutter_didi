import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class OrderPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
      
      appBar: AppBar(
        title: Text('我的订单'),
        centerTitle: true,
      ),
      body: Container(
        child: OrderList(),
      ),
    );
  }
}
class OrderList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderListState();
  }
}
class OrderListState extends State<OrderList>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();//请求网络
  }
  loadData() async{

    String dataURL = 'https://common.diditaxi.com.cn/passenger/history?_t=1542263631&appVersion=5.2.26&app_time=1542263632&appversion=5.2.26&biz_type=1&channel=102&clientType=1&daijia_pid=99257012&daijia_switch=1&daijia_token=DwsL5yUVJX7JCkUZTJH/MFjq2O806Tn7zM%2BVVz5ZXOpUjr2uwyAMRt/lmxkCOPc6eZkKgdVEglDxM1RR370omerleDjy8Yne94AVULgWw8byH2kaM9OsUHIUrFrBPW8maVsOFeuJmgY02f/FWCJWqLkXP7Tpo%2BCLuCaPtif5lbzEOIqaedLGLDzbEfebOw6J9yfBNdfer%2BvQNwAA//8%3D&datatype=101&imei=0742b1ffa6cb9b5126c602d2d0b5b57b&imsi=1212123&lang=zh-CN&lat=39.98730360243056&lng=116.5043435329861&location_cityid=1&location_country=CN&maptype=soso&mobileType=iPhone%206&model=iPhone&networkType=WIFI&origin_id=1&os=11.2.5&osType=1&osVersion=11.2.5&pagenum=0&platform_type=1&sig=f044049daaadf1ddca12a14795101d39737ebc96&sort_special=1&start_utc_offset=480&terminal_id=1&timestamp=1542263631550&token=DwsL5yUVJX7JCkUZTJH/MFjq2O806Tn7zM%2BVVz5ZXOpUjr2uwyAMRt/lmxkCOPc6eZkKgdVEglDxM1RR370omerleDjy8Yne94AVULgWw8byH2kaM9OsUHIUrFrBPW8maVsOFeuJmgY02f/FWCJWqLkXP7Tpo%2BCLuCaPtif5lbzEOIqaedLGLDzbEfebOw6J9yfBNdfer%2BvQNwAA//8%3D&trip_cityid=1&trip_country=CN&uid=282386414444545&userRole=1&ut=1542263632&utc_offset=480';

    
    http.Response response = await http.get(dataURL);

    setState(() {

      Map maap = json.decode(response.body);
      final List arr = maap['order_done'];

      _allOrders.clear();
      for (int i = 0;i<arr.length;i++) {
        Map tempMap = arr[i];
        _allOrders.add(OrderModel(
          product_name: tempMap['product_name'],
          hisstatus: tempMap['hisstatus'],
          fromAddress: tempMap['fromAddress'],
          toAddress: tempMap['toAddress'],
          setuptime: tempMap['setuptime'],
        ));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new ListView.builder(
      itemBuilder: (BuildContext context,int index){

        OrderModel model = _allOrders[index];
        return OrderItem(
          product_name: model.product_name,
          hisstatus: model.hisstatus,
          fromAddress: model.fromAddress,
          toAddress: model.toAddress,
          setuptime: model.setuptime,
          context: context,
        );
      },
      itemCount: _allOrders.length,
    );
  }
}
Widget OrderItem({String product_name,String hisstatus,String fromAddress,String toAddress,String setuptime,BuildContext context}){


  return new InkWell(
    onTap: (){
      print('点击了cell');
      showDialog(
          context: context,
          builder:(_){

            return new AlertDialog(
              title: Text('警告！'),
              content: new Text("这里是详细信息内容"),
                actions:<Widget>[
                  new FlatButton(child:new Text("CANCEL"), onPressed: (){
//                    Navigator.of(context).pop();

                  },),
                  new FlatButton(child:new Text("OK"), onPressed: (){
//                    Navigator.of(context).pop();

                  },)
                ]
            );
          }
      );
      },
    child: Padding(
      padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 5),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(padding: EdgeInsets.only(left: 5,top: 5),
              child: new Row(
                children: <Widget>[
                  new Text(product_name,style: TextStyle(fontWeight: FontWeight.bold)),
                  new Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(right: 10),child: Text(hisstatus+' >'),),
                      ],
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
            new Padding(padding: EdgeInsets.only(left: 5,top: 10),
              child: Text(fromAddress,),
            ),
            new Padding(padding: EdgeInsets.only(left: 5,top: 10),
              child: Text(toAddress,),
            ),
            new Padding(padding: EdgeInsets.only(left: 5,top: 10,bottom: 10),
              child: Text(setuptime,),
            ),
          ],
        ),
      ),
    ),
  );

}



var _allOrders = [];

class OrderModel {

  final String product_name;//产品名字
  final String hisstatus;//订单状态
  final String fromAddress;//出发地址
  final String toAddress;//终点
  final String setuptime;//出发时间

  OrderModel({this.product_name,this.hisstatus,this.fromAddress,this.toAddress,this.setuptime});

}