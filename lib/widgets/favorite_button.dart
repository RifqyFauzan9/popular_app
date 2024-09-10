import 'package:flutter/material.dart';
import 'package:most_popular_applications/model/apps.dart';
import 'package:most_popular_applications/provider/liked_app_provider.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  final Apps app;

  const FavoriteButton({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    var likedAppProvider =
        Provider.of<LikedAppProvider>(context);
    return IconButton(
      icon: Icon(
        likedAppProvider.isLiked(app) ? Icons.favorite : Icons.favorite_border,
        color: likedAppProvider.isLiked(app) ? Colors.red : null,
      ),
      onPressed: () {
        likedAppProvider.toggleFavorite(app);
      },
    );
  }
}
