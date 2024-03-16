import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatelessWidget {
  final bool toggleValue;
  final Function(bool) switchToggle;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const MyHomePage({
    Key? key,
    required this.toggleValue,
    required this.switchToggle,
    required this.lightTheme,
    required this.darkTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: toggleValue ? darkTheme.appBarTheme.backgroundColor : lightTheme.appBarTheme.backgroundColor,
        title: Text(
          'About Me',
          style: toggleValue ? darkTheme.appBarTheme.titleTextStyle : lightTheme.appBarTheme.titleTextStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/24869242.jpeg"),
                ),
                Text(
                  'Anastasia Kisilenko (iktaniyalol)',
                  style: toggleValue ? darkTheme.textTheme.bodyText1 : lightTheme.textTheme.bodyText1,
                ),
                Text(
                  'Java developer',
                  style: toggleValue ? darkTheme.textTheme.bodyText2 : lightTheme.textTheme.bodyText2,
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: toggleValue ? darkTheme.hintColor : lightTheme.hintColor,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'GitHub',
                  style: toggleValue ? darkTheme.textTheme.bodyText1 : lightTheme.textTheme.bodyText1,
                ),
                InkWell(
                  child: const Icon(Icons.link),
                  onTap: () => launch('https://github.com/Iktaniyalol'),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Theme Switch',
                    style: toggleValue ? darkTheme.textTheme.bodyText1 : lightTheme.textTheme.bodyText1,
                  ),
                  Switch(
                    value: toggleValue,
                    activeColor: darkTheme.primaryColor,
                    onChanged: switchToggle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
