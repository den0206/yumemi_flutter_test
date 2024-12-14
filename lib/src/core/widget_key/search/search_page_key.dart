import 'package:flutter/material.dart';

final class SearchPageKey {
  static const _prefix = 'search_page';

  static const searchTextField = Key('${_prefix}_search_text_field');
  static const queryHistory = Key('${_prefix}_query_history');
}
