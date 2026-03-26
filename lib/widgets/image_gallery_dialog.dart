import 'package:flutter/material.dart';
import 'package:portfolio/models/gallery_image.dart';

class ImageGalleryDialog extends StatelessWidget {
  final List<GalleryImage> images;

  const ImageGalleryDialog({super.key, required this.images});

  static Future<void> show(BuildContext context, List<GalleryImage> images) {
    return showDialog(
      context: context,
      builder: (context) => ImageGalleryDialog(images: images),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Make dialog more responsive – use SafeArea to avoid notch, and adjust size based on screen
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.maxFinite,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          color: Colors.white,
          child: Column(
            children: [
              // App bar with close button
              SafeArea(
                bottom: false,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Gallery',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                        tooltip: 'Close gallery',
                      ),
                    ],
                  ),
                ),
              ),
              // Grid of images – flexible height
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      final image = images[index];
                      return GestureDetector(
                        onTap: () => _showFullImage(context, index, image),
                        child: Hero(
                          tag: 'gallery_$index',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: _buildImageThumbnail(image),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageThumbnail(GalleryImage image) {
    if (image.url != null) {
      return Image.network(
        image.url!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 50),
      );
    } else if (image.assetPath != null) {
      return Image.asset(
        image.assetPath!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 50),
      );
    } else {
      return const Icon(Icons.image_not_supported, size: 50);
    }
  }

  void _showFullImage(BuildContext context, int index, GalleryImage image) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) =>
            FullImageScreen(
          image: image,
          heroTag: 'gallery_$index',
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}

class FullImageScreen extends StatelessWidget {
  final GalleryImage image;
  final String heroTag;

  const FullImageScreen({
    super.key,
    required this.image,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      // Tap on image area also dismisses
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.black87,
        // Use extendBodyBehindAppBar to allow image to go behind the app bar
        extendBodyBehindAppBar: true,
        body: Center(
          child: Hero(
            tag: heroTag,
            child: Container(
              height: screenSize.height * .8,
              width: screenSize.width * .8,
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 4,
                child: _buildFullImage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullImage() {
    if (image.url != null) {
      return Image.network(
        image.url!,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 100, color: Colors.white),
      );
    } else if (image.assetPath != null) {
      return Image.asset(
        image.assetPath!,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 100, color: Colors.white),
      );
    } else {
      return const Icon(Icons.image_not_supported,
          size: 100, color: Colors.white);
    }
  }
}
