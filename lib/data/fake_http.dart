import 'package:flutter/services.dart' as rB;
import 'package:property_turkey_app/models/propety.dart';

class FakeHttp {
  Future<Property> getProperty() async{
    String response = await rB.rootBundle.loadString("assets\\demo_product\\fake_json.json");
     var property = Property.fromJson(response.toString());
     return property;
  }
}