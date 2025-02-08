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
      "https://images.pexels.com/photos/19797384/pexels-photo-19797384/free-photo-of-beautiful-model-in-oregon-wearing-a-forest-green-linen-dress-portrait-taken-by-portland-photographer-lance-reis-on-my-sonya7iii-on-location.jpeg?auto=compress&cs=tinysrgb&w=600",
      'title': 'Beautiful Sunset',
      'description': 'Enjoy the mesmerizing view of the golden sunset over the horizon, creating a breathtaking scene of warmth and peace.'
    },
    {
      'image':
      'https://images.pexels.com/photos/3131809/pexels-photo-3131809.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Lovely Tulips',
      'description': 'The elegance of fresh tulips blooming in the garden, adding vibrant colors and beauty to nature.'
    },
    {
      'image':
      'https://images.pexels.com/photos/12472944/pexels-photo-12472944.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Starry Night',
      'description': 'Gaze into the vast beauty of a starry night sky, filled with shimmering stars and deep mysteries of the universe.'
    },
    {
      'image':
      'https://images.pexels.com/photos/17307290/pexels-photo-17307290/free-photo-of-model-in-the-forest.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Haider Ali',
      'description': 'A peaceful getaway into the mountains, where the fresh air and scenic views offer a perfect retreat from city life.'
    },
    {
      'image':
      'https://images.pexels.com/photos/19797390/pexels-photo-19797390/free-photo-of-beautiful-model-in-oregon-wearing-a-forest-green-linen-dress-portrait-taken-by-portland-photographer-lance-reis-on-my-sonya7iii-on-location.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Mountain Escape',
      'description': 'A peaceful getaway into the mountains, where the fresh air and scenic views offer a perfect retreat from city life.'
    },
    {
      'image':
      'https://images.pexels.com/photos/1852300/pexels-photo-1852300.jpeg?auto=compress&cs=tinysrgb&w=600',
      'title': 'Escape Mountain AA',
      'description': 'A peaceful getaway into the mountains, where the fresh air and scenic views offer a perfect retreat from city life.'
    },
    {
      'image':
      "https://images.pexels.com/photos/831477/pexels-photo-831477.jpeg?auto=compress&cs=tinysrgb&w=600",
      'title': 'Beautiful Sunset',
      'description': 'Enjoy the mesmerizing view of the golden sunset over the horizon, creating a breathtaking scene of warmth and peace.'
    },
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
                      bottom: 100,
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
                              offset: currentIndex == index ? Offset(0, 0) : Offset(0, -0.5),
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeInOut,
                              child: Text(
                                items[index]['title']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black54,
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            AnimatedSlide(
                              offset: currentIndex == index ? Offset(0, 0) : Offset(0, -0.5),
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeInOut,
                              child: Text(
                                items[index]['description']!,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                  height: 1.5,
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
