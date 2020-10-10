import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:screen_adaptation/screen_extension.dart';

/// 基础 默认
class SliverPage extends BasePage {
  static const routeName = '/sliver';
  SliverPage({Key key}) : super(key: key);

  @override
  _SliverPageState createState() => _SliverPageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _SliverPageState extends BasePageState<SliverPage> {
  List<String> names = [];
  @override
  void initState() {
    names = List.generate(80, (int index) => 'Haha $index');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScrollable(context),
    );
  }

  Widget _buildScrollable(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text('Main Title'),
          expandedHeight: 200, // 设置 AppBar 展开后的高度
          flexibleSpace: Placeholder(),
          // pinned: true,  // 固定，pinned 和 floating 不能同时为 true
          // floating: true, // 上滑的时候马上出现
        ),
        SliverToBoxAdapter(
          child: Text('12'),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, index) {
              return _buildItem(context, names.elementAt(index));
            },
          ),
        ),
      ],
    );
    return ListView(
      children: names.map((name) => _buildItem(context, name)).toList(),
    );
  }

  Widget _buildItem(BuildContext context, String name) {
    return Container(
      height: 100.dp,
      child: Text(name),
    );
  }
}

// class SliverFilip extends SingleChildRenderObjectWidget {
//   SliverFilip({Widget child, Key key}) : super(child: child, key: key);

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return RenderSliverFilip();
//   }
// }

/// 参考: RenderSliverToBoxAdapters
// class RenderSliverFilip extends RenderSliverSingleBoxAdapter {
//   RenderSliverFilip({
//     RenderBox child,
//   }) : super(child: child);

//   @override
//   void performLayout() {
//     if (child == null) {
//       geometry = SliverGeometry.zero;
//       return;
//     }
//     child.layout(constraints.asBoxConstraints(), parentUsesSize: true);
//     double childExtent;
//     switch (constraints.axis) {
//       case Axis.horizontal:
//         childExtent = child.size.width;
//         break;
//       case Axis.vertical:
//         childExtent = child.size.height;
//         break;
//     }
//     assert(childExtent != null);
//     final double paintedChildSize =
//         calculatePaintOffset(constraints, from: 0.0, to: childExtent);
//     final double cacheExtent =
//         calculateCacheOffset(constraints, from: 0.0, to: childExtent);

//     assert(paintedChildSize.isFinite);
//     assert(paintedChildSize >= 0.0);
//     geometry = SliverGeometry(
//       scrollExtent: childExtent,
//       paintExtent: paintedChildSize,
//       cacheExtent: cacheExtent,
//       maxPaintExtent: childExtent,
//       hitTestExtent: paintedChildSize,
//       hasVisualOverflow: childExtent > constraints.remainingPaintExtent ||
//           constraints.scrollOffset > 0.0,
//     );
//     setChildParentData(child, constraints, geometry);
//   }
// }
