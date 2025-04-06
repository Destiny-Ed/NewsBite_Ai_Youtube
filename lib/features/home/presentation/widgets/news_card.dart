import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_bite_ai/features/home/data/models/news_data_model.dart';
import 'package:news_bite_ai/shared/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final Result newsData;
  final VoidCallback onViewAnalysis;
  const NewsCard({super.key, required this.newsData, required this.onViewAnalysis});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: newsData.imageUrl ?? "",
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
              errorWidget: (context, error, stackTrace) => Container(height: 180, color: Colors.grey[300]),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: CachedNetworkImageProvider(newsData.sourceIcon ?? ""),
                        ),

                        Text(
                          newsData.sourceName ?? "",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blueAccent),
                        ),
                      ],
                    ),

                    Text(
                      DateFormat.MMMEd().format(newsData.pubDate ?? DateTime.now()),
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                // News Title
                Text(
                  newsData.title ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6),
                Text(
                  newsData.description ?? "",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _openNewsUrl(context, newsData.sourceUrl ?? ""),

                      label: Text("Read Online"),
                      icon: Icon(Icons.open_in_browser),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                    ),

                    TextButton(
                      onPressed: onViewAnalysis,
                      child: Text("View AI Analysis", style: TextStyle(color: Colors.redAccent)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _openNewsUrl(BuildContext context, String url) async {
  if (url.isEmpty) return;
  // Use url_launcher to open the URL
  if (!await launchUrl(Uri.parse(url)) && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not launch $url')));
  }
}
