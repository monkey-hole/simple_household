import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ホーム',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
        ),
        toolbarHeight: 40,
        backgroundColor: Colors.red,
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              MoneyPiChart(),
              CategoryListView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: '履歴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
        selectedItemColor: Colors.red,
      ),
      floatingActionButton: const TransactionFloatingButton(),
    );
  }
}

class MoneyPiChart extends ConsumerWidget {
  const MoneyPiChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: 250,
        height: 250,
        child: Stack(
          children: [
            const Center(
              child: Text('¥ 20,000', style: TextStyle(fontSize: 16)),
            ),
            PieChart(
              PieChartData(
                startDegreeOffset: 270,
                sections: [
                  PieChartSectionData(
                    color: Colors.red,
                    value: 25,
                    title: '25%',
                    radius: 60,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.green,
                    value: 25,
                    title: '25%',
                    radius: 60,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.blue,
                    value: 25,
                    title: '25%',
                    radius: 60,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.yellow,
                    value: 25,
                    title: '25%',
                    radius: 60,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
                sectionsSpace: 0,
                centerSpaceRadius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryListView extends ConsumerWidget {
  const CategoryListView({super.key});

  CircleAvatar _buildCircleAvatar(IconData icon, Color color) {
    return CircleAvatar(
      backgroundColor: color,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Text(
              "カテゴリー別の出費",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            ListTile(
              title: const Text('食費'),
              leading: _buildCircleAvatar(Icons.fastfood, Colors.red),
              trailing: const Text(
                '10,000円',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: Text('交通費'),
              leading: _buildCircleAvatar(Icons.train, Colors.green),
              trailing: Text(
                '5,000円',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: Text('日用品'),
              leading: _buildCircleAvatar(Icons.shopping_cart, Colors.blue),
              trailing: Text(
                '3,000円',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: Text('その他'),
              leading: _buildCircleAvatar(Icons.attach_money, Colors.yellow),
              trailing: Text(
                '2,000円',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TransactionFloatingButton extends StatelessWidget {
  const TransactionFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Add your onPressed function here
      },
      child: const Icon(Icons.edit),
    );
  }
}
