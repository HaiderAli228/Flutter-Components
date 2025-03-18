import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScreenTimeAnalyticsScreen extends StatefulWidget {
  const ScreenTimeAnalyticsScreen({super.key});

  @override
  ScreenTimeAnalyticsScreenState createState() =>
      ScreenTimeAnalyticsScreenState();
}

class ScreenTimeAnalyticsScreenState extends State<ScreenTimeAnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _periods = ['Week', 'Month', 'Lifetime'];
  String _selectedPeriod = 'Week';

  final Map<String, List<FlSpot>> _data = {
    'Week': [
      const FlSpot(0, 1.5),
      const FlSpot(1, 2.0),
      const FlSpot(2, 1.8),
      const FlSpot(3, 2.5),
      const FlSpot(4, 1.2),
      const FlSpot(5, 1.8),
      const FlSpot(6, 2.2),
    ],
    'Month': [
      const FlSpot(0, 2.0),
      const FlSpot(1, 2.2),
      const FlSpot(2, 1.9),
      const FlSpot(3, 2.3),
      const FlSpot(4, 2.1),
      const FlSpot(5, 2.4),
      const FlSpot(6, 2.0),
      const FlSpot(7, 1.8),
      const FlSpot(8, 2.2),
      const FlSpot(9, 2.5),
      const FlSpot(10, 2.3),
      const FlSpot(11, 2.1),
    ],
    'Lifetime': [
      const FlSpot(0, 1.0),
      const FlSpot(1, 1.5),
      const FlSpot(2, 1.8),
      const FlSpot(3, 2.0),
      const FlSpot(4, 2.2),
      const FlSpot(5, 2.5),
      const FlSpot(6, 2.3),
      const FlSpot(7, 2.1),
      const FlSpot(8, 2.4),
      const FlSpot(9, 2.6),
      const FlSpot(10, 2.8),
      const FlSpot(11, 3.0),
    ],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _periods.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: const Icon(Icons.person_outline, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Guest',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Free',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Software Development, 25 - 34',
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
                fontFamily: 'Roboto'),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Top 2%',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontFamily: 'Roboto'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeStats(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1 hr, 52 min',
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500),
          ),
          Text(
            'Avg Screen Time',
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
                fontFamily: 'Roboto'),
          ),
          const SizedBox(height: 24),
          Container(
            height: 200,
            padding: const EdgeInsets.only(top: 16),
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}h',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontFamily: 'Roboto'),
                        );
                      },
                      interval: 3,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: _data[_selectedPeriod]!,
                    isCurved: true,
                    color: Colors.blue[400],
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blue[400]!.withOpacity(0.2),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          '${spot.y.toString()}h',
                          TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontFamily: 'Roboto'),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardsCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[500]!, Colors.blue[800]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Share Pass, Get Rewards',
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontFamily: 'Roboto'),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Image.network(
                'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%202025-01-27%20at%208.54.48%E2%80%AFAM-qivecg0BaERhOgLdA3TnqkwbXWbQMa.png',
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Opal',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontFamily: 'Roboto'),
                  ),
                  Text(
                    '30-day Guest Pass',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '1',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontFamily: 'Roboto'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildUserInfo(context),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: _periods.map((period) {
                    final isSelected = period == _selectedPeriod;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedPeriod = period;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.blue[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          period,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: isSelected ? Colors.black : Colors.black,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              _buildTimeStats(context),
              _buildRewardsCard(context),
            ],
          ),
        ),
      ),
    );
  }
}