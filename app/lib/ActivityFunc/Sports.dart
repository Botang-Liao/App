import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 用於日期格式化

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'SubmitFunc.dart';
import '/HomePage.dart';

class Sports extends StatefulWidget {
  @override
  _SportsState createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  //選擇人數變數
  String? radioValue = '1';
  final nameController = TextEditingController();
  String? timeText;
  //下拉式選單變數選項一
  String? dropdownValue = 'Basketball';
  //Activity Location searching control
  var uuid = new Uuid();
  String? _sessionToken;
  List<dynamic> _placeList = [];
  var Latitude;
  var Longitude;
  //Activity Location listviwer control
  final FocusNode _focusNode = FocusNode();
  bool _isListVisible = false;
  //TextController
  TextEditingController EndInviteTime = TextEditingController();
  TextEditingController StartTime = TextEditingController();
  TextEditingController ActivityName = TextEditingController();
  TextEditingController ActivityLoca = TextEditingController();
  TextEditingController PeopleLimitcontroller = TextEditingController();
  late String PeopleLimit = '';
  TextEditingController LowerEstimatedCost = TextEditingController();
  TextEditingController UpperEstimatedCost = TextEditingController();
  TextEditingController Note = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(
      BuildContext context, TextEditingController EndInviteTime) async {
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
          EndInviteTime.text =
              '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day} ${_selectedTime.format(context)}';
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    ActivityLoca.addListener(() {
      if (ActivityLoca.text.isEmpty) {
        setState(() {
          _isListVisible = false;
        });
      }
    });
    ActivityLoca.addListener(() {
      _onChanged();
    });
    // _focusNode.addListener(_onFocusChanged);
  }

  _onChanged() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(ActivityLoca.text);
  }

  @override
  void dispose() {
    // _focusNode.removeListener(_onFocusChanged);
    ActivityLoca.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    setState(() {
      _isListVisible = _focusNode.hasFocus;
    });
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = "AIzaSyC5iwslr5cnM7LG6pQcMsxqHLLojrfjm-c";
    String type = '(regions)';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      setState(() {
        _placeList = json.decode(response.body)['predictions'];
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  Future<LatLng> getLatLng(String placeId) async {
    String kPLACES_API_KEY = 'AIzaSyC5iwslr5cnM7LG6pQcMsxqHLLojrfjm-c';
    String baseURL = 'https://maps.googleapis.com/maps/api/place/details/json';
    String request = '$baseURL?place_id=$placeId&key=$kPLACES_API_KEY';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      var result = json.decode(response.body)['result'];
      var location = result['geometry']['location'];
      return LatLng(location['lat'], location['lng']);
    } else {
      throw Exception('Failed to load location details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        title: const Text('Sports'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0), //調整介面內容與邊線距離
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "New Activity",
              style:
                  TextStyle(color: Color.fromARGB(255, 10, 1, 0), fontSize: 35),
            ),
            const SizedBox(height: 20),
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
                    'Basketball',
                    'Tennis',
                    "Balling",
                    "Badminton",
                    "Soccer",
                    "Volleyball",
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
                    child: TextFormField(
                      controller: ActivityName,
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
              style:
                  TextStyle(color: Color.fromARGB(255, 10, 1, 0), fontSize: 15),
            ),

            SizedBox(
              width: 18,
            ),

            TextFormField(
              controller: EndInviteTime,
              readOnly: true,
              onTap: () {
                _selectTime(context, EndInviteTime);
              },
              decoration: InputDecoration(
                //labelText: 'Choose Date and Time', //選擇第一個日期與時間
                labelStyle: TextStyle(fontSize: 10),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),

            SizedBox(
              width: 15,
              height: 18,
            ),
            //活動開始時間
            const Text(
              "Activity Start Time",
              style:
                  TextStyle(color: Color.fromARGB(255, 10, 1, 0), fontSize: 15),
            ),
            TextFormField(
              controller: StartTime,
              readOnly: true,
              onTap: () {
                _selectTime(context, StartTime);
              },
              decoration: InputDecoration(
                //labelText: 'Choose Date and Time', //選擇第二個日期與時間
                labelStyle: TextStyle(fontSize: 6),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),

            SizedBox(
              width: 15,
            ),
            const SizedBox(height: 20),

            //活動地點
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Column(
                children: [
                  SizedBox(width: 15, height: 10),
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: ActivityLoca,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        label: Text("Activity Location"),
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _isListVisible = true;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: _isListVisible,
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _placeList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_placeList[index]["description"]),
                          onTap: () async {
                            print(_placeList[index]["description"]);
                            ActivityLoca.text =
                                _placeList[index]["description"];
                            setState(() {
                              _isListVisible = false;
                            });
                            _focusNode.unfocus();

                            var placeId = _placeList[index]['place_id'];
                            var latLng = await getLatLng(placeId);
                            print(
                                'Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}');
                            Latitude = latLng.latitude;
                            Longitude = latLng.longitude;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(height: 15),
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
                  activeColor: Colors.black87,
                  groupValue: radioValue,
                  onChanged: (value) {
                    PeopleLimit = value.toString();
                    setState(() {
                      radioValue = value!;
                    });
                  },
                ),
                Text("1"),
                ////////////////////////////////////////
                Radio<String>(
                  value: "2",
                  activeColor: Colors.black87,
                  groupValue: radioValue,
                  onChanged: (value) {
                    PeopleLimit = value.toString();
                    setState(() {
                      radioValue = value!;
                    });
                  },
                ),
                Text("2"),
                ///////////////////////////////////////
                Radio<String>(
                  value: "3",
                  activeColor: Colors.black87,
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
                    height: 32,
                    child: TextFormField(
                      controller: PeopleLimitcontroller,
                      decoration: InputDecoration(
                        label: Text("Limit"),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15), // <-- SEE HERE
                      ),
                      onChanged: (value) {
                        setState(() {
                          // Assign the value of the TextFormField to the PeopleLimit variable
                          PeopleLimit = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            //預算花費
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 20),
                // SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: LowerEstimatedCost,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money),
                          label: Text("Lower Cost"),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15), // <-- SEE HERE //
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
                      child: TextFormField(
                        controller: UpperEstimatedCost,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money),
                          label: Text("Upper Cost"),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15), // <-- SEE HERE //
                        ),
                      )),
                ),
              ],
            ),
            //備註
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: TextFormField(
                controller: Note,
                decoration: InputDecoration(
                  label: Text("Note"),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15), // <-- SEE HERE //
                ),
              ),
            ),
            //發起按鈕
            Center(
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                  onPressed: () {
                    Submit(
                        context,
                        ActivityName.text.toString(),
                        EndInviteTime.text.toString(),
                        StartTime.text.toString(),
                        ActivityLoca.text.toString(),
                        PeopleLimit.toString(),
                        LowerEstimatedCost.text.toString(),
                        UpperEstimatedCost.text.toString(),
                        Note.text.toString(),
                        Latitude,
                        Longitude);
                    homePageKey.currentState?.addSportMarker(
                        ActivityName.text.toString(),
                        EndInviteTime.text.toString(),
                        StartTime.text.toString(),
                        ActivityLoca.text.toString(),
                        PeopleLimit.toString(),
                        LowerEstimatedCost.text.toString(),
                        UpperEstimatedCost.text.toString(),
                        Note.text.toString(),
                        Latitude,
                        Longitude);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(key: homePageKey),
                      ),
                    );
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
