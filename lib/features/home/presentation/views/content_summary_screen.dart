import 'package:flutter/material.dart';
import 'package:news_bite_ai/core/enums.dart';
import 'package:news_bite_ai/features/home/presentation/providers/news_provider.dart';
import 'package:news_bite_ai/features/home/presentation/views/video_preview_screen.dart';
import 'package:news_bite_ai/shared/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ContentCreationScreen extends StatelessWidget {
  final String analysis;

  const ContentCreationScreen({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Content Creation')),

      body: Consumer<NewsProvider>(
        builder: (context, newsState, child) {
          if (newsState.newsContentState == ViewState.busy) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: EdgeInsets.all(16),

            children: [
              ExpansionTile(
                tilePadding: const EdgeInsets.all(0),
                initiallyExpanded: true,
                maintainState: true,
                title: Text("Social", style: TextStyle(fontWeight: FontWeight.bold)),
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text("Social Media Content"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            newsState.generateSocialMediaPost(analysis);
                          },
                          child: Text("Generate"),
                        ),

                        if (newsState.socialMediaPost.isNotEmpty)
                          IconButton(
                            onPressed: () {
                              Share.share(newsState.socialMediaPost);
                            },
                            icon: Icon(Icons.share),
                          ),
                      ],
                    ),
                  ),

                  Text(newsState.socialMediaPost),

                  SizedBox(height: 10),
                ],
              ),

              SizedBox(height: 20),

              ExpansionTile(
                tilePadding: const EdgeInsets.all(0),
                initiallyExpanded: true,
                maintainState: true,
                title: Text("Video Script", style: TextStyle(fontWeight: FontWeight.bold)),
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text("Generated Video Script"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            newsState.generateVideoScript(analysis);
                          },
                          child: Text("Generate"),
                        ),

                        if (newsState.generatedVideoScript.isNotEmpty)
                          IconButton(
                            onPressed: () {
                              Share.share(newsState.generatedVideoScript);
                            },
                            icon: Icon(Icons.share),
                          ),
                      ],
                    ),
                  ),

                  Text(newsState.generatedVideoScript),

                  SizedBox(height: 10),
                  if (newsState.generatedVideoScript.isNotEmpty)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPreviewScreen(videoScript: newsState.generatedVideoScript),
                            ),
                          );
                        },
                        label: Text("Generate AI Video From Script"),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                      ),
                    ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
