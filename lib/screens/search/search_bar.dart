import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/i18n/strings.dart';
import 'package:nues_feet_flutter/screens/articles/articles_list.dart';
import 'package:nues_feet_flutter/styles/colors.dart' as Colors;

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Material(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Container(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.kMartini,
              ),
              hintStyle: TextStyle(
                color: Colors.kMartini,
              ),
              hintText: Strings.of(context).searchHint,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (query) {
              ArticlesListProvider.of(context).search(query);
            },
          ),
        ),
      ),
    );
  }
}
