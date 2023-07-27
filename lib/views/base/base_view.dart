// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.builder,
    this.onModelReady,
  });
  final Function(T)? onModelReady;
  final Widget Function(BuildContext, T, Widget?) builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  late T model;
  @override
  void initState() {
    model = Provider.of<T>(context, listen: false);
    widget.onModelReady?.call(model);
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
