import 'package:flutter/material.dart';
import 'notification.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

//Search_controller
TextEditingController Search_controller = TextEditingController();

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Basketball'),
          // actions: <Widget>[
          //   //通知功能位置
          //   IconButton(
          //     icon: Icon(Icons.notifications),
          //     onPressed: () {
          //       showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return MyAlertDialog();
          //         },
          //       );
          //     },
          //   ),
          // ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0), //調整資訊方塊與邊界距離
              child: SizedBox(
                  height: 40,
                  //搜尋方框
                  child: TextField(
                    controller: Search_controller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      label: Text("Search"),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15), // <-- SEE HERE
                    ),
                  )),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 3),
                itemBuilder: (BuildContext context, int index) {
                  String local;
                  int distance;
                  int remainingTime;
                  int cost;
                  int numOfPersons;
                  int total;

                  if (index == 0) {
                    local = '成功大學';
                    distance = 10;
                    remainingTime = 30;
                    cost = 20;
                    numOfPersons = 4;
                    total = 10;
                  } else if (index == 1) {
                    local = '成功大學光復校區';
                    distance = 250;
                    remainingTime = 15;
                    cost = 20;
                    numOfPersons = 7;
                    total = 10;
                  } else if (index == 2) {
                    local = '成功大學自強校區';
                    distance = 750;
                    remainingTime = 25;
                    cost = 20;
                    numOfPersons = 3;
                    total = 10;
                  } else {
                    local = '台南體育館';
                    distance = 3700;
                    remainingTime = 45;
                    cost = 100;
                    numOfPersons = 8;
                    total = 10;
                  }

                  return _buildItem(
                    local: local,
                    distance: distance,
                    remainingTime: remainingTime,
                    cost: cost,
                    numOfPersons: numOfPersons,
                    total: total,
                  );
                },
              ),
            ),
          ],
        ));
  }

//定義變數
  Widget _buildItem({
    required String local,
    required int distance,
    required int remainingTime,
    required int cost,
    required int numOfPersons,
    required int total,
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25, right: 25, top: 7.5, bottom: 7.5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), //卡片外觀和度調整
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      local, //活動地點
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '$numOfPersons / $total 人', //參加人數與可參加總人數
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Distance:   $distance m', //距離
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'RemainingTime:  $remainingTime Min', //剩餘時間
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Cost:   $cost  NTD', //費用
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
