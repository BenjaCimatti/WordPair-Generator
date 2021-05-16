import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final _randomWordPair = <WordPair>[];
  final _savedWordPairs = Set<WordPair>(); 
  
  Widget _buildList() {
    return ListView.builder(
      itemBuilder: (context, item){
        if(item.isOdd) return Divider();

        final index = item ~/ 2;

        if(index >= _randomWordPair.length) {
          _randomWordPair.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPair[index]);
      }

    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWordPairs.contains(pair); // True or False
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18.0)
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border_rounded,
        color: alreadySaved ? Colors.red[400] : null,
      ),
      onTap: () {
        setState(() {
        if(alreadySaved) {
          _savedWordPairs.remove(pair);
        } else {
          _savedWordPairs.add(pair);
        }          
        });
      },
    );
  }
  
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: TextStyle(
                  fontSize: 18.0),
              ),
            );
          });

          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();
          
          return Scaffold(
            appBar: AppBar(title: Text('Saved WordPairs'),),
            body: ListView(
              children: divided
            )
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.label_important_sharp), onPressed: _pushSaved)
        ],
      ),
      body: _buildList(),
    );
  }
}