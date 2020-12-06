import 'package:get_it/get_it.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<NoticemeProvider>(NoticemeProvider());
}
