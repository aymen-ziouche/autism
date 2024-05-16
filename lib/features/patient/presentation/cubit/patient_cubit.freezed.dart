// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PatientState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addPatientloading,
    required TResult Function() patientloading,
    required TResult Function() addpatientloaded,
    required TResult Function() patientloaded,
    required TResult Function(String detectedEmotion) emotionDetected,
    required TResult Function(String errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addPatientloading,
    TResult? Function()? patientloading,
    TResult? Function()? addpatientloaded,
    TResult? Function()? patientloaded,
    TResult? Function(String detectedEmotion)? emotionDetected,
    TResult? Function(String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addPatientloading,
    TResult Function()? patientloading,
    TResult Function()? addpatientloaded,
    TResult Function()? patientloaded,
    TResult Function(String detectedEmotion)? emotionDetected,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddPatientLoading value) addPatientloading,
    required TResult Function(_PatientLoading value) patientloading,
    required TResult Function(_AddPatientLoaded value) addpatientloaded,
    required TResult Function(_PatientLoaded value) patientloaded,
    required TResult Function(_EmotionDetected value) emotionDetected,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddPatientLoading value)? addPatientloading,
    TResult? Function(_PatientLoading value)? patientloading,
    TResult? Function(_AddPatientLoaded value)? addpatientloaded,
    TResult? Function(_PatientLoaded value)? patientloaded,
    TResult? Function(_EmotionDetected value)? emotionDetected,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddPatientLoading value)? addPatientloading,
    TResult Function(_PatientLoading value)? patientloading,
    TResult Function(_AddPatientLoaded value)? addpatientloaded,
    TResult Function(_PatientLoaded value)? patientloaded,
    TResult Function(_EmotionDetected value)? emotionDetected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientStateCopyWith<$Res> {
  factory $PatientStateCopyWith(
          PatientState value, $Res Function(PatientState) then) =
      _$PatientStateCopyWithImpl<$Res, PatientState>;
}

/// @nodoc
class _$PatientStateCopyWithImpl<$Res, $Val extends PatientState>
    implements $PatientStateCopyWith<$Res> {
  _$PatientStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PatientStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PatientState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addPatientloading,
    required TResult Function() patientloading,
    required TResult Function() addpatientloaded,
    required TResult Function() patientloaded,
    required TResult Function(String detectedEmotion) emotionDetected,
    required TResult Function(String errorMessage) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addPatientloading,
    TResult? Function()? patientloading,
    TResult? Function()? addpatientloaded,
    TResult? Function()? patientloaded,
    TResult? Function(String detectedEmotion)? emotionDetected,
    TResult? Function(String errorMessage)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addPatientloading,
    TResult Function()? patientloading,
    TResult Function()? addpatientloaded,
    TResult Function()? patientloaded,
    TResult Function(String detectedEmotion)? emotionDetected,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddPatientLoading value) addPatientloading,
    required TResult Function(_PatientLoading value) patientloading,
    required TResult Function(_AddPatientLoaded value) addpatientloaded,
    required TResult Function(_PatientLoaded value) patientloaded,
    required TResult Function(_EmotionDetected value) emotionDetected,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddPatientLoading value)? addPatientloading,
    TResult? Function(_PatientLoading value)? patientloading,
    TResult? Function(_AddPatientLoaded value)? addpatientloaded,
    TResult? Function(_PatientLoaded value)? patientloaded,
    TResult? Function(_EmotionDetected value)? emotionDetected,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddPatientLoading value)? addPatientloading,
    TResult Function(_PatientLoading value)? patientloading,
    TResult Function(_AddPatientLoaded value)? addpatientloaded,
    TResult Function(_PatientLoaded value)? patientloaded,
    TResult Function(_EmotionDetected value)? emotionDetected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PatientState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddPatientLoadingImplCopyWith<$Res> {
  factory _$$AddPatientLoadingImplCopyWith(_$AddPatientLoadingImpl value,
          $Res Function(_$AddPatientLoadingImpl) then) =
      __$$AddPatientLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddPatientLoadingImplCopyWithImpl<$Res>
    extends _$PatientStateCopyWithImpl<$Res, _$AddPatientLoadingImpl>
    implements _$$AddPatientLoadingImplCopyWith<$Res> {
  __$$AddPatientLoadingImplCopyWithImpl(_$AddPatientLoadingImpl _value,
      $Res Function(_$AddPatientLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddPatientLoadingImpl implements _AddPatientLoading {
  const _$AddPatientLoadingImpl();

  @override
  String toString() {
    return 'PatientState.addPatientloading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddPatientLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addPatientloading,
    required TResult Function() patientloading,
    required TResult Function() addpatientloaded,
    required TResult Function() patientloaded,
    required TResult Function(String detectedEmotion) emotionDetected,
    required TResult Function(String errorMessage) error,
  }) {
    return addPatientloading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addPatientloading,
    TResult? Function()? patientloading,
    TResult? Function()? addpatientloaded,
    TResult? Function()? patientloaded,
    TResult? Function(String detectedEmotion)? emotionDetected,
    TResult? Function(String errorMessage)? error,
  }) {
    return addPatientloading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addPatientloading,
    TResult Function()? patientloading,
    TResult Function()? addpatientloaded,
    TResult Function()? patientloaded,
    TResult Function(String detectedEmotion)? emotionDetected,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (addPatientloading != null) {
      return addPatientloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddPatientLoading value) addPatientloading,
    required TResult Function(_PatientLoading value) patientloading,
    required TResult Function(_AddPatientLoaded value) addpatientloaded,
    required TResult Function(_PatientLoaded value) patientloaded,
    required TResult Function(_EmotionDetected value) emotionDetected,
    required TResult Function(_Error value) error,
  }) {
    return addPatientloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddPatientLoading value)? addPatientloading,
    TResult? Function(_PatientLoading value)? patientloading,
    TResult? Function(_AddPatientLoaded value)? addpatientloaded,
    TResult? Function(_PatientLoaded value)? patientloaded,
    TResult? Function(_EmotionDetected value)? emotionDetected,
    TResult? Function(_Error value)? error,
  }) {
    return addPatientloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddPatientLoading value)? addPatientloading,
    TResult Function(_PatientLoading value)? patientloading,
    TResult Function(_AddPatientLoaded value)? addpatientloaded,
    TResult Function(_PatientLoaded value)? patientloaded,
    TResult Function(_EmotionDetected value)? emotionDetected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (addPatientloading != null) {
      return addPatientloading(this);
    }
    return orElse();
  }
}

abstract class _AddPatientLoading implements PatientState {
  const factory _AddPatientLoading() = _$AddPatientLoadingImpl;
}

/// @nodoc
abstract class _$$PatientLoadingImplCopyWith<$Res> {
  factory _$$PatientLoadingImplCopyWith(_$PatientLoadingImpl value,
          $Res Function(_$PatientLoadingImpl) then) =
      __$$PatientLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PatientLoadingImplCopyWithImpl<$Res>
    extends _$PatientStateCopyWithImpl<$Res, _$PatientLoadingImpl>
    implements _$$PatientLoadingImplCopyWith<$Res> {
  __$$PatientLoadingImplCopyWithImpl(
      _$PatientLoadingImpl _value, $Res Function(_$PatientLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PatientLoadingImpl implements _PatientLoading {
  const _$PatientLoadingImpl();

  @override
  String toString() {
    return 'PatientState.patientloading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PatientLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addPatientloading,
    required TResult Function() patientloading,
    required TResult Function() addpatientloaded,
    required TResult Function() patientloaded,
    required TResult Function(String detectedEmotion) emotionDetected,
    required TResult Function(String errorMessage) error,
  }) {
    return patientloading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addPatientloading,
    TResult? Function()? patientloading,
    TResult? Function()? addpatientloaded,
    TResult? Function()? patientloaded,
    TResult? Function(String detectedEmotion)? emotionDetected,
    TResult? Function(String errorMessage)? error,
  }) {
    return patientloading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addPatientloading,
    TResult Function()? patientloading,
    TResult Function()? addpatientloaded,
    TResult Function()? patientloaded,
    TResult Function(String detectedEmotion)? emotionDetected,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (patientloading != null) {
      return patientloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddPatientLoading value) addPatientloading,
    required TResult Function(_PatientLoading value) patientloading,
    required TResult Function(_AddPatientLoaded value) addpatientloaded,
    required TResult Function(_PatientLoaded value) patientloaded,
    required TResult Function(_EmotionDetected value) emotionDetected,
    required TResult Function(_Error value) error,
  }) {
    return patientloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddPatientLoading value)? addPatientloading,
    TResult? Function(_PatientLoading value)? patientloading,
    TResult? Function(_AddPatientLoaded value)? addpatientloaded,
    TResult? Function(_PatientLoaded value)? patientloaded,
    TResult? Function(_EmotionDetected value)? emotionDetected,
    TResult? Function(_Error value)? error,
  }) {
    return patientloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddPatientLoading value)? addPatientloading,
    TResult Function(_PatientLoading value)? patientloading,
    TResult Function(_AddPatientLoaded value)? addpatientloaded,
    TResult Function(_PatientLoaded value)? patientloaded,
    TResult Function(_EmotionDetected value)? emotionDetected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (patientloading != null) {
      return patientloading(this);
    }
    return orElse();
  }
}

abstract class _PatientLoading implements PatientState {
  const factory _PatientLoading() = _$PatientLoadingImpl;
}

/// @nodoc
abstract class _$$AddPatientLoadedImplCopyWith<$Res> {
  factory _$$AddPatientLoadedImplCopyWith(_$AddPatientLoadedImpl value,
          $Res Function(_$AddPatientLoadedImpl) then) =
      __$$AddPatientLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddPatientLoadedImplCopyWithImpl<$Res>
    extends _$PatientStateCopyWithImpl<$Res, _$AddPatientLoadedImpl>
    implements _$$AddPatientLoadedImplCopyWith<$Res> {
  __$$AddPatientLoadedImplCopyWithImpl(_$AddPatientLoadedImpl _value,
      $Res Function(_$AddPatientLoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddPatientLoadedImpl implements _AddPatientLoaded {
  const _$AddPatientLoadedImpl();

  @override
  String toString() {
    return 'PatientState.addpatientloaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddPatientLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addPatientloading,
    required TResult Function() patientloading,
    required TResult Function() addpatientloaded,
    required TResult Function() patientloaded,
    required TResult Function(String detectedEmotion) emotionDetected,
    required TResult Function(String errorMessage) error,
  }) {
    return addpatientloaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addPatientloading,
    TResult? Function()? patientloading,
    TResult? Function()? addpatientloaded,
    TResult? Function()? patientloaded,
    TResult? Function(String detectedEmotion)? emotionDetected,
    TResult? Function(String errorMessage)? error,
  }) {
    return addpatientloaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addPatientloading,
    TResult Function()? patientloading,
    TResult Function()? addpatientloaded,
    TResult Function()? patientloaded,
    TResult Function(String detectedEmotion)? emotionDetected,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (addpatientloaded != null) {
      return addpatientloaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddPatientLoading value) addPatientloading,
    required TResult Function(_PatientLoading value) patientloading,
    required TResult Function(_AddPatientLoaded value) addpatientloaded,
    required TResult Function(_PatientLoaded value) patientloaded,
    required TResult Function(_EmotionDetected value) emotionDetected,
    required TResult Function(_Error value) error,
  }) {
    return addpatientloaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddPatientLoading value)? addPatientloading,
    TResult? Function(_PatientLoading value)? patientloading,
    TResult? Function(_AddPatientLoaded value)? addpatientloaded,
    TResult? Function(_PatientLoaded value)? patientloaded,
    TResult? Function(_EmotionDetected value)? emotionDetected,
    TResult? Function(_Error value)? error,
  }) {
    return addpatientloaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddPatientLoading value)? addPatientloading,
    TResult Function(_PatientLoading value)? patientloading,
    TResult Function(_AddPatientLoaded value)? addpatientloaded,
    TResult Function(_PatientLoaded value)? patientloaded,
    TResult Function(_EmotionDetected value)? emotionDetected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (addpatientloaded != null) {
      return addpatientloaded(this);
    }
    return orElse();
  }
}

abstract class _AddPatientLoaded implements PatientState {
  const factory _AddPatientLoaded() = _$AddPatientLoadedImpl;
}

/// @nodoc
abstract class _$$PatientLoadedImplCopyWith<$Res> {
  factory _$$PatientLoadedImplCopyWith(
          _$PatientLoadedImpl value, $Res Function(_$PatientLoadedImpl) then) =
      __$$PatientLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PatientLoadedImplCopyWithImpl<$Res>
    extends _$PatientStateCopyWithImpl<$Res, _$PatientLoadedImpl>
    implements _$$PatientLoadedImplCopyWith<$Res> {
  __$$PatientLoadedImplCopyWithImpl(
      _$PatientLoadedImpl _value, $Res Function(_$PatientLoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PatientLoadedImpl implements _PatientLoaded {
  const _$PatientLoadedImpl();

  @override
  String toString() {
    return 'PatientState.patientloaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PatientLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addPatientloading,
    required TResult Function() patientloading,
    required TResult Function() addpatientloaded,
    required TResult Function() patientloaded,
    required TResult Function(String detectedEmotion) emotionDetected,
    required TResult Function(String errorMessage) error,
  }) {
    return patientloaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addPatientloading,
    TResult? Function()? patientloading,
    TResult? Function()? addpatientloaded,
    TResult? Function()? patientloaded,
    TResult? Function(String detectedEmotion)? emotionDetected,
    TResult? Function(String errorMessage)? error,
  }) {
    return patientloaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addPatientloading,
    TResult Function()? patientloading,
    TResult Function()? addpatientloaded,
    TResult Function()? patientloaded,
    TResult Function(String detectedEmotion)? emotionDetected,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (patientloaded != null) {
      return patientloaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddPatientLoading value) addPatientloading,
    required TResult Function(_PatientLoading value) patientloading,
    required TResult Function(_AddPatientLoaded value) addpatientloaded,
    required TResult Function(_PatientLoaded value) patientloaded,
    required TResult Function(_EmotionDetected value) emotionDetected,
    required TResult Function(_Error value) error,
  }) {
    return patientloaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddPatientLoading value)? addPatientloading,
    TResult? Function(_PatientLoading value)? patientloading,
    TResult? Function(_AddPatientLoaded value)? addpatientloaded,
    TResult? Function(_PatientLoaded value)? patientloaded,
    TResult? Function(_EmotionDetected value)? emotionDetected,
    TResult? Function(_Error value)? error,
  }) {
    return patientloaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddPatientLoading value)? addPatientloading,
    TResult Function(_PatientLoading value)? patientloading,
    TResult Function(_AddPatientLoaded value)? addpatientloaded,
    TResult Function(_PatientLoaded value)? patientloaded,
    TResult Function(_EmotionDetected value)? emotionDetected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (patientloaded != null) {
      return patientloaded(this);
    }
    return orElse();
  }
}

abstract class _PatientLoaded implements PatientState {
  const factory _PatientLoaded() = _$PatientLoadedImpl;
}

/// @nodoc
abstract class _$$EmotionDetectedImplCopyWith<$Res> {
  factory _$$EmotionDetectedImplCopyWith(_$EmotionDetectedImpl value,
          $Res Function(_$EmotionDetectedImpl) then) =
      __$$EmotionDetectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String detectedEmotion});
}

/// @nodoc
class __$$EmotionDetectedImplCopyWithImpl<$Res>
    extends _$PatientStateCopyWithImpl<$Res, _$EmotionDetectedImpl>
    implements _$$EmotionDetectedImplCopyWith<$Res> {
  __$$EmotionDetectedImplCopyWithImpl(
      _$EmotionDetectedImpl _value, $Res Function(_$EmotionDetectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detectedEmotion = null,
  }) {
    return _then(_$EmotionDetectedImpl(
      null == detectedEmotion
          ? _value.detectedEmotion
          : detectedEmotion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmotionDetectedImpl implements _EmotionDetected {
  const _$EmotionDetectedImpl(this.detectedEmotion);

  @override
  final String detectedEmotion;

  @override
  String toString() {
    return 'PatientState.emotionDetected(detectedEmotion: $detectedEmotion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionDetectedImpl &&
            (identical(other.detectedEmotion, detectedEmotion) ||
                other.detectedEmotion == detectedEmotion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detectedEmotion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionDetectedImplCopyWith<_$EmotionDetectedImpl> get copyWith =>
      __$$EmotionDetectedImplCopyWithImpl<_$EmotionDetectedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addPatientloading,
    required TResult Function() patientloading,
    required TResult Function() addpatientloaded,
    required TResult Function() patientloaded,
    required TResult Function(String detectedEmotion) emotionDetected,
    required TResult Function(String errorMessage) error,
  }) {
    return emotionDetected(detectedEmotion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addPatientloading,
    TResult? Function()? patientloading,
    TResult? Function()? addpatientloaded,
    TResult? Function()? patientloaded,
    TResult? Function(String detectedEmotion)? emotionDetected,
    TResult? Function(String errorMessage)? error,
  }) {
    return emotionDetected?.call(detectedEmotion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addPatientloading,
    TResult Function()? patientloading,
    TResult Function()? addpatientloaded,
    TResult Function()? patientloaded,
    TResult Function(String detectedEmotion)? emotionDetected,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (emotionDetected != null) {
      return emotionDetected(detectedEmotion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddPatientLoading value) addPatientloading,
    required TResult Function(_PatientLoading value) patientloading,
    required TResult Function(_AddPatientLoaded value) addpatientloaded,
    required TResult Function(_PatientLoaded value) patientloaded,
    required TResult Function(_EmotionDetected value) emotionDetected,
    required TResult Function(_Error value) error,
  }) {
    return emotionDetected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddPatientLoading value)? addPatientloading,
    TResult? Function(_PatientLoading value)? patientloading,
    TResult? Function(_AddPatientLoaded value)? addpatientloaded,
    TResult? Function(_PatientLoaded value)? patientloaded,
    TResult? Function(_EmotionDetected value)? emotionDetected,
    TResult? Function(_Error value)? error,
  }) {
    return emotionDetected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddPatientLoading value)? addPatientloading,
    TResult Function(_PatientLoading value)? patientloading,
    TResult Function(_AddPatientLoaded value)? addpatientloaded,
    TResult Function(_PatientLoaded value)? patientloaded,
    TResult Function(_EmotionDetected value)? emotionDetected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (emotionDetected != null) {
      return emotionDetected(this);
    }
    return orElse();
  }
}

abstract class _EmotionDetected implements PatientState {
  const factory _EmotionDetected(final String detectedEmotion) =
      _$EmotionDetectedImpl;

  String get detectedEmotion;
  @JsonKey(ignore: true)
  _$$EmotionDetectedImplCopyWith<_$EmotionDetectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PatientStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$ErrorImpl(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'PatientState.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addPatientloading,
    required TResult Function() patientloading,
    required TResult Function() addpatientloaded,
    required TResult Function() patientloaded,
    required TResult Function(String detectedEmotion) emotionDetected,
    required TResult Function(String errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addPatientloading,
    TResult? Function()? patientloading,
    TResult? Function()? addpatientloaded,
    TResult? Function()? patientloaded,
    TResult? Function(String detectedEmotion)? emotionDetected,
    TResult? Function(String errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addPatientloading,
    TResult Function()? patientloading,
    TResult Function()? addpatientloaded,
    TResult Function()? patientloaded,
    TResult Function(String detectedEmotion)? emotionDetected,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddPatientLoading value) addPatientloading,
    required TResult Function(_PatientLoading value) patientloading,
    required TResult Function(_AddPatientLoaded value) addpatientloaded,
    required TResult Function(_PatientLoaded value) patientloaded,
    required TResult Function(_EmotionDetected value) emotionDetected,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddPatientLoading value)? addPatientloading,
    TResult? Function(_PatientLoading value)? patientloading,
    TResult? Function(_AddPatientLoaded value)? addpatientloaded,
    TResult? Function(_PatientLoaded value)? patientloaded,
    TResult? Function(_EmotionDetected value)? emotionDetected,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddPatientLoading value)? addPatientloading,
    TResult Function(_PatientLoading value)? patientloading,
    TResult Function(_AddPatientLoaded value)? addpatientloaded,
    TResult Function(_PatientLoaded value)? patientloaded,
    TResult Function(_EmotionDetected value)? emotionDetected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PatientState {
  const factory _Error(final String errorMessage) = _$ErrorImpl;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
