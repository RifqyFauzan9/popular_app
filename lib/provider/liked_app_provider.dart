import 'package:flutter/material.dart';
import 'package:most_popular_applications/model/apps.dart';

class LikedAppProvider extends ChangeNotifier {
  final List<Apps> _likedApps = [];
  List<Apps> get likedApps => _likedApps;

  void toggleFavorite(Apps app) {
    if (_likedApps.contains(app)) {
      _likedApps.remove(app);
    } else {
      _likedApps.add(app);
    }
    notifyListeners();
  }

  bool isLiked(Apps app) {
    return _likedApps.contains(app);
  }
}
