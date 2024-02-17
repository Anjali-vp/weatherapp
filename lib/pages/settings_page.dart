import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:provider/provider.dart';
import '../model/setting_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsModel = Provider.of<SettingsModel>(context); // Access the provided data

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("search weather in your country",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green.shade900),),
      ),
      body: Container(
        child: SearchField<String>(
          suggestions: settingsModel.countries
              .map(
                (country) => SearchFieldListItem<String>(
              country,
            ),
          )
              .toList(),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          settingsModel.addCountry('New Country');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
