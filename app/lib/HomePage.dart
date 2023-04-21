//Google Map
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/LoginPage.dart';
import 'Userinfo.dart';
import 'LoginPage.dart';
import 'ActivityPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(22.997098289781654, 120.21682909418733),
    zoom: 13,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    // Marker(
    //     markerId: MarkerId('1'),
    //     position: LatLng(22.997098289781654, 120.21682909418733),
    //     infoWindow: InfoWindow(
    //       title: 'My Position',
    //     )
    // ),
  ];

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

  @override
  Widget build(BuildContext context) {
    String name;
    String email;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        // on below line we have given title of app
        title: Text("APP"),
        // icon on app bar
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_rounded),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(),
          children: <Widget>[
            // 之後從後端拿資料
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: FutureBuilder<User>(
                future: futureUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.username);
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
              //   backgroundImage: AssetImage('images/ya.jpg'),
              // ),
            ),

            ListTile(
              title: Text("User"),
              leading: Icon(Icons.person, color: Theme.of(context).accentColor),
              onTap: () {},
            ),

            ExpansionTile(
              title: Text('娛樂'),
              leading: Icon(Icons.sports_esports_rounded,
                  color: Theme.of(context).accentColor),
              children: <Widget>[
                ListTile(title: Text('桌遊')),
                ListTile(title: Text('麻將')),
                ListTile(title: Text('KTV')),
                ListTile(title: Text('看球賽')),
                ListTile(title: Text('音樂祭')),
                ListTile(title: Text('密室逃脫')),
              ],
            ),

            ExpansionTile(
              title: Text('運動'),
              leading: Icon(Icons.sports_rounded,
                  color: Theme.of(context).accentColor),
              children: <Widget>[
                ListTile(title: Text('籃球')),
                ListTile(title: Text('排球')),
                ListTile(title: Text('羽球')),
                ListTile(title: Text('網球')),
                ListTile(title: Text('足球')),
                ListTile(title: Text('撞球')),
                ListTile(title: Text('保齡球')),
              ],
            ),

            ExpansionTile(
              title: Text('飲食'),
              leading: Icon(Icons.fastfood_rounded,
                  color: Theme.of(context).accentColor),
              children: <Widget>[
                ListTile(title: Text('覺得寂寞')),
                ListTile(title: Text('團購食材')),
                ListTile(title: Text('校內剩餘便當')),
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
              child: Icon(
                Icons.my_location_rounded,
                color: Colors.black45,
              ),
              backgroundColor: Colors.white,
              onPressed: () async {
                getUserCurrentLocation().then((value) async {
                  print(value.latitude.toString() +
                      " " +
                      value.longitude.toString());

                  // marker added for current users location
                  _markers.add(Marker(
                    markerId: MarkerId("1"),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: InfoWindow(
                      title: 'Current Location',
                    ),
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
            alignment: Alignment(0, 0.9),
            child: FloatingActionButton(
              child: Icon(Icons.add_rounded),
              backgroundColor: Colors.blue[300],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Activity()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
