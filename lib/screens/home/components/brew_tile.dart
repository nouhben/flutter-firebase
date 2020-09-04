import 'package:flutter/material.dart';
import 'package:please_work/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  const BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        elevation: 16.0,
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(brew.image, scale: 0.5),
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugars'),
        ),
      ),
    );
  }
}
