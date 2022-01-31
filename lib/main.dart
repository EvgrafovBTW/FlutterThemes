// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:get/get.dart';
import 'themes.dart';


import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'App',
  home: App(),
  routes: {
    'app': (context) => App(),
    'auth': (context) => Authorization(),
  },
));

class App extends StatelessWidget {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.system);

 App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (_, mode, __) {
        return MaterialApp(
           theme: Style.themeData,
          darkTheme: ThemeData.dark(),
          themeMode: mode, // Decides which theme to show, light or dark.
          home: Scaffold(
            body: Center(
              child: Row(
                children: [
                  ElevatedButton(
                  onPressed: () => _notifier.value = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
                  child: Text('Toggle Theme'),
                  ),
                  TextButton(
                    child: Text('auth'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "auth");
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Authorization extends StatelessWidget{
  const Authorization({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context){

    ElevatedButton _btn = ElevatedButton(onPressed: () { Navigator.pushReplacementNamed(context, 'app');  }, child: Text('на главную'));

    Widget auth = Container(
      padding: const EdgeInsets.only(top: 350, left: 32, right: 32),
      
    );


    return GetMaterialApp(
      theme: Themes.light,
      //darkTheme: Themes.dark,
      home: Center(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            Themes.bebra,
            auth,
            _btn,
          ],
        ),
        
      ),
    );
  }
}

class Style extends StatelessWidget{

 static ThemeData themeData = ThemeData(colorScheme:
              ColorScheme( 
                primary: Color(0xFF992C2C), // основной
                primaryVariant: Color(0xFF6e2020), //более тёмный основной
                onPrimary: Color(0xFFFFFFF0), //текст на основной

                secondary: Colors.amber,  // второй цвет
                secondaryVariant: Colors.amber, // более тёмный второй цвет
                onSecondary: Colors.amber, // текст на втором цвете

                surface: Color(0xFF992C2C), // основной в тёмной теме
                onSurface: Color(0xFFFFFFF0), // текст на основном в тёмной теме

                background: Colors.pink, // бэкграунд за листаемыми объектами
                onBackground: Colors.pink, // текст на бэкграунде

                error: Colors.red, // цвет фона на ошибках пользователя
                onError: Colors.red, // текст на ошибке

                brightness: Brightness.light // тема приложения (тёмная\светлая), 
              )
           );

  const Style({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    throw UnimplementedError();
  }
}