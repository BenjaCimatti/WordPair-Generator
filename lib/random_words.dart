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
        color: alreadySaved ? Colors.red[600] : null,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator')
      ),
      body: _buildList(),
    );
  }
}