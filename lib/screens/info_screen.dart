import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("INFO"),
          backgroundColor: Colors.grey[900],
        ),
      body:  SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("images/hp.jpg"),
            ),
            SizedBox(height:20.0),
            Text(
              'HEMANT PANERU HP',
              style: TextStyle(
                fontFamily: 'LiuJianMaoCao',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontFamily: 'BreeSerif',
                letterSpacing: 2,
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 180.0,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Card(
              //padding: EdgeInsets.all(10.0),
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone_android,
                  color:Colors.blue
                ),
                title: Text(
                    '+977 9868759815',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  )
              )
            ),
            Card(
                //padding: EdgeInsets.all(10.0),
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color:Colors.blue
                  ),
                  title: Text(
                      'hpaneru.hp@gmail.com',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ) ,
                )
              )
          ],
        ),
      ),
    );
  }
}