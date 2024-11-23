// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lazy_list_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lazyListEventHash() => r'9e4e9d618a9b60c075eecd1bab08a57cddecafb6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LazyListEvent<T>
    extends BuildlessAutoDisposeNotifier<LazyListState<T>> {
  LazyListState<T> build();
}

/// See also [LazyListEvent].
@ProviderFor(LazyListEvent)
const lazyListEventProvider = LazyListEventFamily();

/// See also [LazyListEvent].
class LazyListEventFamily extends Family {
  /// See also [LazyListEvent].
  const LazyListEventFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lazyListEventProvider';

  /// See also [LazyListEvent].
  LazyListEventProvider<T> call<T>() {
    return LazyListEventProvider<T>();
  }

  @visibleForOverriding
  @override
  LazyListEventProvider<Object?> getProviderOverride(
    covariant LazyListEventProvider<Object?> provider,
  ) {
    return call();
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(LazyListEvent Function() create) {
    return _$LazyListEventFamilyOverride(this, create);
  }
}

class _$LazyListEventFamilyOverride implements FamilyOverride {
  _$LazyListEventFamilyOverride(this.overriddenFamily, this.create);

  final LazyListEvent Function() create;

  @override
  final LazyListEventFamily overriddenFamily;

  @override
  LazyListEventProvider getProviderOverride(
    covariant LazyListEventProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [LazyListEvent].
class LazyListEventProvider<T> extends AutoDisposeNotifierProviderImpl<
    LazyListEvent<T>, LazyListState<T>> {
  /// See also [LazyListEvent].
  LazyListEventProvider()
      : this._internal(
          LazyListEvent<T>.new,
          from: lazyListEventProvider,
          name: r'lazyListEventProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lazyListEventHash,
          dependencies: LazyListEventFamily._dependencies,
          allTransitiveDependencies:
              LazyListEventFamily._allTransitiveDependencies,
        );

  LazyListEventProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
  }) : super.internal();

  @override
  LazyListState<T> runNotifierBuild(
    covariant LazyListEvent<T> notifier,
  ) {
    return notifier.build();
  }

  @override
  Override overrideWith(LazyListEvent<T> Function() create) {
    return ProviderOverride(
      origin: this,
      override: LazyListEventProvider<T>._internal(
        () => create(),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
      ),
    );
  }

  @override
  () get argument {
    return ();
  }

  @override
  AutoDisposeNotifierProviderElement<LazyListEvent<T>, LazyListState<T>>
      createElement() {
    return _LazyListEventProviderElement(this);
  }

  LazyListEventProvider _copyWith(
    LazyListEvent Function() create,
  ) {
    return LazyListEventProvider._internal(
      () => create(),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LazyListEventProvider && other.runtimeType == runtimeType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, T.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LazyListEventRef<T> on AutoDisposeNotifierProviderRef<LazyListState<T>> {}

class _LazyListEventProviderElement<T>
    extends AutoDisposeNotifierProviderElement<LazyListEvent<T>,
        LazyListState<T>> with LazyListEventRef<T> {
  _LazyListEventProviderElement(super.provider);
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
