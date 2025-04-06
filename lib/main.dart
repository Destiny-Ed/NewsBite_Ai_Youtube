import 'package:flutter/material.dart';
import 'package:news_bite_ai/features/home/presentation/providers/news_provider.dart';
import 'package:news_bite_ai/features/home/presentation/views/dummy_view.dart';
import 'package:news_bite_ai/features/home/presentation/views/news_screen.dart';
import 'package:offline_first_support/offline_first.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OfflineFirst.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => NewsProvider())],
      child: MaterialApp(home: DummyView()),
    );
  }
}
