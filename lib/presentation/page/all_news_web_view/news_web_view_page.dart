import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/custom_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewPage extends ConsumerStatefulWidget {
  final String url;
  const NewsWebViewPage(this.url, {super.key});

  @override
  ConsumerState<NewsWebViewPage> createState() => _NewsWebViewPageState();
}

class _NewsWebViewPageState extends ConsumerState<NewsWebViewPage> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
