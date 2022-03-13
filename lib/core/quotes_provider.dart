import 'package:pertemuan_3/core/api.dart';
import 'package:pertemuan_3/services/http_provider.dart';
import 'package:riverpod/riverpod.dart';

final singleRandomQuotesProvider = FutureProvider<Quotes>((ref) async {
  final client = ref.watch(httpProvider);

  final response = await client.getRandomQuotes();

  return response;
});

final singleRandomQuotesProviderByTags =
    FutureProvider.autoDispose.family<Quotes, String>(
  (ref, tags) async {
    final client = ref.watch(httpProvider);

    final response = await client.getRandomQuotesByQuery(tags);

    return response;
  },
);
