import 'package:flutter/material.dart';

final class DialogKey {
  static const _prefix = 'dialog';

  static const error = Key('${_prefix}_error');
  static const cancel = Key('${_prefix}_cancel_button');
  static const ok = Key('${_prefix}_e_ok_button');
}
