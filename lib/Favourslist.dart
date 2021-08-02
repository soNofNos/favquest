import 'package:flutter/material.dart';
import 'package:favquest/FavourCardItem.dart';

class FavoursList extends StatelessWidget {
  final String title;
  final List <Favours> favours;

  const FavoursList({Key key, this.title, this.favours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          child: Text(title),
          padding: EdgeInsets.only(top: 16.0),
        ),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: favours.length,
            itemBuilder: (BuildContext context, int index){
              final favour = favours[index];
              return FavourCardItem(favour: favour);
            }
        ),
        ),
      ],
    );
  }
}
