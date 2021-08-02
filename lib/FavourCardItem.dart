import 'package:flutter/material.dart';
// import 'package:favquest/main.dart';
// import 'package:favquest/RequestFavourPage.dart';
// import 'package:favquest/FavoursPage.dart';
import 'package:intl/intl.dart';

class FavourCardItem extends StatelessWidget {
  final Favour Favour;

  const FavourCardItem({Key key, this.favour}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(favour.uuid),
      margin: EdgeInsets.symmetric(vertical: 10.0,
          horizontal: 25.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _itemHeader(favour),
            Text(favour.description),
            _itemFooter(favour),
          ],
        ),
      ),
    );
  }
  Widget _itemFooter(Favour favour) {
    if (favour.isCompleted){
      final format = DateFormat();
      return Container(
        margin: EdgeInsets.only(top: 8.0),
        alignment: Alignment.centerRight,
        child: Chip(
          label: Text("Completed at: ${format.format(favour.compelted)}"),
        ),
      );
    }
    if (favour.isRequested){
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            child: Text("Do"),
            onPressed: () {},
          )
        ],
      );
    }
    if (favour.isDoing){
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(onPressed: (){}, child: Text("Give up"),
          ),
          TextButton(onPressed: (){}, child: Text("Completed"),
          )
        ],
      );
    }
    return Container();
  }
  Widget _itemHeader(Favour favour) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
            favour.friend.photoURL,
          ),
        ),
        Expanded(child: Padding(padding: EdgeInsets.only(
            left: 8.0
        ),
            child: Text("${favour.friend.name} asked you to...")
        ),),
      ],
    );
  }
}