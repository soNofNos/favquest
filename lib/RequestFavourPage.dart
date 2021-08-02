import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class RequestFavourPage extends StatelessWidget {
  final List<Friend> friends;

  RequestFavourPage({Key key, this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requesting a favour"),
        leading: CloseButton(),
        actions: <Widget>[
          TextButton(
            child: Text(
              "SAVE",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Request a favour to: "),
            DropdownButtonFormField(
              items: friends
                  .map(
                    (f) => DropdownMenuItem(
                      child: Text(f.name),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text("Favour Description: "),
            TextFormField(
              maxLines: 5,
              inputFormatters: [LengthLimitingTextInputFormatter(200)],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text("Due Date: "),
            DateTimePickerFormField(
              //TODO => download datetime_picker_formfield library plugin = DONE
              inputType: InputType.both,
              format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
              editable: false,
              decoration: InputDecoration(
                labelText: 'Date/Time',
                // hasFloatingPlaceholder: false, ====depreciated
                // floatingLabelBehavior: null,
              ),
              onChanged: (dt) {},
            ),
            Container(),
            Text(""),
          ],
        ),
      ),
    );
  }
}
