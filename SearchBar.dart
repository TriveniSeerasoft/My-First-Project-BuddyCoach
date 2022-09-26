import 'package:flutter/material.dart';

class SearchBarOnHomeScreen extends StatefulWidget {
  const SearchBarOnHomeScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarOnHomeScreen> createState() => _SearchBarOnHomeScreenState();
}

class _SearchBarOnHomeScreenState extends State<SearchBarOnHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDeligate());
            },
          ),
        ],
      ),
    );
  }
}

class CustomSearchDeligate extends SearchDelegate {
  List<String> suggestions = [
    'HTML',
    'CSS',
    'SQL',
    'Python',
    'Bootstrap',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = ' ';
          }
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back),
    );

    @override
    Widget buildResults(BuildContext context) {
      Center(
        child: Text(query),
      );
      throw UnimplementedError();
    }

    @override
    Widget buildSuggestions(BuildContext context) {
      for (var topics in suggestions) {
        if (topics.toLowerCase().contains(query.toLowerCase())) ;
        suggestions.add(topics);
      }
      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          final suggestion = suggestions[index];

          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
            },
          );
        },
      );
      //throw UnimplementedError();
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
