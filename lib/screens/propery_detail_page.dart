import 'package:flutter/material.dart';
import 'package:property_turkey_app/models/propety.dart';
class PropertyDetailPage extends StatelessWidget {
  Property _property;
  PropertyDetailPage(this._property);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Property Details"),
      ),
      body: Text(_property.tittle),
    );
  }
}
