import 'package:flutter/material.dart';
import 'package:world_hour_app/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<GioTheGioi> nhungdiadiem = [ //Declare the locations in the world
    GioTheGioi(url: 'Europe/London', diadiem: 'London', co: 'uk.png'),
    GioTheGioi(url: 'Europe/Athens', diadiem: 'Athens', co: 'greece.png'),
    GioTheGioi(url: 'Africa/Cairo', diadiem: 'Cairo', co: 'egypt.png'),
    GioTheGioi(url: 'Africa/Nairobi', diadiem: 'Nairobi', co: 'kenya.png'),
    GioTheGioi(url: 'America/Chicago', diadiem: 'Chicago', co: 'usa.png'),
    GioTheGioi(url: 'America/New_York', diadiem: 'New York', co: 'usa.png'),
    GioTheGioi(url: 'Asia/Seoul', diadiem: 'Seoul', co: 'south_korea.png'),
    GioTheGioi(url: 'Asia/Jakarta', diadiem: 'Jakarta', co: 'indonesia.png'),
    GioTheGioi(url:'Asia/Ho_Chi_Minh',diadiem: 'Ho Chi Minh',co: 'vietnam.png'),
    GioTheGioi(url:'Europe/Paris',diadiem: 'Paris',co:'france.png'),
    GioTheGioi(url:'Asia/Tokyo',diadiem:'Tokyo',co:'japan.png'),
    GioTheGioi(url:'Asia/Shanghai',diadiem: 'Shanghai',co: 'china.png'),
    GioTheGioi(url: 'Asia/Pyongyang',diadiem: 'Pyongyang',co: 'north_korea.png')
  ];
  void CapnhatThoigian(index) async // This function will update the time
  {
    GioTheGioi temp = nhungdiadiem[index];
    await temp.getTime();
    //Navigate to the home screen
    Navigator.pop(context,{
      'diadiem':temp.diadiem,'thoigian':temp.thoigian,'Co':temp.co,'ngaydem':temp.NgayDem
    });
  }
  @override
  Widget build(BuildContext context) {
   print('Build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Choose the location'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0.0,
      ),
      body:ListView.builder(
        itemCount: nhungdiadiem.length,
        itemBuilder: (context,index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  CapnhatThoigian(index);
                },
                title: Text(
                  nhungdiadiem[index].diadiem,
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${nhungdiadiem[index].co}'),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
