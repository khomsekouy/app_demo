
import 'package:driver_app/features/drop_off/widgets/item_drop_off_widgets.dart';
import 'package:driver_app/features/drop_off/view/drop_off_detail_view.dart';
import 'package:driver_app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../constant/constent.dart';

class AppMaps extends StatefulWidget {
  const AppMaps({super.key,
    this.onPickLocation,
    this.onCameraMoveStarted,
    this.onMapMoveCompleted,
    this.latLng});

  final Function(CameraPosition) ? onPickLocation;
  final Function()? onCameraMoveStarted;
  final Function(String)? onMapMoveCompleted;
  final LatLng? latLng;
  @override
  State<AppMaps> createState() => _AppMapsState();
}

class _AppMapsState extends State<AppMaps> {
  late BitmapDescriptor pinLocationIcon = BitmapDescriptor.defaultMarker;
  late GoogleMapController mapController;
  LocationData? currentLocation;
  late CameraPosition _position;
  List<LatLng> polylineCoordinates = [];
  final Set<Marker> _markers = {};
  double lat = 11.562108;
  double lng = 104.888535;
  String city = "";
  String add = "";


  Future<void> setCustomProfile() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/profile_null.png',
    );
  }

  Future<void> getCurrentLocation() async {
   final location = Location();
    await location.getLocation().then((LocationData currentLocation) {
      setState(() {
        lat = currentLocation.latitude!;
        lng = currentLocation.longitude!;
      });
    });
  }
  Future<void> getPolyPoint() async {
    final polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapApiKey,
      PointLatLng(kPhnompenhLatlng.target.latitude,
          kPhnompenhLatlng.target.longitude),
      PointLatLng(kPhnompenhLatlng.target.latitude,
          kPhnompenhLatlng.target.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng pointLatLng)
      => polylineCoordinates.add(
        LatLng(pointLatLng.latitude, pointLatLng.longitude),
      ),
      );
      setState(() {});
    }
  }
  @override
  void initState() {
    super.initState();
    getPolyPoint();
    getCurrentLocation();
    setCustomProfile();
    if (widget.latLng != null) {
      _position = CameraPosition(target: widget.latLng!, zoom: 18);
    } else {
      _position = kPhnompenhLatlng;
    }
    // setCustomMapPin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
            initialCameraPosition: _position,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            onCameraMoveStarted: () {
              if (widget.onCameraMoveStarted != null) {
                widget.onCameraMoveStarted!();
              }
            },
            onCameraMove: (CameraPosition position) {
              if (widget.onPickLocation != null) {
                widget.onPickLocation!(position);
              }
            },
            onCameraIdle: () {
              if (widget.onMapMoveCompleted != null) {
                widget.onMapMoveCompleted!(city);
              }
            },
            polylines: {
              Polyline(
                polylineId: PolylineId('polyline'),
                color: Colors.red,
                points: polylineCoordinates,
              ),
            },
            markers: {
              Marker(
                onTap: () {
                  _showBottomSheet(context);
                },
                markerId: MarkerId('source'),
                position: kPhnompenhLatlng.target,
                icon: pinLocationIcon,
                onDragEnd: (LatLng position) {
                  print(position);
                  setState(() {
                    _position = CameraPosition(target: position, zoom: 14);
                  });
                },
              ),
              // Marker(
              //   markerId: MarkerId('destination'),
              //   position:  kPhnompenhLatlng.target,
              //   icon: pinLocationIcon,
              //   draggable: true,
              //   onDragEnd: (LatLng position) {
              //     print(position);
              //     setState(() {
              //       _position = CameraPosition(target: position, zoom: 16);
              //     });
              //   },
              // ),
            },
          ),
    );
  }
  //show bottom sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.kBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Container(
              width: 40,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.kColorBlack.withOpacity(.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 16),
              child: ItemDropOffWidgets(
                name: 'Sokha',
                image: 'assets/images/profile_null.png',
                phone: '069 997 502',
                item: '10',
                code: '#123456',
                deliveryAddress: 'St. 271, Phnom Penh',
                dropOffLocation: 'St. 271, Phnom Penh',
                onReport: (){},
                onDirection: () {},
                onDropOff: () {
                  context.push(DropOffDetailView.routePath);
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
