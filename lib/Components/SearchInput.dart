import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget{
  SearchInput({Key key, @required this.onChanged}): super(key: key);

  final ValueChanged<String> onChanged;

  @override
  State<StatefulWidget> createState() => _SearchInput();
}

class _SearchInput extends State<SearchInput>{
  final TextEditingController _searchTextEditingController = TextEditingController();

  void _clearSearchText(){
    _searchTextEditingController.text = "";

    widget.onChanged("");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 20.0,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: TextField(
          autofocus: true,
          maxLines: 1,
          onChanged: widget.onChanged,
          controller: _searchTextEditingController,
          decoration: InputDecoration(
            hintText: "Search item",
            contentPadding: EdgeInsets.all(8.0),
            prefixIcon: Icon(Icons.search),
            suffixIcon: GestureDetector(
              child: Icon(Icons.highlight_off),
              onTap: _clearSearchText,
            ),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.black38),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.black38)
            )
          ),
        )
    );
  }
}