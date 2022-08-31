import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

final ScrollController _scrollController = ScrollController();

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(children: const [Text('Teste')])));
  }
}
