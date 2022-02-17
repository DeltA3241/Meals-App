import 'package:flutter/cupertino.dart';

class Error extends StatelessWidget {
  static const errorpageroute = '/error';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Error cannot find the page you are looking for") ,
    );
  }
}
