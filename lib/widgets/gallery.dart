import 'package:flutter/material.dart';
import 'package:wedding_invitation/widgets/imagePage.dart';

class Gallery extends StatefulWidget {
  final List<ImageProvider> imageProviders;
  final double? width;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  const Gallery({
    super.key,
    required this.imageProviders,
    this.width,
    this.crossAxisCount = 3,
    this.crossAxisSpacing = 4.0,
    this.mainAxisSpacing = 4.0,
  });

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: const EdgeInsets.all(20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          crossAxisSpacing: widget.crossAxisSpacing,
          mainAxisSpacing: widget.mainAxisSpacing,
        ),
        itemCount: widget.imageProviders.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => ImagePage(
                    initialIndex: index,
                    imageProviders: widget.imageProviders,
                  ),
                ),
              );
            },
            child: Image(
              image: widget.imageProviders[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

class GalleryImagePaths {
  static const List<String> paths = [
    'assets/images/photo/m01_photos.jpg',
    'assets/images/photo/m02_photos.jpg',
    'assets/images/photo/m03_photos.jpg',
    'assets/images/photo/m04_photos.jpg',
    'assets/images/photo/m05_photos.jpg',
    'assets/images/photo/m06_photos.jpg',
    'assets/images/photo/m07_photos.jpg',
    'assets/images/photo/m08_photos.jpg',
    'assets/images/photo/m09_photos.jpg',
    'assets/images/photo/m10_photos.jpg',
    'assets/images/photo/m11_photos.jpg',
    'assets/images/photo/m12_photos.jpg',
    'assets/images/photo/m13_photos.jpg',
    'assets/images/photo/m14_photos.jpg',
    'assets/images/photo/m15_photos.jpg',
    'assets/images/photo/m16_photos.jpg',
    'assets/images/photo/m17_photos.jpg',
    'assets/images/photo/m18_photos.jpg',
  ];

  static List<ImageProvider> get imageProviders => 
      paths.map((path) => AssetImage(path)).toList();
}
