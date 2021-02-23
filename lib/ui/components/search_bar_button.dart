import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(5.0),
                onTap: () {
                  print("Clicked");
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Row(children: [
                    Icon(
                      Icons.search,
                      size: 25.0,
                    ),
                    Expanded(
                        child: Text(
                      "Search Here...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w300),
                    ))
                  ]),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.settings,
                  size: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
