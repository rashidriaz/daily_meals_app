import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      {@required IconData icon,
      @required String titleText,
      @required Function onTapFunction}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        titleText,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2016/05/24/13/29/olive-oil-1412361_1280.jpg",
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                color: Color.fromRGBO(255, 255, 255, 0.5),
              ),
              Positioned(
                bottom: 0,
                right: 20,
                child: Container(
                  width: (MediaQuery.of(context).orientation ==
                          Orientation.portrait)
                      ? MediaQuery.of(context).size.width * 0.7
                      : MediaQuery.of(context).size.width * 0.3,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Daily Meals App",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            icon: Icons.restaurant,
            titleText: "Meals",
            onTapFunction: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          buildListTile(
            icon: Icons.settings,
            titleText: "Filters",
            onTapFunction: () {
              Navigator.of(context).pushReplacementNamed("/filters");
            },
          )
        ],
      ),
    );
  }
}
