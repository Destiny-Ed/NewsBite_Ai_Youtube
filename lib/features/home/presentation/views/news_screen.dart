import 'package:flutter/material.dart';
import 'package:news_bite_ai/core/enums.dart';
import 'package:news_bite_ai/features/home/presentation/providers/news_provider.dart';
import 'package:news_bite_ai/features/home/presentation/views/news_analysis_screen.dart';
import 'package:news_bite_ai/features/home/presentation/widgets/news_card.dart';
import 'package:news_bite_ai/shared/styles/colors.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  _fetchNews() {
    context.read<NewsProvider>().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trending New"), centerTitle: false),

      body: Consumer<NewsProvider>(
        builder: (context, newsState, child) {
          if (newsState.newsViewState == ViewState.busy) {
            return Center(child: CircularProgressIndicator());
          }
          if ((newsState.allNews.results ?? []).isEmpty || newsState.newsViewState == ViewState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 60, color: Colors.red),
                  SizedBox(height: 10),
                  Text(
                    "Oops! Error Fetching Trending News.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Please check your connection and try again.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _fetchNews,
                    icon: Icon(Icons.refresh),
                    label: Text("Retry"),
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: (newsState.allNews.results ?? []).length,
              itemBuilder: (context, index) {
                final data = (newsState.allNews.results ?? [])[index];
                return NewsCard(
                  newsData: data,
                  onViewAnalysis: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsAnalysisScreen(newsData: data)),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
