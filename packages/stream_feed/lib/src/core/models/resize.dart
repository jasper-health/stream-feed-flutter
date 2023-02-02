/// The type of resize
enum ResizeType {
  /// resize by clipping the image
  clip,

  /// resize by cropping the image
  crop,

  /// resize by scaling the image
  scale,

  /// resize by filling the image
  fill,
}

/// Extensions for [ResizeType].
extension ResizeX on ResizeType {
  /// Gets the [ResizeType] as a String.
  String get name => {
        ResizeType.clip: 'clip',
        ResizeType.crop: 'crop',
        ResizeType.scale: 'scale',
        ResizeType.fill: 'fill',
      }[this]!;
}

/// Resize an image based on supplied [_width],[_height] and eventually [_type]
class Resize {
  /// [Resize] constructor
  const Resize({
    int? width,
    int? height,
    ResizeType type = ResizeType.clip,
  }) : 
      _type = type,
      _width = width,
      _height = height;

  final int? _width;
  final int? _height;
  final ResizeType _type;

  /// Serialize params
  Map<String, Object?> get params {
    final payload = <String, Object?>{
      'resize': _type.name,
    };
    if (_width != null) {
      payload['w'] = _width;
    }

    if (_height != null) {
      payload['h'] = _height;
    }

    return payload;
  }
}
