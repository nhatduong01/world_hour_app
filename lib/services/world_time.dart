import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class GioTheGioi
{
  String diadiem; // The location name for the UI
  String thoigian; // The time of that location
  String co; // url to an asset flag icon
  String url; // location url for API endpoint
  bool NgayDem; // true of false if daytime or not
  GioTheGioi({this.diadiem,this.co,this.url});
  Future<void> getTime() async
  {
    try
    {
      //Make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // Get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // Get the time properties
      thoigian = DateFormat.jm().format(now);
      NgayDem = (now.hour>6&&now.hour<18) ? true : false;
    }
    catch(e)
    {
      print('Caught Error : $e');
      thoigian = 'Could not get time data';
    }

  }
}
