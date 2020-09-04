import 'package:flutter/material.dart';
import 'package:please_work/models/brew.dart';
import 'package:provider/provider.dart';

import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    return ListView.builder(
      itemCount: brews == null ? 0 : brews.length,
      itemBuilder: (context, index) => BrewTile(
        brew: brews[index],
      ),
    );
  }
}
