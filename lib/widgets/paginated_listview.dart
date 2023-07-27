import 'package:flutter/material.dart';

class PaginatedListView<T> extends StatefulWidget {
  final Widget? Function(BuildContext, int) itemBuilder;
  final Function onPageChanged;
  final int itemCount;
  final bool complete;

  const PaginatedListView({
    super.key,
    required this.itemBuilder,
    required this.onPageChanged,
    required this.itemCount,
    required this.complete,
  });

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  final _listScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _listScrollController.addListener(() {
      if (_listScrollController.position.pixels ==
          _listScrollController.position.maxScrollExtent) {
        widget.onPageChanged();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalItems = widget.itemCount;
    if (!widget.complete) {
      totalItems++;
    }
    return ListView.builder(
      controller: _listScrollController,
      itemBuilder: (context, index) {
        if (index == widget.itemCount && !widget.complete) {
          return const Padding(
            padding: EdgeInsets.all(8),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return widget.itemBuilder(context, index);
      },
      itemCount: totalItems,
    );
  }

  // Widget _buildCartItemCard(CartItem cartItem) {
  //   return ListTile(
  //     leading: Text(cartItem.id.toString()),
  //     title: Text(cartItem.products.length.toString()),
  //   );
  // }
}
