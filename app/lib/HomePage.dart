import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/drawerpage.dart';
import 'Userinfo.dart';
import 'LoginPage.dart';
import 'PickActPage.dart';
import 'LogoutAuth.dart';
import 'ActivityFunc/SubmitFunc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
    futureUser = fetchUser();
    super.initState();
    DefaultAssetBundle.of(context).loadString('mapstyle.txt').then((string) {
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
                  height: 600.0,
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
                        "Distance: xxx m",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Organizer: 呂亞縉",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Remaining time: xxx min",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Fee: NTD $LowerEstCost ~ NTD $UpperEstCost",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Address: $ActLoca",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Remaining: xxx min to start activities",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Note: $Note",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 25),
                      OutlinedButton.icon(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(color: Colors.black54),
                          ),
                        ),
                        label: Text('Join'),
                        icon: const Icon(Icons.add, size: 18),
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                  height: 600.0,
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
                        "Distance: xxx m",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Organizer: 呂亞縉",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Remaining time: xxx min",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Fee: NTD $LowerEstCost ~ NTD $UpperEstCost",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Address: $ActLoca",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Remaining: xxx min to start activities",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Note: $Note",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 25),
                      OutlinedButton.icon(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(color: Colors.black54),
                          ),
                        ),
                        label: Text('Join'),
                        icon: const Icon(Icons.add, size: 18),
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                  height: 600.0,
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
                        "Distance: xxx m",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Organizer: 呂亞縉",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Remaining time: xxx min",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Fee: NTD $LowerEstCost ~ NTD $UpperEstCost",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Address: $ActLoca",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Remaining: xxx min to start activities",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Note: $Note",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(height: 25),
                      OutlinedButton.icon(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(color: Colors.black54),
                          ),
                        ),
                        label: Text('Join'),
                        icon: const Icon(Icons.add, size: 18),
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
            const ImageConfiguration(), "images/cur.png")
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
            const ImageConfiguration(), "images/Fun.png")
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
            const ImageConfiguration(), "images/Sport.png")
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
            const ImageConfiguration(), "images/Food.png")
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        // on below line we have given title of app
        // title: Text("APP"),
        // icon on app bar
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_rounded),
            color: Colors.black87,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            color: Colors.black87,
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(),
          children: <Widget>[
            // 之後從後端拿資料
            UserAccountsDrawerHeader(
              // padding: EdgeInsets.all(0),
              // child: FutureBuilder<User>(
              //   future: futureUser,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Text(snapshot.data!.username);
              //     } else if (snapshot.hasError) {
              //       return Text('${snapshot.error}');
              //     }

              //     // By default, show a loading spinner.
              //     return const CircularProgressIndicator();
              //   },
              // ),
              accountName: Text("呂亞縉"),
              accountEmail: Text("UU@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/ya.jpg'),
              ),
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
              child: Icon(
                Icons.add_rounded,
                color: Colors.white,
              ),
              backgroundColor: Colors.black87,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PickActPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
