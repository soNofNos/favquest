import 'package:favquest/FavourCardItem.dart';
import 'package:flutter/material.dart';
// import 'package:favquest/FavourCardItem.dart';
// import 'package:favquest/RequestFavourPage.dart';
import 'package:favquest/FavourClass.dart';
import 'package:favquest/Favourslist.dart';


class FavoursPage extends StatelessWidget {

  final List <Favour> pendingAnswerFavours;
  final List <Favour> completedFavours;
  final List <Favour> refusedFavours;
  final List <Favour> acceptedFavours;

  FavoursPage({
    Key key,
    this.pendingAnswerFavours,
    this.completedFavours,
    this.refusedFavours,
    this.acceptedFavours,

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Favours"),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              _buildCategoryTab("Requests"),
              _buildCategoryTab("Doing"),
              _buildCategoryTab("Completed"),
              _buildCategoryTab("Refused"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FavoursList(title: "Pending Requests", favours: pendingAnswerFavours),
            FavoursList(title: "Doing", favours: acceptedFavours),
            FavoursList(title: "Completed", favours: completedFavours),
            FavoursList(title: "Refused", favours: refusedFavours),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          tooltip: "Ask a favour",
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String title) {
    return Tab(
      child: Text(title),
    );
  }


}
