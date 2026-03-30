import 'package:flutter/material.dart';
import 'package:whatsapp/screens/calls_screen.dart';
import 'package:whatsapp/screens/chats_screen.dart';
import 'package:whatsapp/screens/comunities_screen.dart';
import 'package:whatsapp/screens/updates_screen.dart';
import 'package:whatsapp/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: AppColors.backgroundColor,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.backgroundColor,
          indicatorColor: AppColors.teaGreen,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: AppColors.backgroundColor,
          backgroundColor: AppColors.green,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController(initialPage: 0);
  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar

      // Body / Content
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            selectedScreen = value;
          });
        },
        children: [
          ChatsScreen(),
          UpdatesScreen(),
          ComunitiesScreen(),
          CallsScreen(),
        ],
      ),

      // Floating Action button

      // BottomNavigationBar
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedScreen,
        onDestinationSelected: (value) {
          setState(() {
            selectedScreen = value;
          });
          pageController.jumpToPage(value);
        },

        destinations: [
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(Icons.chat, color: AppColors.tealGreenDark),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.update),
            selectedIcon: Icon(Icons.update, color: AppColors.tealGreenDark),
            label: 'Updates',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_alt_outlined),
            selectedIcon: Icon(
              Icons.people_alt,
              color: AppColors.tealGreenDark,
            ),
            label: 'Comunities',
          ),
          NavigationDestination(
            icon: Icon(Icons.call_outlined),
            selectedIcon: Icon(Icons.call, color: AppColors.tealGreenDark),
            label: 'Calls',
          ),
        ],
      ),
    );
  }
}
