import 'package:flutter/material.dart';
import 'dart:async';

class InfiniteCarousel extends StatefulWidget {
  const InfiniteCarousel({super.key});

  @override
  _InfiniteCarouselState createState() => _InfiniteCarouselState();
}

class _InfiniteCarouselState extends State<InfiniteCarousel> {
  final PageController _pageController =
  PageController(viewportFraction: 0.85); // Adjusted for a better look
  int currentPage = 0;

  List<String> images = [
    'https://images.pexels.com/photos/1784578/pexels-photo-1784578.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1699204/pexels-photo-1699204.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/3716928/pexels-photo-3716928.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/28834406/pexels-photo-28834406/free-photo-of-silhouette-of-a-boat-at-sunset-on-calm-waters.jpeg?auto=compress&cs=tinysrgb&w=600',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PageView.builder(
          scrollDirection: Axis.vertical, // Scroll from bottom to top
          controller: _pageController,
          itemCount: images.length,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            double scale = currentPage == index ? 1.0 : 0.85;
            return AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                double page = 0;
                if (_pageController.position.haveDimensions) {
                  page = _pageController.page ?? 0;
                }
                double value = (page - index).abs();
                double scaleFactor = 1 - (value * 0.2);
                double translateY = (1 - scaleFactor) * 50;

                return Transform.translate(
                  offset: Offset(0, translateY),
                  child: Transform.scale(
                    scale: scaleFactor,
                    child: CarouselItem(image: images[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String image;
  const CarouselItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.transparent],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(image,
              fit: BoxFit.cover, width: double.infinity, height: 250),
        ),
      ),
    );
  }
}
