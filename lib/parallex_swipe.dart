import 'package:flutter/material.dart';

class ParallaxCardSwipe extends StatefulWidget {
  const ParallaxCardSwipe({super.key});

  @override
  _ParallaxCardSwipeState createState() => _ParallaxCardSwipeState();
}

class _ParallaxCardSwipeState extends State<ParallaxCardSwipe> {
  PageController _pageController = PageController(viewportFraction: 0.9);
  int currentIndex = 0;

  List<Map<String, String>> items = [
    {
      'image':
      'https://images.pexels.com/photos/1076758/pexels-photo-1076758.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Beautiful Sunset',
      'description': 'Enjoy the mesmerizing view of the golden sunset over the horizon, creating a breathtaking scene of warmth and peace.'
    },
    {
      'image':
      'https://images.pexels.com/photos/36729/tulip-flower-bloom-pink.jpg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Lovely Tulips',
      'description': 'The elegance of fresh tulips blooming in the garden, adding vibrant colors and beauty to nature.'
    },
    {
      'image':
      'https://images.pexels.com/photos/459335/pexels-photo-459335.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Starry Night',
      'description': 'Gaze into the vast beauty of a starry night sky, filled with shimmering stars and deep mysteries of the universe.'
    },
    {
      'image':
      'https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Mountain Escape',
      'description': 'A peaceful getaway into the mountains, where the fresh air and scenic views offer a perfect retreat from city life.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PageView.builder(
          controller: _pageController,
          itemCount: items.length,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 15,
                    spreadRadius: 5,
                    offset: Offset(0, 8),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.network(
                      items[index]['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -50,
                      left: 20,
                      right: 20,
                      child: AnimatedOpacity(
                        opacity: currentIndex == index ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedSlide(
                              offset: currentIndex == index ? Offset(0, 0) : Offset(0, 0.5),
                              duration: Duration(milliseconds: 600),
                              curve: Curves.easeInOut,
                              child: Text(
                                items[index]['title']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            AnimatedSlide(
                              offset: currentIndex == index ? Offset(0, 0) : Offset(0, 0.5),
                              duration: Duration(milliseconds: 600),
                              curve: Curves.easeInOut,
                              child: Text(
                                items[index]['description']!,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}