// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$helloWorldHash() => r'8bbe6cff2b7b1f4e1f7be3d1820da793259f7bfc';

/// See also [helloWorld].
@ProviderFor(helloWorld)
final helloWorldProvider = AutoDisposeProvider<String>.internal(
  helloWorld,
  name: r'helloWorldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$helloWorldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HelloWorldRef = AutoDisposeProviderRef<String>;
String _$svgModelStateHash() => r'b049933d21c771f28e60df7fd935b88927951736';

/// See also [SvgModelState].
@ProviderFor(SvgModelState)
final svgModelStateProvider =
    AutoDisposeAsyncNotifierProvider<SvgModelState, SvgModel>.internal(
  SvgModelState.new,
  name: r'svgModelStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$svgModelStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SvgModelState = AutoDisposeAsyncNotifier<SvgModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
