import 'package:flutter/material.dart';
import 'package:most_popular_applications/ui/detail_page.dart';
import 'package:most_popular_applications/model/apps.dart';

class AppListMobile extends StatefulWidget {
  const AppListMobile({super.key});

  @override
  _AppListMobileState createState() => _AppListMobileState();
}

class _AppListMobileState extends State<AppListMobile> {
  List<Apps> _filteredApps = appsList; // Initial list to show all apps
  String _searchQuery = '';

  void _updateSearch(String query) {
    setState(() {
      _searchQuery = query;
      _filteredApps = appsList
          .where((app) => app.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Popular App'),
        actions: [
          IconButton(
            onPressed: () => _showDarkModeDialog(context),
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth > 600;

          return Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isWide
                      ? SizedBox(
                          width: 800,
                          child: _buildSearchTextField(),
                        )
                      : _buildSearchTextField(),
                ),
                Expanded(
                  child: _filteredApps.isEmpty
                      ? const Center(
                          child: Text(
                            'No results found',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: _filteredApps.length,
                          itemBuilder: (context, index) {
                            final Apps app = _filteredApps[index];
                            final Widget appCard = AppCard(
                              app: app,
                              isWide: isWide,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(app: app),
                                  ),
                                );
                              },
                            );

                            return Center(
                              child: isWide
                                  ? SizedBox(
                                      width: 800,
                                      child: appCard,
                                    )
                                  : appCard,
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      onChanged: _updateSearch,
      decoration: InputDecoration(
        hintText: 'Search apps...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _showDarkModeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Uppss!'),
          content: const Text('Dark mode is not available yet.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}

class AppCard extends StatelessWidget {
  final Apps app;
  final bool isWide;
  final VoidCallback onTap;

  const AppCard({
    super.key,
    required this.app,
    required this.isWide,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double imageSize = isWide ? 200 : 80;

    return InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: app.name,
                    child: Image.asset(
                      app.thumbnail,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Failed to load image');
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            app.name,
                            style: TextStyle(
                              fontSize: isWide ? 30 : 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            isWide ? app.longDescription : app.shortDescription,
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
          ],
        ));
  }
}
