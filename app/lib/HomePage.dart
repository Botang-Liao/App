import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/drawerpage.dart';
import 'Userinfo.dart';
import 'LoginPage.dart';
import 'PickActPage.dart';
import 'LogoutAuth.dart';
import 'ActivityFunc/SubmitFunc.dart';
import 'notification.dart';
import 'Score/scorepage.dart';

class HomePage extends StatefulWidget {
  final String cookies;
  // final bool showAlertDialog;

  const HomePage({Key? key, required this.cookies}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

GlobalKey<_HomePageState> homePageKey = GlobalKey<_HomePageState>();

class _HomePageState extends State<HomePage> {
  final Set<Marker> _markers = {};

  late Future<User> futureUser;

  String mapStyle = '';

  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    addCurIcon();
    addFunIcon();
    addSportIcon();
    addFoodIcon();
    futureUser = fetchUser(widget.cookies);
    super.initState();
    DefaultAssetBundle.of(context)
        .loadString('assets/mapstyle.txt')
        .then((string) {
      mapStyle = string;
    }).catchError((error) {
      print("error" + error.toString());
    });
  }

  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(22.997098289781654, 120.21682909418733),
    zoom: 13,
  );

  // on below line we have created the list of markers
  // final List<Marker> _markers = <Marker>[
  //   // Marker(
  //   //     markerId: MarkerId('1'),
  //   //     position: LatLng(22.997098289781654, 120.21682909418733),
  //   //     infoWindow: InfoWindow(
  //   //       title: 'My Position',
  //   //     )
  //   // ),
  // ];

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  // add marker from activity
  void addFunMarker(ActName, EndInviteTime, StartTime, ActLoca, PeopleLimit,
      LowerEstCost, UpperEstCost, Note, latitude, longitude) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(ActName),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: ActName),
        icon: Fun_markerIcon,
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: 800.0,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$ActName",
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "  Distance:  100 m",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      // const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            // Action when TextButton is pressed
                            showOrganizerScore(context);
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Organizer: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "呂亞縉",
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(height: 15),
                      Text(
                        "  Remaining time:  25 min",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Fee:  NTD $LowerEstCost ~ NTD $UpperEstCost",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Address:  $ActLoca",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Remaining:  30 min to start activities",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Note:  $Note",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        alignment: Alignment.center,
                        child: OutlinedButton.icon(
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(color: Colors.black54),
                            ),
                          ),
                          label: Text('Join'),
                          icon: const Icon(Icons.add, size: 18),
                          onPressed: () {
                            Navigator.pop(
                                context); // Close the modal bottom sheet
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Have Fun !',
                                        textAlign: TextAlign.center),
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ));
    });
  }

  void addSportMarker(ActName, EndInviteTime, StartTime, ActLoca, PeopleLimit,
      LowerEstCost, UpperEstCost, Note, latitude, longitude) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(ActName),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: ActName),
        icon: Sport_markerIcon,
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: 800.0,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$ActName",
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "  Distance:  100 m",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      // const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            // Action when TextButton is pressed
                            showOrganizerScore(context);
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Organizer: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "呂亞縉",
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(height: 15),
                      Text(
                        "  Remaining time:  25 min",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Fee:  NTD $LowerEstCost ~ NTD $UpperEstCost",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Address:  $ActLoca",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Remaining:  30 min to start activities",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Note:  $Note",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        alignment: Alignment.center,
                        child: OutlinedButton.icon(
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(color: Colors.black54),
                            ),
                          ),
                          label: Text('Join'),
                          icon: const Icon(Icons.add, size: 18),
                          onPressed: () {
                            Navigator.pop(
                                context); // Close the modal bottom sheet
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Have Fun !',
                                        textAlign: TextAlign.center),
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ));
    });
  }

  void addFoodMarker(ActName, EndInviteTime, StartTime, ActLoca, PeopleLimit,
      LowerEstCost, UpperEstCost, Note, latitude, longitude) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(ActName),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: ActName),
        icon: Food_markerIcon,
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: 800.0,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$ActName",
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "  Distance:  100 m",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      // const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            // Action when TextButton is pressed
                            showOrganizerScore(context);
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Organizer: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "呂亞縉",
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(height: 15),
                      Text(
                        "  Remaining time:  25 min",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Fee:  NTD $LowerEstCost ~ NTD $UpperEstCost",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Address:  $ActLoca",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Remaining:  30 min to start activities",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "  Note:  $Note",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        alignment: Alignment.center,
                        child: OutlinedButton.icon(
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(color: Colors.black54),
                            ),
                          ),
                          label: Text('Join'),
                          icon: const Icon(Icons.add, size: 18),
                          onPressed: () {
                            Navigator.pop(
                                context); // Close the modal bottom sheet
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Have Fun !',
                                        textAlign: TextAlign.center),
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ));
    });
  }

  //change marker icon
  BitmapDescriptor cur_markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor Fun_markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor Sport_markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor Food_markerIcon = BitmapDescriptor.defaultMarker;

  void addCurIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/cur.png")
        .then(
      (icon) {
        setState(() {
          cur_markerIcon = icon;
        });
      },
    );
  }

  void addFunIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/Fun.png")
        .then(
      (icon) {
        setState(() {
          Fun_markerIcon = icon;
        });
      },
    );
  }

  void addSportIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/Sport.png")
        .then(
      (icon) {
        setState(() {
          Sport_markerIcon = icon;
        });
      },
    );
  }

  void addFoodIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/Food.png")
        .then(
      (icon) {
        setState(() {
          Food_markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String name;
    String email;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // icon on app bar
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_rounded),
            color: Colors.black87,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MyAlertDialog();
                },
              );
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.refresh_rounded),
          //   color: Colors.black87,
          //   onPressed: () {},
          // ),
        ],
      ),
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        key: GlobalKey(),
        child: ListView(
          padding: EdgeInsets.only(),
          children: [
            // 之後從後端拿資料
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: FutureBuilder<User>(
                future: futureUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.black87,
                      ),
                      padding: EdgeInsets.all(0),
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CircleAvatar(
                              radius: 42,
                              backgroundImage:
                                  AssetImage('assets/images/ya.jpg'),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              snapshot.data!.username,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              snapshot.data!.email,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // accountName: Text(snapshot.data!.username,
                      //     style: TextStyle(fontSize: 20)),
                      // accountEmail: Text(snapshot.data!.email,
                      //     style: TextStyle(fontSize: 18)),
                      // currentAccountPicture: CircleAvatar(
                      //   backgroundImage: AssetImage('assets/images/ya.jpg'),
                      // ),
                      // currentAccountPictureSize: Size.fromRadius(35),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
              // accountName: Text("呂亞縉"),
              // accountEmail: Text("UU@gmail.com"),
              // currentAccountPicture: CircleAvatar(
              //   backgroundImage: AssetImage('assets/images/ya.jpg'),
              // ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: 8.0, right: 8.0, bottom: 3.0), //調整資訊方塊與邊界距離
              child: SizedBox(
                  height: 40,
                  //搜尋方框
                  child: TextField(
                    controller: Search_controller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mic_rounded),
                      ),
                      label: Text("Search"),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15), // <-- SEE HERE
                    ),
                  )),
            ),

            ListTile(
              title: Text("User"),
              leading: Icon(Icons.person, color: Theme.of(context).accentColor),
              onTap: () {},
            ),

            ExpansionTile(
              title: Text('Fun'),
              leading: Icon(Icons.sports_esports_rounded,
                  color: Theme.of(context).accentColor),
              children: <Widget>[
                ListTile(title: Text('Board Games')),
                ListTile(title: Text('Majiung')),
                ListTile(title: Text('Karaoke')),
                ListTile(title: Text('Sport Game')),
                ListTile(title: Text('Escape Room')),
                ListTile(title: Text('Music Festival')),
              ],
            ),

            ExpansionTile(
              title: Text('Sports'),
              leading: Icon(Icons.sports_rounded,
                  color: Theme.of(context).accentColor),
              children: <Widget>[
                ListTile(
                  title: Text('Basketball'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DrawerPage()));
                  },
                ),
                ListTile(title: Text('Tennis')),
                ListTile(title: Text('Balling')),
                ListTile(title: Text('Badminton')),
                ListTile(title: Text('Soccer')),
                ListTile(title: Text('Volleyball')),
              ],
            ),

            ExpansionTile(
              title: Text('Food'),
              leading: Icon(Icons.fastfood_rounded,
                  color: Theme.of(context).accentColor),
              children: <Widget>[
                ListTile(title: Text('Spare Food')),
                ListTile(title: Text('Looking for a Friend')),
                ListTile(title: Text('Group Buying')),
              ],
            ),

            Expanded(
              child: Align(
                alignment: FractionalOffset(0.5, 1.0),
                child: ListTile(
                  title: Text("logout"),
                  leading: Icon(Icons.exit_to_app,
                      color: Theme.of(context).accentColor),
                  onTap: () {
                    Logout();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        key: GlobalKey(),
        children: [
          Container(
            child: SafeArea(
              // on below line creating google maps
              child: GoogleMap(
                // on below line setting camera position
                initialCameraPosition: _kGoogle,
                // on below line we are setting markers on the map
                markers: Set<Marker>.of(_markers),
                // on below line specifying map type.
                mapType: MapType.normal,
                // on below line setting user location enabled.
                myLocationEnabled: true,
                // on below line setting compass enabled.
                compassEnabled: true,
                // on below line specifying controller on map complete.
                onMapCreated: (GoogleMapController controller) {
                  controller.setMapStyle(mapStyle);
                  _controller.complete(controller);
                },
              ),
            ),
          ),

          // on pressing floating action button the camera will take to user current location
          // FloatingActionButtonLocation.centerFloat,
          Align(
            alignment: Alignment(0.96, 0.65),
            child: FloatingActionButton.small(
              heroTag: 'my_location',
              child: Icon(
                Icons.my_location_rounded,
                color: Colors.white,
              ),
              backgroundColor: Colors.black87,
              onPressed: () async {
                getUserCurrentLocation().then((value) async {
                  print(value.latitude.toString() +
                      " " +
                      value.longitude.toString());

                  // marker added for current users location
                  _markers.add(Marker(
                    markerId: MarkerId("Current Location"),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: InfoWindow(
                      title: 'Current Location',
                    ),
                    icon: cur_markerIcon, // add custom icon style
                  ));

                  // specified current users location
                  CameraPosition cameraPosition = new CameraPosition(
                    target: LatLng(value.latitude, value.longitude),
                    zoom: 16,
                  );

                  final GoogleMapController controller =
                      await _controller.future;
                  controller.animateCamera(
                      CameraUpdate.newCameraPosition(cameraPosition));
                  setState(() {});
                });
              },
            ),
          ),

          Align(
            alignment: Alignment(0.96, 0.5),
            child: FloatingActionButton.small(
              heroTag: 'add_act',
              child: Icon(
                Icons.add_rounded,
                color: Colors.white,
              ),
              backgroundColor: Colors.black87,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PickActPage(
                              cookies: widget.cookies,
                            )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
