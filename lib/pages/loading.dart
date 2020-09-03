import 'package:flutter/material.dart';
import 'package:world_hour_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime () async
  {
    GioTheGioi Vidu = GioTheGioi(diadiem: 'Paris',co:'france.png',url:'Europe/Paris');
     await Vidu.getTime();
     Navigator.pushReplacementNamed(context, '/home',arguments:{
       'diadiem':Vidu.diadiem,'thoigian':Vidu.thoigian,'Co':Vidu.co,'ngaydem':Vidu.NgayDem
     } );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child:
         SpinKitRotatingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
