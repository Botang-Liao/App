//Google Map
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    //     )),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        // on below line we have given title of app
        title: Text("APP"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Rabbit"),
              accountEmail: Text("ilovecarrot@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/rabbit.png'),
              ),
            ),
            ListTile(
              title: Text("User"),
              leading: Icon(Icons.person, color: Theme.of(context).accentColor),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.inbox, color: Theme.of(context).accentColor),
              title: const Text('Inbox'),
              trailing: Text("99+"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.star, color: Theme.of(context).accentColor),
              title: const Text('Starred'),
              trailing: Text("3"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.schedule_send,
                  color: Theme.of(context).accentColor),
              title: const Text('Scheduled'),
              trailing: Text("1"),
              onTap: () {},
            ),
            ListTile(
              title: Text("logout"),
              leading:
                  Icon(Icons.exit_to_app, color: Theme.of(context).accentColor),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: Container(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.my_location),
        backgroundColor: Colors.blue[300],
        onPressed: () async {
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() + " " + value.longitude.toString());

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

            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {});
          });
        },
      ),
    );
  }
}
