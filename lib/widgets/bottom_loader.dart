import 'package:flutter/material.dart';

class BottomCircleIndicator extends StatelessWidget {
  const BottomCircleIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SizedBox(
          width: 30,
          height: 30,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
