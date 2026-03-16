import 'package:supabase_flutter/supabase_flutter.dart';

class CloudItem {
  final FileObject file;
  final bool isSelected;

  CloudItem({required this.file, this.isSelected = false});

  // check if the Item is a folder
  bool get isFolder => file.metadata == null;

  int get size => file.metadata != null ? file.metadata!['size'] : 0;
}
