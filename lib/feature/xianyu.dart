import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class XianyuPage extends StatefulWidget {
  const XianyuPage({super.key});

  @override
  State createState() => _XianyuPageState();
}

class _XianyuPageState extends State with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('闲鱼首页示例'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: ListView.builder(
                scrollDirection: Axis.horizontal, // 设置ListView为横向滑动
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text('Button $index'),
                  );
                },
              ),
              titlePadding: EdgeInsets.zero,
              background: const ColoredBox(color: Colors.orange),
            ),
          ),
          const SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Text('AppBar 2'),
              background: ColoredBox(color: Colors.yellow),
            ),
          ),
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: List.generate(
                  10,
                  (index) => Tab(text: 'Tab $index'),
                ),
              ),
              titlePadding: EdgeInsets.zero,
              background: const ColoredBox(color: Colors.green),
            ),
          ),
          SliverWaterfallFlow(
            gridDelegate: const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 设置列数为2
              crossAxisSpacing: 10.0, // 水平间距
              mainAxisSpacing: 10.0, // 垂直间距
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    height: 50.0 + 40.0 * (index % 9),     // 每个元素高度不固定
                    child: Text('grid item $index'));
              },
              childCount: 20,
            ),
          ),
          // 瀑布流布局
          // SliverGrid(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 10,
          //     mainAxisSpacing: 10,
          //     childAspectRatio: 0.7,
          //   ),
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Container(
          //         color: Colors.primaries[index % Colors.primaries.length],
          //         child: Center(
          //           child: Text('Item $index'),
          //         ),
          //       );
          //     },
          //     childCount: 30, // 假设有30个item
          //   ),
          // ),
        ],
      ),
    );
  }
}
