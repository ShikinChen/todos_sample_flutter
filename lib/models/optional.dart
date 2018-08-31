import 'dart:collection';

class Optional<T> extends IterableBase<T> {
  final T _value;

  const Optional.absent() : _value = null;

  Optional.of(T value) : this._value = value {
    if (this._value == null) throw ArgumentError('Must not be null.');
  }

  const Optional.fromNullable(T value) : this._value = value;

  bool get isPresent => _value != null;

  bool get isNotPresent => _value == null;

  T get value => this._value == null
      ? throw StateError('value called on absent Optional.')
      : _value;

  void ifPresent(void ifPresent(T value)) {
    if (isPresent) {
      ifPresent(_value);
    }
  }

  void ifAbset(void ifAbset()) {
    if (!isPresent) {
      ifAbset();
    }
  }

  T or(T defaultValue) {
    if (defaultValue == null) {
      throw ArgumentError('defaultValue must not be null.');
    }
    return _value == null ? defaultValue : _value;
  }

  T get orNull => _value;

  Optional<S> transform<S>(S transformer(T value)) =>
      _value == null ? Optional.absent() : Optional.of(transformer(_value));

  @override
  Iterator<T> get iterator =>
      isPresent ? <T>[_value].iterator : Iterable<T>.empty().iterator;

  int get hashCode => _value.hashCode;

  bool operator ==(o) => o is Optional && o._value == _value;

  @override
  String toString() {
    return _value == null ? 'Optional{ absent }' : 'Optional{_value: $_value}';
  }
}
