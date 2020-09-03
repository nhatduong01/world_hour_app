import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map dulieu ={} ;//Use to store the data
  @override
  Widget build(BuildContext context) {
    dulieu = dulieu.isNotEmpty? dulieu : ModalRoute.of(context).settings.arguments;
    print(dulieu);
    //Set the background
    String bgImage = dulieu['ngaydem'] ? 'day.png' :'night.png';
    Color bgColor = dulieu['ngaydem'] ? Colors.blue[100] : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
      children: <Widget>[
        FlatButton.icon(
              onPressed: () async {
                 dynamic temp1 = await Navigator.pushNamed(context, '/location');
                 // I put this as an asynchronous function too, I do not know
                 // what type it will return to I let it dynamic
                 // This is stateful widget so I must use the set state function
                setState(() {
                  dulieu = {
                    'diadiem':temp1['diadiem'],'thoigian':temp1['thoigian'],'Co':temp1['Co'],'ngaydem':temp1['ngaydem']
                  };
                });
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit Location'),
              color: Colors.amber,
        ),
        SizedBox(height: 20.0,),
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  dulieu['diadiem'],
                  style:
                  TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.grey[300]
                  ),
                )
              ],
        ),
        SizedBox(height: 20.0,),
        Text(
            dulieu['thoigian'],
            style:
            TextStyle(
              fontSize: 66.0,
              letterSpacing: 2.0,
              color: Colors.grey[300]
            ),
        )
      ],
      ),
            ),
          )
      ),
    );
  }
}
