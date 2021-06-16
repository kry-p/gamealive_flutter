import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {

  final String title, description;
  final Function onTap;

  MenuItem({
    this.title,
    this.description,
    this.onTap}) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(title),
                  description != null ? Text(description) : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
