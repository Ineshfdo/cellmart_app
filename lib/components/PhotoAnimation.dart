import 'dart:async';
import 'package:flutter/material.dart';

class PhotoAnimation extends StatefulWidget {
  const PhotoAnimation({super.key});

  @override
  State<PhotoAnimation> createState() => _PhotoAnimationState();
}

class _PhotoAnimationState extends State<PhotoAnimation> {
  final PageController _controller = PageController(viewportFraction: 0.85);

  final List<Map<String, dynamic>> _images = [
    {
      "path": "assets/images/insidestore.jpg",
      "height": 420.0,
      "borderRadius": 20.0,
      "margin": const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    },
    {
      "path": "assets/images/store12.jpg",
      "height": 420.0,
      "borderRadius": 20.0,
      "margin": const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    },
    {
      "path": "assets/images/store1.jpg",
      "height": 420.0,
      "borderRadius": 20.0,
      "margin": const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    },
  ];

  Timer? _timer;
  int _currentPage = 0;

  List<Map<String, dynamic>> get _loopImages {
    // Clone first image at the end for looping
    return [..._images, _images.first];
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_controller.hasClients) {
        _currentPage++;
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );

        // Reset back to first when looping
        if (_currentPage == _loopImages.length - 1) {
          Future.delayed(const Duration(milliseconds: 850), () {
            if (_controller.hasClients) {
              _controller.jumpToPage(0);
              _currentPage = 0;
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;

    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: SizedBox(
          height: isDesktop ? double.infinity : 420,
          child: PageView.builder(
            controller: _controller,
            itemCount: _loopImages.length,
            itemBuilder: (context, index) {
              return _buildAnimatedPhoto(index, isDesktop, _loopImages);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedPhoto(
    int index,
    bool isDesktop,
    List<Map<String, dynamic>> images,
  ) {
    final imageData = images[index];

    final shadowColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white24
        : Colors.black26;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double pageOffset = 0.0;
        if (_controller.hasClients && _controller.position.haveDimensions) {
          pageOffset = _controller.page! - index;
        }

        // Fade effect
        final double opacity = (1 - pageOffset.abs()).clamp(0.0, 1.0);

        // Slide effect
        final double slide = pageOffset * 40;

        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(slide, 0),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                height: isDesktop ? 500 : imageData['height'],
                child: child,
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: imageData['margin'],
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(imageData['borderRadius']),
          image: DecorationImage(
            image: AssetImage(imageData['path']),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
      ),
    );
  }
}
