import 'package:flutter/material.dart';
import 'package:news_bite_ai/core/enums.dart';
import 'package:news_bite_ai/features/home/data/models/news_data_model.dart';
import 'package:news_bite_ai/features/home/presentation/providers/news_provider.dart';
import 'package:news_bite_ai/features/home/presentation/views/content_summary_screen.dart';
import 'package:news_bite_ai/features/home/presentation/widgets/news_analysis_screen.dart';
import 'package:news_bite_ai/shared/styles/colors.dart';
import 'package:provider/provider.dart';

class NewsAnalysisScreen extends StatefulWidget {
  final Result newsData;
  const NewsAnalysisScreen({super.key, required this.newsData});

  @override
  State<NewsAnalysisScreen> createState() => _NewsAnalysisScreenState();
}

class _NewsAnalysisScreenState extends State<NewsAnalysisScreen> {
  @override
  void initState() {
    super.initState();
    _fetchAnalysis();
  }

  _fetchAnalysis() {
    context.read<NewsProvider>().generateAnalysis(widget.newsData.description ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Analysis")),
      body: Consumer<NewsProvider>(
        builder: (context, newsState, child) {
          if (newsState.newsAnalysisState == ViewState.busy) {
            return Center(child: CircularProgressIndicator());
          }
          if ((newsState.analysis).isEmpty || newsState.newsAnalysisState == ViewState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 60, color: Colors.red),
                  SizedBox(height: 10),
                  Text(
                    "Oops! Error generating AI analysis.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Please check your connection and try again.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _fetchAnalysis,
                    icon: Icon(Icons.refresh),
                    label: Text("Retry"),
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(widget.newsData.title ?? "", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

                  const SizedBox(height: 8),

                  buildSection("AI Summary", newsState.analysis),

                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContentCreationScreen(analysis: newsState.analysis)),
                        );
                      },
                      label: Text("Generate Content"),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                    ),
                  ),
                  Divider(),
                  Center(child: Text("AI can make mistakes. Verify all information.", textAlign: TextAlign.center)),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
