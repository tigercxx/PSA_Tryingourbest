import 'package:flutter/material.dart';

class AETOSPage extends StatelessWidget {
  const AETOSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(children: [
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFFAF6ED),
            child: Stack(children: [
              Positioned(
                left: 330,
                top: 10,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.logout_outlined,
                      size: 40,
                    )),
              ),
              Center(
                  child: Text(
                "DigiPON",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
            ]),
          ),
        ]),
      ),
    );
  }
}
