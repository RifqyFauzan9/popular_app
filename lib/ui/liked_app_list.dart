import 'package:flutter/material.dart';
import 'package:most_popular_applications/provider/liked_app_provider.dart';
import 'package:most_popular_applications/ui/detail_page.dart';
import 'package:provider/provider.dart';
import 'package:most_popular_applications/model/apps.dart';

class LikedAppList extends StatelessWidget {
  const LikedAppList({super.key});

  Widget _buildLikedApps(BuildContext context) {
    var likedApps = Provider.of<LikedAppProvider>(context).likedApps;
    return LayoutBuilder(
      builder: (builder, constraints) {
        final bool isWide = constraints.maxWidth > 800;
        return isWide
            ? Center(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 800,
                      child: ListView.builder(
                        itemCount: likedApps.length,
                        itemBuilder: (context, index) {
                          final Apps app = likedApps[index];
                          return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailPage(app: app);
                                }));
                              },
                              child: Card(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Hero(
                                        tag: app.name,
                                        child: Image.asset(
                                          app.thumbnail,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Text(
                                                'Failed to load image');
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    app.name,
                                                    style: const TextStyle(
                                                        fontSize: 30.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              app.longDescription,
                                              style: const TextStyle(
                                                  fontSize: 14.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ),
                    )),
              )
            : ListView.builder(
                itemCount: likedApps.length,
                itemBuilder: (context, index) {
                  final Apps app = likedApps[index];
                  return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailPage(app: app);
                        }));
                      },
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Hero(
                                tag: app.name,
                                child: Image.asset(
                                  app.thumbnail,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text('Failed to load image');
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            app.name,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      app.shortDescription,
                                      style: const TextStyle(fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var likedApps = Provider.of<LikedAppProvider>(context).likedApps;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Apps'),
      ),
      body: likedApps.isEmpty
          ? const Center(
              child: Text('No liked Apps'),
            )
          : _buildLikedApps(context),
    );
  }
}
