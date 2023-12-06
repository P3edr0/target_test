import 'package:flutter/material.dart';
import 'package:target_test/utils/constants.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Container(
            height: MediaQuery.sizeOf(context).height - 24,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ProjectColors().darkBlue,
                    ProjectColors().navyBlue,
                    ProjectColors().blue,
                  ]),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(children: []),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
