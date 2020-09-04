import 'package:flutter/material.dart';
import 'package:please_work/models/brew.dart';
import 'package:please_work/services/authentication_service.dart';
import 'package:please_work/services/database_service.dart';
import 'package:please_work/shared/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  static final String routeName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
          actions: [
            IconButton(
              icon: Icon(Icons.low_priority),
              onPressed: () async {
                await _authService.signOut();
              },
            ),
            FlatButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    elevation: 16.0,
                    enableDrag: true,
                    isDismissible: true,
                    //barrierColor: Colors.transparent,

                    context: context,
                    builder: (context) => Container(
                      //height:
                      // padding: EdgeInsets.symmetric(horizontal: 10),
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: kShadowColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.settings),
                label: Text('Settongs'))
          ],
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: BrewList(),
          ),
        ),
      ),
    );
  }
}

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) => BrewTile(
        brew: brews[index],
      ),
    );
  }
}

class BrewTile extends StatelessWidget {
  final Brew brew;
  const BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugars'),
        ),
      ),
    );
  }
}
