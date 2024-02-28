import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 0:
        Navigator.pushNamed(context, '/projects');
        break;
      case 1:
        Navigator.pushNamed(context, '/about me');
        break;
      case 2:
        Navigator.pushNamed(context, '/contact');
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/eddieanime2.jpg',
                  height: 500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'React Developer',
                    textStyle: const TextStyle(
                      color: Color.fromRGBO(48, 255, 55, 1),
                      fontSize: 20,
                    ),
                  ),
                  TypewriterAnimatedText(
                    'Mobile App Developer',
                    textStyle: const TextStyle(
                      color: Color.fromRGBO(48, 255, 55, 1),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Passionate about crafting seamless user experiences through'
                'React development, React Native and Flutter.',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.work,
                color: Colors.white,
              ),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: 'About Me',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              label: 'Contact',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
