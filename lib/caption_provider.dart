import 'package:flutter/material.dart';

class CaptionProvider extends ChangeNotifier {
  List<String> _recentCaptions = [
    'Best memories come with friends',
    'Golden hour, golden memories',
  ];

  List<String> _favoriteCaptions = [];

  List<String> get recentCaptions => _recentCaptions;
  List<String> get favoriteCaptions => _favoriteCaptions;

  void addToFavorites(String caption) {
    _favoriteCaptions.add(caption);
    notifyListeners();
  }

  void removeFromFavorites(String caption) {
    _favoriteCaptions.remove(caption);
    notifyListeners();
  }

  void generateNewCaptions(List<String> captions) {
    _recentCaptions = captions;
    notifyListeners();
  }
}

