// Drop-down klass & filter klass för filtrering

class DropDown {
  static const String all = 'all';
  static const String done = 'done';
  static const String undone = 'undone';

  static const List<String> choices = <String>[
    all,
    done,
    undone,
    
  ];
}

class Filter {
  static String show = 'all';
}