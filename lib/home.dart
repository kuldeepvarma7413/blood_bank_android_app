import 'package:blood_bank/findDonors.dart';
import 'package:blood_bank/requests.dart';
import 'package:flutter/material.dart';
import 'Navbar.dart';
import 'database/db_fun.dart';

class home extends StatefulWidget {
  List<String> data;
  home(this.data);

  @override
  State<home> createState() => _homeState(data);
}

class _homeState extends State<home> {
  List<String> data;
  String name = "";
  String bloodGroup = "";

  _homeState(this.data);
  void initState() {
    name = data[0];
    bloodGroup = data[4];
    //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Navbar(data),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 72, 72, 1),
          elevation: 0,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 280,
                  color: Color.fromRGBO(255, 72, 72, 1),
                ),
                Container(
                  child: Column(children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Hello $name",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poorStory',
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 230,
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Your Blood Group",
                                style: TextStyle(
                                    fontFamily: 'poorStory', fontSize: 22),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Stack(
                                children: [
                                  Image(image: AssetImage('images/drop.png')),
                                  Positioned(
                                    left: 20,
                                    top: 50,
                                    child: Text(
                                      bloodGroup,
                                      style: TextStyle(
                                          fontSize: 45,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // 2nd container
                        Container(
                          height: 230,
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Donor Status",
                                style: TextStyle(
                                    fontFamily: 'poorStory', fontSize: 22),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Image.asset('images/check.png'),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "You can Donate!",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 120,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => findDonors(data)));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(255, 72, 72, 1)),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(110, 20, 110, 20))),
                      child: Text(
                        "Find Donors",
                        style: TextStyle(
                          fontFamily: 'poorStory',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => requests(data)));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(255, 72, 72, 1)),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(105, 20, 105, 20))),
                      child: Text(
                        "Donate Blood",
                        style: TextStyle(
                          fontFamily: 'poorStory',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
