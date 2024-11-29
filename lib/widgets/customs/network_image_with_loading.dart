import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'loading_widget.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class NetworkImageWithLoading extends StatelessWidget {
  final String? img;
  final BoxFit boxFit;
  final BorderRadius borderRadius;
  final Widget? onErrorWidget;

  // Custom cache manager with extended cache duration
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey', // Unique cache key
      stalePeriod: const Duration(days: 7), // Cache for 7 days
      maxNrOfCacheObjects: 200,
    ),
  );

  const NetworkImageWithLoading({
    super.key,
    this.img,
    this.boxFit = BoxFit.cover,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.onErrorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CachedNetworkImage(
        imageUrl: img ?? "",
        cacheManager: customCacheManager, // Use custom cache manager
        fit: boxFit,
        progressIndicatorBuilder: (context, url, loadingProgress) {
          return const Center(
            child: LoadingWidget(color: Color(0xFFE57438)),
          );
        },
        errorWidget: (context, error, stackTrace) {
          return onErrorWidget ?? const Icon(Icons.error_outline);
        },
      ),
    );
  }
}

