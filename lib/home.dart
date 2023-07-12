import 'package:blood_bank/findDonors.dart';
import 'package:flutter/material.dart';
import 'Navbar.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Navbar(),
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
                      "Hello Kuldeep",
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
                                    left: 15,
                                    top: 45,
                                    child: Text(
                                      "A+",
                                      style: TextStyle(
                                          fontSize: 60,
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
                                builder: (context) => findDonors()));
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
                      onPressed: () {},
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
