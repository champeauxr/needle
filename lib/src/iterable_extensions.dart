extension IterableExtension<E> on Iterable<E> {
  // Extension method to overcome null safety issue with firstWhere().
  E? firstOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }

    return null;
  }
}
