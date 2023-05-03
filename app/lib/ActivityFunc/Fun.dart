import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 用於日期格式化

class Deck extends StatefulWidget {
  @override
  _DeckState createState() => _DeckState();
}

class _DeckState extends State<Deck> {
  String? radioValue = '1'; //選擇人數變數
  final nameController = TextEditingController();
  String? timeText;
  String? dropdownValue = 'Board Games'; //下拉式選單變數選項一

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(
      BuildContext context, TextEditingController _controller) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
        initialEntryMode: TimePickerEntryMode.input,
      );
      if (time != null) {
        setState(() {
          _selectedDate = date;
          _selectedTime = time;
          _controller.text =
              '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day} ${_selectedTime.format(context)}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FUN'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0), //調整介面內容與邊線距離
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "New Activity",
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 1, 0), fontSize: 35),
              ),
              const SizedBox(height: 25),
              //下拉式選單
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Board Games',
                      'Majiung',
                      "Karaoke",
                      "Sports Game",
                      "Escape Room",
                      "Music festival"
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  //活動名稱
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text("Activity Name"),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15), // <-- SEE HEREHERE
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //發起活動截止時間
              const SizedBox(height: 10),
              const Text(
                "End Invite Time",
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 1, 0), fontSize: 15),
              ),

              SizedBox(
                width: 20,
              ),

              TextFormField(
                controller: _controller,
                readOnly: true,
                onTap: () {
                  _selectTime(context, _controller);
                },
                decoration: InputDecoration(
                  //labelText: 'Choose Date and Time', //選擇第一個日期與時間
                  labelStyle: TextStyle(fontSize: 10),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),

              SizedBox(
                width: 15,
                height: 15,
              ),
              //活動開始時間
              const Text(
                "Activity Start Time",
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 1, 0), fontSize: 15),
              ),
              TextFormField(
                controller: _controller1,
                readOnly: true,
                onTap: () {
                  _selectTime(context, _controller1);
                },
                decoration: InputDecoration(
                  //labelText: 'Choose Date and Time', //選擇第二個日期與時間
                  labelStyle: TextStyle(fontSize: 10),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),

              SizedBox(
                width: 15,
              ),
              const SizedBox(height: 20),

              //活動地點
              SizedBox(width: 15, height: 10),
              Expanded(
                  child: SizedBox(
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    label: Text("Activity Location"),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15), // <-- SEE HERE
                  ),
                ),
              )),

              const SizedBox(height: 20),
              //人數點選
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "People Limit",
                    style: TextStyle(
                        color: Color.fromARGB(255, 8, 1, 0), fontSize: 15),
                  ),
                  Radio<String>(
                    value: "1",
                    groupValue: radioValue,
                    onChanged: (value) {
                      setState(() {
                        radioValue = value!;
                      });
                    },
                  ),
                  Text("1"),
                  Radio<String>(
                    value: "2",
                    groupValue: radioValue,
                    onChanged: (value) {
                      setState(() {
                        radioValue = value!;
                      });
                    },
                  ),
                  Text("2"),
                  Radio<String>(
                    value: "3",
                    groupValue: radioValue,
                    onChanged: (value) {
                      setState(() {
                        radioValue = value!;
                      });
                    },
                  ),
                  //其他人數填入方框
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: SizedBox(
                          height: 30,
                          child: TextField(
                            decoration: InputDecoration(
                              label: Text("People Limit"),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15), // <-- SEE HERE
                            ),
                          ))),
                  //Text("Pl"),
                ],
              ),
              const SizedBox(height: 20),
              //預算花費
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 20),
                  // SizedBox(width: 15),
                  Expanded(
                    child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.attach_money),
                            label: Text("Estimated Cost"),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15), // <-- SEE HERE //
                          ),
                        )),
                  ),
                  SizedBox(width: 15),
                  const Text(
                      style: TextStyle(fontFamily: 'Mononoki', fontSize: 30.0),
                      "~"),
                  SizedBox(width: 15),
                  Expanded(
                    child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.attach_money),
                            label: Text("Estimated Cost"),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15), // <-- SEE HERE //
                          ),
                        )),
                  ),
                ],
              ),
              //備註
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text("Note"),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15), // <-- SEE HERE //
                  ),
                ),
              ),
              //發起按鈕
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.sports_esports_rounded),
                    SizedBox(width: 10),
                    Text(
                      "Submit",
                      textScaleFactor: 1.0,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 4, 158, 235),
                  minimumSize: Size(80, 40),
                  maximumSize: Size(130, 50),
                  textStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
