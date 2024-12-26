// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SvgModel {
  String get text => throw _privateConstructorUsedError;
  SvgCanvasPainter? get painter => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  /// Create a copy of SvgModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SvgModelCopyWith<SvgModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SvgModelCopyWith<$Res> {
  factory $SvgModelCopyWith(SvgModel value, $Res Function(SvgModel) then) =
      _$SvgModelCopyWithImpl<$Res, SvgModel>;
  @useResult
  $Res call({String text, SvgCanvasPainter? painter, bool completed});
}

/// @nodoc
class _$SvgModelCopyWithImpl<$Res, $Val extends SvgModel>
    implements $SvgModelCopyWith<$Res> {
  _$SvgModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SvgModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? painter = freezed,
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      painter: freezed == painter
          ? _value.painter
          : painter // ignore: cast_nullable_to_non_nullable
              as SvgCanvasPainter?,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SvgModelImplCopyWith<$Res>
    implements $SvgModelCopyWith<$Res> {
  factory _$$SvgModelImplCopyWith(
          _$SvgModelImpl value, $Res Function(_$SvgModelImpl) then) =
      __$$SvgModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, SvgCanvasPainter? painter, bool completed});
}

/// @nodoc
class __$$SvgModelImplCopyWithImpl<$Res>
    extends _$SvgModelCopyWithImpl<$Res, _$SvgModelImpl>
    implements _$$SvgModelImplCopyWith<$Res> {
  __$$SvgModelImplCopyWithImpl(
      _$SvgModelImpl _value, $Res Function(_$SvgModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SvgModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? painter = freezed,
    Object? completed = null,
  }) {
    return _then(_$SvgModelImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      painter: freezed == painter
          ? _value.painter
          : painter // ignore: cast_nullable_to_non_nullable
              as SvgCanvasPainter?,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SvgModelImpl with DiagnosticableTreeMixin implements _SvgModel {
  _$SvgModelImpl({required this.text, this.painter, this.completed = false});

  @override
  final String text;
  @override
  final SvgCanvasPainter? painter;
  @override
  @JsonKey()
  final bool completed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SvgModel(text: $text, painter: $painter, completed: $completed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SvgModel'))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('painter', painter))
      ..add(DiagnosticsProperty('completed', completed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SvgModelImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.painter, painter) || other.painter == painter) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, painter, completed);

  /// Create a copy of SvgModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SvgModelImplCopyWith<_$SvgModelImpl> get copyWith =>
      __$$SvgModelImplCopyWithImpl<_$SvgModelImpl>(this, _$identity);
}

abstract class _SvgModel implements SvgModel {
  factory _SvgModel(
      {required final String text,
      final SvgCanvasPainter? painter,
      final bool completed}) = _$SvgModelImpl;

  @override
  String get text;
  @override
  SvgCanvasPainter? get painter;
  @override
  bool get completed;

  /// Create a copy of SvgModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SvgModelImplCopyWith<_$SvgModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
