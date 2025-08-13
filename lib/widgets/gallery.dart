import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:ui';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:wedding_invitation/widgets/imagePage.dart';

class Gallery extends StatefulWidget {
  final List<ImageProvider> imagePaths = [
    AssetImage('assets/images/photo/m01_photos.jpg'),
    AssetImage('assets/images/photo/m02_photos.jpg'),
    AssetImage('assets/images/photo/m03_photos.jpg'),
    AssetImage('assets/images/photo/m04_photos.jpg'),
    AssetImage('assets/images/photo/m05_photos.jpg'),
    AssetImage('assets/images/photo/m06_photos.jpg'),
    AssetImage('assets/images/photo/m07_photos.jpg'),
    AssetImage('assets/images/photo/m08_photos.jpg'),
    AssetImage('assets/images/photo/m09_photos.jpg'),
    AssetImage('assets/images/photo/m10_photos.jpg'),
    AssetImage('assets/images/photo/m11_photos.jpg'),
    AssetImage('assets/images/photo/m12_photos.jpg'),
    AssetImage('assets/images/photo/m13_photos.jpg'),
    AssetImage('assets/images/photo/m14_photos.jpg'),
    AssetImage('assets/images/photo/m15_photos.jpg'),
    AssetImage('assets/images/photo/m16_photos.jpg'),
    AssetImage('assets/images/photo/m17_photos.jpg'),
    AssetImage('assets/images/photo/m18_photos.jpg'),
  ];
  
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      margin: const EdgeInsetsDirectional.all(20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: widget.imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => ImagePage(
                    initialIndex: index,
                    imageProviders: widget.imagePaths,
                  ),
                ),
              );
            },
            child: Image(
              image: widget.imagePaths[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
}
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
