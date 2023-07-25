import 'package:blood_bank/findDonors.dart';
import 'package:blood_bank/requests.dart';
import 'package:flutter/material.dart';
import 'Navbar.dart';

// ignore: camel_case_types, must_be_immutable
class home extends StatefulWidget {
  List<String> data;
  String? number;
  home(this.data, this.number, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<home> createState() => _homeState(data, number);
}

// ignore: camel_case_types
class _homeState extends State<home> {
  List<String> data;
  String name = "";
  String? number;
  String bloodGroup = "";

  _homeState(this.data, this.number);
  @override
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
        drawer: Navbar(data, number),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 72, 72, 1),
          elevation: 0,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 280,
                  color: const Color.fromRGBO(255, 72, 72, 1),
                ),
                Column(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Hello $name",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'poorStory',
                        fontSize: 24),
                  ),
                  const SizedBox(
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
                            const Text(
                              "Your Blood Group",
                              style: TextStyle(
                                  fontFamily: 'poorStory', fontSize: 22),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                const Image(
                                    image: AssetImage('images/drop.png')),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      bloodGroup,
                                      style: const TextStyle(
                                        fontSize: 45,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
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
                            const Text(
                              "Donor Status",
                              style: TextStyle(
                                  fontFamily: 'poorStory', fontSize: 22),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Image.asset('images/check.png'),
                            const SizedBox(
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
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => findDonors(data)));
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(255, 72, 72, 1)),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.fromLTRB(110, 20, 110, 20))),
                    child: const Text(
                      "Find Donors",
                      style: TextStyle(
                        fontFamily: 'poorStory',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () async {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => requests(number)));
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(255, 72, 72, 1)),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.fromLTRB(105, 20, 105, 20))),
                    child: const Text(
                      "Donate Blood",
                      style: TextStyle(
                        fontFamily: 'poorStory',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ))
              ],
            )
          ],
        )),
      ),
    );
  }
}
