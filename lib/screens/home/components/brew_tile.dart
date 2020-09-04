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
            backgroundImage: NetworkImage(
              'https://img.icons8.com/bubbles/50/000000/kawaii-coffee.png',
              //scale: 0.2,
            ),
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugars'),
        ),
      ),
    );
  }
}
