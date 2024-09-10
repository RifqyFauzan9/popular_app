class Apps {
  final String name;
  final String thumbnail;
  final List<String> imageUrls;
  final String shortDescription;
  final String longDescription;
  final double rating;
  final String history;

  Apps({
    required this.thumbnail,
    required this.longDescription,
    required this.name,
    required this.imageUrls,
    required this.shortDescription,
    required this.rating,
    required this.history,
  });
}

List<Apps> appsList = [
  Apps(
      thumbnail: "assets/images/tiktok.jpeg",
      name: "TikTok",
      imageUrls: [
        "assets/images/tiktok.jpeg",
        "assets/images/tiktok.jpeg",
        "assets/images/tiktok.jpeg",
      ],
      shortDescription: "Create, share, and watch short-form mobile videos.",
      longDescription:
          "TikTok is a social media platform that allows users to create and share short-form videos on any topic. With an extensive library of music, sound effects, and editing tools, it’s easy to produce engaging content that goes viral.",
      rating: 4.5,
      history:
          "Launched in 2016 by ByteDance, TikTok gained popularity after merging with Musical.ly in 2018. It's known for its viral content and powerful algorithm."),
  Apps(
      thumbnail: "assets/images/instagram.jpeg",
      name: "Instagram",
      imageUrls: [
        "assets/images/instagram.jpeg",
        "assets/images/instagram.jpeg",
        "assets/images/instagram.jpeg",
      ],
      shortDescription: "Capture and share your photos, videos, and stories.",
      longDescription:
          "Instagram is a popular platform for sharing photos and videos. Users can create Stories, Reels, and more, making it a key player in social media.",
      rating: 4.7,
      history:
          "Founded in 2010, Instagram was acquired by Facebook in 2012. It introduced Stories in 2016 and Reels in 2020, quickly becoming a hub for influencers and brands."),
  Apps(
      thumbnail: "assets/images/whatsapp.jpeg",
      name: "WhatsApp",
      imageUrls: [
        "assets/images/whatsapp.jpeg",
        "assets/images/whatsapp.jpeg",
        "assets/images/whatsapp.jpeg",
      ],
      shortDescription: "Fast, simple, secure messaging and calling for free.",
      longDescription:
          "WhatsApp is a secure messaging app for text, voice, and video communication, widely used for both personal and business interactions.",
      rating: 4.6,
      history:
          "Launched in 2009, WhatsApp was acquired by Facebook in 2014. It grew rapidly due to its simplicity and strong encryption, now boasting over 2 billion users."),
  Apps(
      thumbnail: "assets/images/youtube.jpg",
      name: "YouTube",
      imageUrls: [
        "assets/images/youtube.jpg",
        "assets/images/youtube.jpg",
        "assets/images/youtube.jpg",
      ],
      shortDescription: "Watch, upload, and share videos with the world.",
      longDescription:
          "YouTube is the largest video-sharing platform, offering millions of videos on every topic imaginable, from tutorials to entertainment.",
      rating: 4.8,
      history:
          "Founded in 2005, YouTube was acquired by Google in 2006. It's now a global hub for video content, with features like live streaming, ads, and creator monetization."),
  Apps(
      thumbnail: "assets/images/facebook.jpeg",
      name: "Facebook",
      imageUrls: [
        "assets/images/facebook.jpeg",
        "assets/images/facebook.jpeg",
        "assets/images/facebook.jpeg",
      ],
      shortDescription:
          "Connect with friends, family, and the world around you.",
      longDescription:
          "Facebook is a social networking platform that allows users to share updates, photos, and videos, and engage with communities worldwide.",
      rating: 4.3,
      history:
          "Launched in 2004, Facebook revolutionized social networking. It became a household name with features like Marketplace, groups, and Facebook Watch."),
  Apps(
      thumbnail: "assets/images/spotify.jpeg",
      name: "Spotify",
      imageUrls: [
        "assets/images/spotify.jpeg",
        "assets/images/spotify.jpeg",
        "assets/images/spotify.jpeg",
      ],
      shortDescription: "Stream your favorite music and podcasts.",
      longDescription:
          "Spotify offers streaming of millions of songs, albums, and podcasts. It personalizes playlists and integrates social sharing features.",
      rating: 4.7,
      history:
          "Founded in 2006, Spotify became a leader in music streaming, offering both free and premium subscriptions. It introduced podcasts and playlist curation features."),
  Apps(
      thumbnail: "assets/images/snapchat.jpeg",
      name: "Snapchat",
      imageUrls: [
        "assets/images/snapchat.jpeg",
        "assets/images/snapchat.jpeg",
        "assets/images/snapchat.jpeg",
      ],
      shortDescription: "Share the moment with friends and explore AR lenses.",
      longDescription:
          "Snapchat is known for its disappearing messages, creative filters, and augmented reality features that engage users through quick, fun interactions.",
      rating: 4.4,
      history:
          "Launched in 2011, Snapchat introduced ephemeral messaging. Its AR filters and Stories feature have made it one of the most popular social apps for younger users."),
  Apps(
      thumbnail: "assets/images/google maps.jpeg",
      name: "Google Maps",
      imageUrls: [
        "assets/images/google maps.jpeg",
        "assets/images/google maps.jpeg",
        "assets/images/google maps.jpeg",
      ],
      shortDescription: "Real-time GPS navigation, traffic, and transit info.",
      longDescription:
          "Google Maps provides GPS navigation, real-time traffic updates, and transit information. It's an essential tool for discovering places and getting directions.",
      rating: 4.8,
      history:
          "Launched in 2005 by Google, Google Maps revolutionized navigation with Street View, real-time traffic, and integration with public transit systems."),
  Apps(
      thumbnail: "assets/images/netflix.jpeg",
      name: "Netflix",
      imageUrls: [
        "assets/images/netflix.jpeg",
        "assets/images/netflix.jpeg",
        "assets/images/netflix.jpeg",
      ],
      shortDescription:
          "Watch movies, TV shows, and original series on demand.",
      longDescription:
          "Netflix offers on-demand streaming of movies, TV shows, and documentaries, known for its original series and personalized recommendations.",
      rating: 4.7,
      history:
          "Founded in 1997 as a DVD rental service, Netflix shifted to streaming in 2007. It became a leader in entertainment, producing its own original content since 2013."),
  Apps(
      thumbnail: "assets/images/amazon.jpeg",
      name: "Amazon",
      imageUrls: [
        "assets/images/amazon.jpeg",
        "assets/images/amazon.jpeg",
        "assets/images/amazon.jpeg",
      ],
      shortDescription:
          "Shop online for a vast selection of products and fast delivery.",
      longDescription:
          "Amazon is the world's largest e-commerce platform, offering fast delivery options, digital services, and an extensive product selection.",
      rating: 4.6,
      history:
          "Founded in 1994 as an online bookstore, Amazon expanded into a vast e-commerce giant. It now offers services like Prime, AWS, and digital content streaming."),
];
