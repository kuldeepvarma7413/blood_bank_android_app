// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatefulWidget {
  List<String> data;
  SettingsScreen(this.data, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<SettingsScreen> createState() => _SettingsScreenState(data);
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> data;
  _SettingsScreenState(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(fontFamily: 'poorStory', fontSize: 26),
        ),
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        toolbarHeight: 80,
        backgroundColor: const Color.fromRGBO(255, 72, 72, 1),
        shadowColor: Colors.transparent,
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name
                _buildRow("Name", data[0]),
                const SizedBox(height: 20),

                // number
                _buildRow("Number", data[5]),
                const SizedBox(height: 20),

                // date of birth
                _buildRow("Date of Birth", data[1]),
                const SizedBox(height: 20),

                // age
                _buildRow("Age", '${data[2]} yrs'),
                const SizedBox(height: 20),

                // blood group
                _buildRow("Blood Group", data[4]),
                const SizedBox(height: 20),

                // HEALTH CONDITIONS
                const Text(
                  "Health Conditions",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFA4848)),
                ),

                TextFormField(
                  initialValue: data[3],
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 10,
                  style: const TextStyle(fontSize: 18),
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 72, 72, 1),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 50)),
                    child: const Text("Back"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Color(0xffFA4848)),
        ),
        Text(value,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, color: Colors.black87)),
      ],
    );
  }
}
