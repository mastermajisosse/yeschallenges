import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:yeschallenges/service/read_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (_) => ReadData(),
  ),
];
