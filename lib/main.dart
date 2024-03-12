import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    // Определяет яркость темы
    primaryColor: Colors.blue,
    // Основной цвет для виджетов
    hintColor: Colors.blueAccent,
    // Дополнительный цвет для выделения элементов
    scaffoldBackgroundColor: Colors.white,
    // Цвет фона экрана
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue, // Цвет фона AppBar
      titleTextStyle:
          TextStyle(color: Colors.white), // Стиль текста заголовка AppBar
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black), // Стиль текста для заголовков
      bodyMedium:
          TextStyle(color: Colors.black), // Стиль текста для основного контента
    ),
  );

  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    // Определяет яркость темы
    primaryColor: Colors.deepPurple,
    // Основной цвет для виджетов
    hintColor: Colors.deepPurpleAccent,
    // Дополнительный цвет для выделения элементов
    scaffoldBackgroundColor: Colors.grey[900],
    // Цвет фона экрана
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple, // Цвет фона AppBar
      titleTextStyle:
          TextStyle(color: Colors.white), // Стиль текста заголовка AppBar
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white), // Стиль текста для заголовков
      bodyMedium:
          TextStyle(color: Colors.white), // Стиль текста для основного контента
    ),
  );
  bool _toggleValue = false;

  void _switchToggle(bool val) {
    setState(() {
      _toggleValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Обо мне',
      theme: _toggleValue ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: _toggleValue
              ? _darkTheme.appBarTheme.backgroundColor
              : _lightTheme.appBarTheme.backgroundColor,
          title: Text(
            'About me',
            style: _toggleValue
                ? _darkTheme.appBarTheme.titleTextStyle
                : _lightTheme.appBarTheme.titleTextStyle,
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
                        backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/24869242?v=4'),
                      ),
                      Text(
                        'Anastasia Kisilenko (iktaniyalol)',
                        style: _toggleValue
                            ? _darkTheme.textTheme.bodyMedium
                            : _lightTheme.textTheme.bodyMedium,
                      ),
                      Text(
                        'Java developer',
                        style: _toggleValue
                            ? _darkTheme.textTheme.bodyMedium
                            : _lightTheme.textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: 20,
                        width: 150,
                        child: Divider(
                          color: _toggleValue
                              ? _darkTheme.hintColor
                              : _lightTheme.hintColor,
                        ),
                      ),
                    ]),
              Column(
                children: [
                      Text('GitHub',
                          style: _toggleValue
                              ? _darkTheme.textTheme.bodyMedium
                              : _lightTheme.textTheme.bodyMedium),
                      InkWell(
                          child: const Icon(Icons.link),
                          onTap: () => launch('https://github.com/Iktaniyalol')),
                    ],
                  ),
            Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Смена темы',
                        style: _toggleValue
                            ? _darkTheme.textTheme.bodyMedium
                            : _lightTheme.textTheme.bodyMedium),
                    Switch(
                      value: _toggleValue,
                      activeColor: _darkTheme.primaryColor,
                      onChanged: _switchToggle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
