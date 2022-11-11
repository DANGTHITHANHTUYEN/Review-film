import 'package:flutter/material.dart';

// String uri = 'http://10.2.17.17:3000';
String uri = 'http://<yourIP>:3000';

class GlobalVariables {
  static const appBarGrandient = LinearGradient(
    colors: [
      Color.fromARGB(255, 81, 98, 207),
      Color.fromARGB(255, 55, 76, 127),
    ],
    stops: [0.5, 1.0],
  );
  static const appbarColor = Color.fromARGB(255, 152, 173, 189);
  static const scrollDirectionColor = Color.fromARGB(255, 192, 212, 227);
  static const secondaryColor = Color.fromARGB(255, 81, 157, 219);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static const List<String> carouselImages = [
    'https://www.cgv.vn/media/catalog/product/cache/1/image/1800x/71252117777b696995f01934522c402d/t/e/teaser_cgtqk_640x396.jpg',
    'https://gamek.mediacdn.vn/thumb_w/690/133514250583805952/2022/10/8/z-1665208986037994779196-0-0-750-1200-crop-1665208994067885604080.jpg',
    'https://filmdaily.co/wp-content/uploads/2022/06/minionsgru-04-1300x975.jpg',
  ];

  static const List<Map<String, String>> typeFilm = [
    {
      'name': 'Nổi bật',
    },
    {
      'name': 'Phim chiếu rạp',
    },
    {
      'name': 'Phim viễn tưởng',
    },
    {
      'name': 'Phim hoạt hình',
    },
  ];

  static const List<Map<String, String>> film = [
    {
      'type': 'Phim chiếu rạp',
      'title': 'Cô gái đến từ quá khứ',
      'cast': 'Ninh Dương Lan Ngọc, Katy Nguyễn',
      'content': 'Nói về cuộc sống của một cô gái',
      'image':
          'https://www.cgv.vn/media/catalog/product/cache/1/image/1800x/71252117777b696995f01934522c402d/t/e/teaser_cgtqk_640x396.jpg'
    },
    {
      'type': 'Phim viễn tưởng',
      'title': 'Avarta',
      'cast': 'Lmakfneos',
      'content': 'Nói về ',
      'image':
          'https://gamek.mediacdn.vn/thumb_w/690/133514250583805952/2022/10/8/z-1665208986037994779196-0-0-750-1200-crop-1665208994067885604080.jpg',
    },
  ];
}
