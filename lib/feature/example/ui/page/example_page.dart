
import 'package:base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/example_provider.dart';

class ExamplePage extends StatefulHookConsumerWidget {
  const ExamplePage({super.key});

  @override
  ConsumerState<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends ConsumerState<ExamplePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    Future(() {
      ref.read(exampleProvider.notifier).getNewsEverything();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.appName,
        ),
      ),
      body: SafeArea(
        child: ref.watch(exampleProvider).onState(
              notLoaded: () => const SizedBox(),
              loading: () => const Text('Loading'),
              noData: () => const Text('No Data'),
              failed: (error) => Text(error.toString()),
              fetched: (data) {
                return RefreshIndicator(
                  onRefresh: () async {
                    getData();
                  },
                  child: ListView.separated(
                    itemCount: data.articles.length,
                    padding: const EdgeInsets.all(16),
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.black12,
                      height: 24,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data.articles[index].urlToImage != null
                                  ? Image.network(
                                      data.articles[index].urlToImage ?? '',
                                      width: MediaQuery.sizeOf(context).width * 0.4,
                                      height: MediaQuery.sizeOf(context).width * 0.4,
                                      fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                                    )
                                  : const SizedBox.shrink(),
                              const Gap(16),
                              Expanded(
                                child: Text(
                                  data.articles[index].title,
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          const Gap(8),
                          Text(
                            data.articles[index].description ?? '',
                            style: const TextStyle(color: Colors.black45),
                          ),
                          const Gap(4),
                          Text(
                            data.articles[index].publishedAt.toString(),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
      ),
    );
  }
}
