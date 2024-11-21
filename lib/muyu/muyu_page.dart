import 'package:flutter/material.dart'; // 导入 Flutter 基础包

class MuyuPage extends StatefulWidget {
  // 定义一个有状态的组件类，MuyuPage
  // ignore: use_super_parameters
  const MuyuPage({Key? key})
      : super(key: key); // 使用 const 构造函数来创建不可变对象，允许传递可选的 Key 参数

  @override // 重写基类方法
  State<MuyuPage> createState() => _MuyuPageState(); // 返回该组件对应的状态类实例
}

class _MuyuPageState extends State<MuyuPage> {
  // 定义一个私有的状态类_MuyuPageState，继承自State<MuyuPage>
  @override // 重写基类方法
  Widget build(BuildContext context) {
    // build 方法是 Flutter 中最常用的方法之一，用于描述界面结构
    return Scaffold(
      // Scaffold 是 Material Design 布局结构的基础组件，提供了默认的导航栏、标题和包含主屏的body属性
      appBar: AppBar(
        // 定义一个 AppBar（应用程序栏），通常放在屏幕顶部
        elevation: 0, // 移除 AppBar 下的阴影
        backgroundColor: Colors.white, // 设置背景颜色为白色
        titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold), // 设置标题文字样式
        iconTheme: const IconThemeData(color: Colors.black), // 设置图标主题颜色为黑色
        title: const Text("电子木鱼"), // 设置 AppBar 的标题文本
        actions: [
          // 在 AppBar 右侧定义一系列操作按钮
          IconButton(
              // IconButton 组件用于显示一个可点击的图标
              onPressed: _toHistory, // 当按钮被点击时，执行 _toHistory 函数
              icon: const Icon(Icons.history) // 使用 history 图标
              )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildTopContent()),
          // Expanded(child: _buildImage())
        ],
      ),
    );
  }

  void _toHistory() {} // 一个空的回调函数，之后可以在这里添加导航到历史记录页面的逻辑
}

Widget _buildTopContent() {
  final ButtonStyle style = ElevatedButton.styleFrom(
    minimumSize: const Size(36, 36),
    padding: EdgeInsets.zero,
    backgroundColor: Colors.green,
    elevation: 0,
  );
  return Stack(
    children: [
      const Center(
        child: Text(
          "功德数: 0",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Positioned(
        right: 10,
        top: 10,
        child: ElevatedButton(
          onPressed: () {},
          style: style,
          child: const Icon(Icons.add),
        ),
      ),
    ],
  );
}
