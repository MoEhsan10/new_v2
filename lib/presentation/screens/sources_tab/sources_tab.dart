import 'package:flutter/material.dart';
import 'package:news_v2/presentation/screens/news/news_list.dart';
import 'package:news_v2/presentation/screens/sources_tab/tab_item.dart';

import '../../../data/api/reponses/source/Source.dart';


class SourcesTab extends StatefulWidget {
 const SourcesTab({super.key, required this.sources});

 final List<Source> sources;

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedTabIndex =0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index) {
                selectedTabIndex = index;
                setState(() {});
              },
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                tabs: widget.sources.map((source) =>
                    TabItem(
                      sourceName: source.name ?? '',
                      isSelected: widget.sources.indexOf(source) == selectedTabIndex,
                    )
                ).toList())),
         Expanded(child: NewsList( sourceId: widget.sources[selectedTabIndex].id!)),
      ],
    );
  }
}
