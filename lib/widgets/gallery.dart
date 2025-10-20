import 'package:flutter/material.dart';
import 'package:wedding_invitation/section_title.dart';
import 'package:wedding_invitation/widgets/image_page.dart';

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
      color: const Color(0xFFFFFFFF),
      child: Center(
        child: Container(
          width: widget.width,
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SectionTitle(text: '갤러리', spacingTop: 20.0,),
              const SizedBox(height: 20),
              GridView.builder(
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
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryImagePaths {
  static const List<String> paths = [
    'assets/images/photos/m01_photos.webp',
    'assets/images/photos/m02_photos.webp',
    'assets/images/photos/m03_photos.webp',
    'assets/images/photos/m04_photos.webp',
    'assets/images/photos/m05_photos.webp',
    'assets/images/photos/m06_photos.webp',
    'assets/images/photos/m07_photos.webp',
    'assets/images/photos/m08_photos.webp',
    'assets/images/photos/m09_photos.webp',
    'assets/images/photos/m10_photos.webp',
    'assets/images/photos/m11_photos.webp',
    'assets/images/photos/m12_photos.webp',
  ];

  static List<ImageProvider> get imageProviders => 
      paths.map((path) => AssetImage(path)).toList();
}
