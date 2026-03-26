class GalleryImage {
  final String? url; // network URL (optional)
  final String? assetPath; // local asset path (optional)
  final String? title;

  GalleryImage({this.url, this.assetPath, this.title}) {
    assert(url != null || assetPath != null,
        'Either url or assetPath must be provided');
  }
}
