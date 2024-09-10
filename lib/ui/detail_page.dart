import 'package:flutter/material.dart';
import 'package:most_popular_applications/model/apps.dart';
import 'package:most_popular_applications/widgets/favorite_button.dart';

class DetailPage extends StatelessWidget {
  final Apps app;

  const DetailPage({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return _WebLayout(app: app);
          } else {
            return _MobileLayout(app: app);
          }
        },
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final Apps app;

  const _MobileLayout({required this.app});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              _HeaderImage(app: app),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: _BackButton(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AppInfoSection(app: app),
                const SizedBox(height: 10),
                _DescriptionSection(
                    title: 'Description', content: app.longDescription),
                const Divider(color: Colors.black),
                _DescriptionSection(title: 'History', content: app.history),
                const SizedBox(height: 10),
                _ImageGallery(imageUrls: app.imageUrls),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WebLayout extends StatelessWidget {
  final Apps app;

  const _WebLayout({required this.app});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
        child: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Most Popular Applications',
                  style: TextStyle(fontFamily: 'Staatliches', fontSize: 32),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _HeaderImage(app: app),
                          const SizedBox(height: 16),
                          _BackButton(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _AppInfoCard(app: app),
                          const SizedBox(height: 10),
                          Scrollbar(
                            controller: scrollController,
                            child: _ImageGallery(
                                imageUrls: app.imageUrls,
                                controller: scrollController),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  final Apps app;

  const _HeaderImage({required this.app});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: app.name,
          child: Image.asset(app.thumbnail, fit: BoxFit.cover),
        ),
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 78, 78, 78),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }
}

class _AppInfoSection extends StatelessWidget {
  final Apps app;

  const _AppInfoSection({required this.app});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              app.name,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
            FavoriteButton(app: app),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            Text(
              app.rating.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  final String title;
  final String content;

  const _DescriptionSection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 16, fontFamily: 'Oksigen'),
        ),
      ],
    );
  }
}

class _ImageGallery extends StatelessWidget {
  final List<String> imageUrls;
  final ScrollController? controller;

  const _ImageGallery({required this.imageUrls, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: imageUrls.map((url) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(url),
          );
        }).toList(),
      ),
    );
  }
}

class _AppInfoCard extends StatelessWidget {
  final Apps app;

  const _AppInfoCard({required this.app});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AppInfoSection(app: app),
            const SizedBox(height: 10),
            _DescriptionSection(
                title: 'Description', content: app.longDescription),
            const Divider(color: Colors.black),
            _DescriptionSection(title: 'History', content: app.history),
          ],
        ),
      ),
    );
  }
}
