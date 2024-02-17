import 'package:flutter/material.dart';
import 'package:weatherapp/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> data = [
  {"title": "Location", "subtitle": "india,kerala", "icon": Icons.location_on_outlined},
    {"title": "Temperature", "subtitle": "37 degree celcius", "icon": Icons.thermostat_outlined},
    {"title": "Weather Condition", "subtitle": "sunny", "icon": Icons.thunderstorm_outlined},
  ];


  void _onItemTapped(int index) {
    if (index == 1) {
      _refreshData();
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  void _refreshData() {
    setState(() {
      print('Refreshing data...');
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Weather"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return ListTile(
                      leading: Icon(item["icon"]),
                      title: Text(item["title"]),
                      subtitle: Text(item["subtitle"]),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8.0),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.refresh),
              label: 'Refresh',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
