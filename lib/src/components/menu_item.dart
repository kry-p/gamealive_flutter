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
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  description!= null ? Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ): Container(),
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