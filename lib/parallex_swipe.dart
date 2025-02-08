import 'package:flutter/material.dart';

class ParallaxCardSwipe extends StatefulWidget {
  const ParallaxCardSwipe({super.key});

  @override
  _ParallaxCardSwipeState createState() => _ParallaxCardSwipeState();
}

class _ParallaxCardSwipeState extends State<ParallaxCardSwipe>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset _dragOffset = Offset.zero;
  double _rotation = 0.0;
  List<String> images = [
    'https://images.pexels.com/photos/1076758/pexels-photo-1076758.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/36729/tulip-flower-bloom-pink.jpg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/459335/pexels-photo-459335.jpeg?auto=compress&cs=tinysrgb&w=600'
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta;
      _rotation = _dragOffset.dx / 300;
    });
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dx;
    if (velocity.abs() > 500 || _dragOffset.dx.abs() > 100) {
      _swipeCard(velocity > 0 ? 1 : -1);
    } else {
      setState(() {
        _dragOffset = Offset.zero;
        _rotation = 0;
      });
    }
  }

  void _swipeCard(int direction) {
    setState(() {
      _dragOffset = Offset(direction * 500, 0);
    });
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        currentIndex = (currentIndex + 1) % images.length;
        _dragOffset = Offset.zero;
        _rotation = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onPanUpdate: _onDragUpdate,
          onPanEnd: _onDragEnd,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..translate(_dragOffset.dx, _dragOffset.dy, 0)
              ..rotateZ(_rotation),
            child: Stack(
              children: images.reversed.toList().asMap().entries.map((entry) {
                int index = entry.key;
                String imageUrl = entry.value;
                bool isFront = index == currentIndex;

                return Positioned.fill(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: isFront ? 1 : 0,
                    child: CardWidget(imageUrl: imageUrl, isFront: isFront),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String imageUrl;
  final bool isFront;

  const CardWidget({required this.imageUrl, required this.isFront});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            spreadRadius: 5,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
