// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hospital_vaccine_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HospitalVaccineHistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DateTime date) hospitalVaccineHistoryFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DateTime date)? hospitalVaccineHistoryFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DateTime date)? hospitalVaccineHistoryFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_hospitalVaccineHistoryFetched value)
        hospitalVaccineHistoryFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_hospitalVaccineHistoryFetched value)?
        hospitalVaccineHistoryFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_hospitalVaccineHistoryFetched value)?
        hospitalVaccineHistoryFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalVaccineHistoryEventCopyWith<$Res> {
  factory $HospitalVaccineHistoryEventCopyWith(
          HospitalVaccineHistoryEvent value,
          $Res Function(HospitalVaccineHistoryEvent) then) =
      _$HospitalVaccineHistoryEventCopyWithImpl<$Res,
          HospitalVaccineHistoryEvent>;
}

/// @nodoc
class _$HospitalVaccineHistoryEventCopyWithImpl<$Res,
        $Val extends HospitalVaccineHistoryEvent>
    implements $HospitalVaccineHistoryEventCopyWith<$Res> {
  _$HospitalVaccineHistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HospitalVaccineHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$HospitalVaccineHistoryEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of HospitalVaccineHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'HospitalVaccineHistoryEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DateTime date) hospitalVaccineHistoryFetched,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DateTime date)? hospitalVaccineHistoryFetched,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DateTime date)? hospitalVaccineHistoryFetched,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_hospitalVaccineHistoryFetched value)
        hospitalVaccineHistoryFetched,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_hospitalVaccineHistoryFetched value)?
        hospitalVaccineHistoryFetched,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_hospitalVaccineHistoryFetched value)?
        hospitalVaccineHistoryFetched,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HospitalVaccineHistoryEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$hospitalVaccineHistoryFetchedImplCopyWith<$Res> {
  factory _$$hospitalVaccineHistoryFetchedImplCopyWith(
          _$hospitalVaccineHistoryFetchedImpl value,
          $Res Function(_$hospitalVaccineHistoryFetchedImpl) then) =
      __$$hospitalVaccineHistoryFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$hospitalVaccineHistoryFetchedImplCopyWithImpl<$Res>
    extends _$HospitalVaccineHistoryEventCopyWithImpl<$Res,
        _$hospitalVaccineHistoryFetchedImpl>
    implements _$$hospitalVaccineHistoryFetchedImplCopyWith<$Res> {
  __$$hospitalVaccineHistoryFetchedImplCopyWithImpl(
      _$hospitalVaccineHistoryFetchedImpl _value,
      $Res Function(_$hospitalVaccineHistoryFetchedImpl) _then)
      : super(_value, _then);

  /// Create a copy of HospitalVaccineHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$hospitalVaccineHistoryFetchedImpl(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$hospitalVaccineHistoryFetchedImpl
    implements _hospitalVaccineHistoryFetched {
  const _$hospitalVaccineHistoryFetchedImpl(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'HospitalVaccineHistoryEvent.hospitalVaccineHistoryFetched(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$hospitalVaccineHistoryFetchedImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of HospitalVaccineHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$hospitalVaccineHistoryFetchedImplCopyWith<
          _$hospitalVaccineHistoryFetchedImpl>
      get copyWith => __$$hospitalVaccineHistoryFetchedImplCopyWithImpl<
          _$hospitalVaccineHistoryFetchedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DateTime date) hospitalVaccineHistoryFetched,
  }) {
    return hospitalVaccineHistoryFetched(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DateTime date)? hospitalVaccineHistoryFetched,
  }) {
    return hospitalVaccineHistoryFetched?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DateTime date)? hospitalVaccineHistoryFetched,
    required TResult orElse(),
  }) {
    if (hospitalVaccineHistoryFetched != null) {
      return hospitalVaccineHistoryFetched(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_hospitalVaccineHistoryFetched value)
        hospitalVaccineHistoryFetched,
  }) {
    return hospitalVaccineHistoryFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_hospitalVaccineHistoryFetched value)?
        hospitalVaccineHistoryFetched,
  }) {
    return hospitalVaccineHistoryFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_hospitalVaccineHistoryFetched value)?
        hospitalVaccineHistoryFetched,
    required TResult orElse(),
  }) {
    if (hospitalVaccineHistoryFetched != null) {
      return hospitalVaccineHistoryFetched(this);
    }
    return orElse();
  }
}

abstract class _hospitalVaccineHistoryFetched
    implements HospitalVaccineHistoryEvent {
  const factory _hospitalVaccineHistoryFetched(final DateTime date) =
      _$hospitalVaccineHistoryFetchedImpl;

  DateTime get date;

  /// Create a copy of HospitalVaccineHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$hospitalVaccineHistoryFetchedImplCopyWith<
          _$hospitalVaccineHistoryFetchedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HospitalVaccineHistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<VaccineHistoryModel> vaccineHistory) success,
    required TResult Function(String errorMessage) error,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult Function(String errorMessage)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(HospitalVaccineHistoryLoading value) loading,
    required TResult Function(HospitalVaccineHistorySuccess value) success,
    required TResult Function(HospitalVaccineHistoryError value) error,
    required TResult Function(HospitalVaccineHistoryEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HospitalVaccineHistoryLoading value)? loading,
    TResult? Function(HospitalVaccineHistorySuccess value)? success,
    TResult? Function(HospitalVaccineHistoryError value)? error,
    TResult? Function(HospitalVaccineHistoryEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HospitalVaccineHistoryLoading value)? loading,
    TResult Function(HospitalVaccineHistorySuccess value)? success,
    TResult Function(HospitalVaccineHistoryError value)? error,
    TResult Function(HospitalVaccineHistoryEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalVaccineHistoryStateCopyWith<$Res> {
  factory $HospitalVaccineHistoryStateCopyWith(
          HospitalVaccineHistoryState value,
          $Res Function(HospitalVaccineHistoryState) then) =
      _$HospitalVaccineHistoryStateCopyWithImpl<$Res,
          HospitalVaccineHistoryState>;
}

/// @nodoc
class _$HospitalVaccineHistoryStateCopyWithImpl<$Res,
        $Val extends HospitalVaccineHistoryState>
    implements $HospitalVaccineHistoryStateCopyWith<$Res> {
  _$HospitalVaccineHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HospitalVaccineHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HospitalVaccineHistoryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HospitalVaccineHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HospitalVaccineHistoryState.initial()';
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
    required TResult Function() loading,
    required TResult Function(List<VaccineHistoryModel> vaccineHistory) success,
    required TResult Function(String errorMessage) error,
    required TResult Function() empty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function()? empty,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult Function(String errorMessage)? error,
    TResult Function()? empty,
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
    required TResult Function(HospitalVaccineHistoryLoading value) loading,
    required TResult Function(HospitalVaccineHistorySuccess value) success,
    required TResult Function(HospitalVaccineHistoryError value) error,
    required TResult Function(HospitalVaccineHistoryEmpty value) empty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HospitalVaccineHistoryLoading value)? loading,
    TResult? Function(HospitalVaccineHistorySuccess value)? success,
    TResult? Function(HospitalVaccineHistoryError value)? error,
    TResult? Function(HospitalVaccineHistoryEmpty value)? empty,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HospitalVaccineHistoryLoading value)? loading,
    TResult Function(HospitalVaccineHistorySuccess value)? success,
    TResult Function(HospitalVaccineHistoryError value)? error,
    TResult Function(HospitalVaccineHistoryEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HospitalVaccineHistoryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$HospitalVaccineHistoryLoadingImplCopyWith<$Res> {
  factory _$$HospitalVaccineHistoryLoadingImplCopyWith(
          _$HospitalVaccineHistoryLoadingImpl value,
          $Res Function(_$HospitalVaccineHistoryLoadingImpl) then) =
      __$$HospitalVaccineHistoryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HospitalVaccineHistoryLoadingImplCopyWithImpl<$Res>
    extends _$HospitalVaccineHistoryStateCopyWithImpl<$Res,
        _$HospitalVaccineHistoryLoadingImpl>
    implements _$$HospitalVaccineHistoryLoadingImplCopyWith<$Res> {
  __$$HospitalVaccineHistoryLoadingImplCopyWithImpl(
      _$HospitalVaccineHistoryLoadingImpl _value,
      $Res Function(_$HospitalVaccineHistoryLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HospitalVaccineHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HospitalVaccineHistoryLoadingImpl
    implements HospitalVaccineHistoryLoading {
  const _$HospitalVaccineHistoryLoadingImpl();

  @override
  String toString() {
    return 'HospitalVaccineHistoryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalVaccineHistoryLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<VaccineHistoryModel> vaccineHistory) success,
    required TResult Function(String errorMessage) error,
    required TResult Function() empty,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function()? empty,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult Function(String errorMessage)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(HospitalVaccineHistoryLoading value) loading,
    required TResult Function(HospitalVaccineHistorySuccess value) success,
    required TResult Function(HospitalVaccineHistoryError value) error,
    required TResult Function(HospitalVaccineHistoryEmpty value) empty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HospitalVaccineHistoryLoading value)? loading,
    TResult? Function(HospitalVaccineHistorySuccess value)? success,
    TResult? Function(HospitalVaccineHistoryError value)? error,
    TResult? Function(HospitalVaccineHistoryEmpty value)? empty,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HospitalVaccineHistoryLoading value)? loading,
    TResult Function(HospitalVaccineHistorySuccess value)? success,
    TResult Function(HospitalVaccineHistoryError value)? error,
    TResult Function(HospitalVaccineHistoryEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HospitalVaccineHistoryLoading
    implements HospitalVaccineHistoryState {
  const factory HospitalVaccineHistoryLoading() =
      _$HospitalVaccineHistoryLoadingImpl;
}

/// @nodoc
abstract class _$$HospitalVaccineHistorySuccessImplCopyWith<$Res> {
  factory _$$HospitalVaccineHistorySuccessImplCopyWith(
          _$HospitalVaccineHistorySuccessImpl value,
          $Res Function(_$HospitalVaccineHistorySuccessImpl) then) =
      __$$HospitalVaccineHistorySuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<VaccineHistoryModel> vaccineHistory});
}

/// @nodoc
class __$$HospitalVaccineHistorySuccessImplCopyWithImpl<$Res>
    extends _$HospitalVaccineHistoryStateCopyWithImpl<$Res,
        _$HospitalVaccineHistorySuccessImpl>
    implements _$$HospitalVaccineHistorySuccessImplCopyWith<$Res> {
  __$$HospitalVaccineHistorySuccessImplCopyWithImpl(
      _$HospitalVaccineHistorySuccessImpl _value,
      $Res Function(_$HospitalVaccineHistorySuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of HospitalVaccineHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaccineHistory = null,
  }) {
    return _then(_$HospitalVaccineHistorySuccessImpl(
      null == vaccineHistory
          ? _value._vaccineHistory
          : vaccineHistory // ignore: cast_nullable_to_non_nullable
              as List<VaccineHistoryModel>,
    ));
  }
}

/// @nodoc

class _$HospitalVaccineHistorySuccessImpl
    implements HospitalVaccineHistorySuccess {
  const _$HospitalVaccineHistorySuccessImpl(
      final List<VaccineHistoryModel> vaccineHistory)
      : _vaccineHistory = vaccineHistory;

  final List<VaccineHistoryModel> _vaccineHistory;
  @override
  List<VaccineHistoryModel> get vaccineHistory {
    if (_vaccineHistory is EqualUnmodifiableListView) return _vaccineHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vaccineHistory);
  }

  @override
  String toString() {
    return 'HospitalVaccineHistoryState.success(vaccineHistory: $vaccineHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalVaccineHistorySuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._vaccineHistory, _vaccineHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_vaccineHistory));

  /// Create a copy of HospitalVaccineHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalVaccineHistorySuccessImplCopyWith<
          _$HospitalVaccineHistorySuccessImpl>
      get copyWith => __$$HospitalVaccineHistorySuccessImplCopyWithImpl<
          _$HospitalVaccineHistorySuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<VaccineHistoryModel> vaccineHistory) success,
    required TResult Function(String errorMessage) error,
    required TResult Function() empty,
  }) {
    return success(vaccineHistory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function()? empty,
  }) {
    return success?.call(vaccineHistory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult Function(String errorMessage)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(vaccineHistory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(HospitalVaccineHistoryLoading value) loading,
    required TResult Function(HospitalVaccineHistorySuccess value) success,
    required TResult Function(HospitalVaccineHistoryError value) error,
    required TResult Function(HospitalVaccineHistoryEmpty value) empty,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HospitalVaccineHistoryLoading value)? loading,
    TResult? Function(HospitalVaccineHistorySuccess value)? success,
    TResult? Function(HospitalVaccineHistoryError value)? error,
    TResult? Function(HospitalVaccineHistoryEmpty value)? empty,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HospitalVaccineHistoryLoading value)? loading,
    TResult Function(HospitalVaccineHistorySuccess value)? success,
    TResult Function(HospitalVaccineHistoryError value)? error,
    TResult Function(HospitalVaccineHistoryEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class HospitalVaccineHistorySuccess
    implements HospitalVaccineHistoryState {
  const factory HospitalVaccineHistorySuccess(
          final List<VaccineHistoryModel> vaccineHistory) =
      _$HospitalVaccineHistorySuccessImpl;

  List<VaccineHistoryModel> get vaccineHistory;

  /// Create a copy of HospitalVaccineHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HospitalVaccineHistorySuccessImplCopyWith<
          _$HospitalVaccineHistorySuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HospitalVaccineHistoryErrorImplCopyWith<$Res> {
  factory _$$HospitalVaccineHistoryErrorImplCopyWith(
          _$HospitalVaccineHistoryErrorImpl value,
          $Res Function(_$HospitalVaccineHistoryErrorImpl) then) =
      __$$HospitalVaccineHistoryErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$HospitalVaccineHistoryErrorImplCopyWithImpl<$Res>
    extends _$HospitalVaccineHistoryStateCopyWithImpl<$Res,
        _$HospitalVaccineHistoryErrorImpl>
    implements _$$HospitalVaccineHistoryErrorImplCopyWith<$Res> {
  __$$HospitalVaccineHistoryErrorImplCopyWithImpl(
      _$HospitalVaccineHistoryErrorImpl _value,
      $Res Function(_$HospitalVaccineHistoryErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HospitalVaccineHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$HospitalVaccineHistoryErrorImpl(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HospitalVaccineHistoryErrorImpl implements HospitalVaccineHistoryError {
  const _$HospitalVaccineHistoryErrorImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'HospitalVaccineHistoryState.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalVaccineHistoryErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of HospitalVaccineHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalVaccineHistoryErrorImplCopyWith<_$HospitalVaccineHistoryErrorImpl>
      get copyWith => __$$HospitalVaccineHistoryErrorImplCopyWithImpl<
          _$HospitalVaccineHistoryErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<VaccineHistoryModel> vaccineHistory) success,
    required TResult Function(String errorMessage) error,
    required TResult Function() empty,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function()? empty,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult Function(String errorMessage)? error,
    TResult Function()? empty,
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
    required TResult Function(HospitalVaccineHistoryLoading value) loading,
    required TResult Function(HospitalVaccineHistorySuccess value) success,
    required TResult Function(HospitalVaccineHistoryError value) error,
    required TResult Function(HospitalVaccineHistoryEmpty value) empty,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HospitalVaccineHistoryLoading value)? loading,
    TResult? Function(HospitalVaccineHistorySuccess value)? success,
    TResult? Function(HospitalVaccineHistoryError value)? error,
    TResult? Function(HospitalVaccineHistoryEmpty value)? empty,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HospitalVaccineHistoryLoading value)? loading,
    TResult Function(HospitalVaccineHistorySuccess value)? success,
    TResult Function(HospitalVaccineHistoryError value)? error,
    TResult Function(HospitalVaccineHistoryEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HospitalVaccineHistoryError
    implements HospitalVaccineHistoryState {
  const factory HospitalVaccineHistoryError(final String errorMessage) =
      _$HospitalVaccineHistoryErrorImpl;

  String get errorMessage;

  /// Create a copy of HospitalVaccineHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HospitalVaccineHistoryErrorImplCopyWith<_$HospitalVaccineHistoryErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HospitalVaccineHistoryEmptyImplCopyWith<$Res> {
  factory _$$HospitalVaccineHistoryEmptyImplCopyWith(
          _$HospitalVaccineHistoryEmptyImpl value,
          $Res Function(_$HospitalVaccineHistoryEmptyImpl) then) =
      __$$HospitalVaccineHistoryEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HospitalVaccineHistoryEmptyImplCopyWithImpl<$Res>
    extends _$HospitalVaccineHistoryStateCopyWithImpl<$Res,
        _$HospitalVaccineHistoryEmptyImpl>
    implements _$$HospitalVaccineHistoryEmptyImplCopyWith<$Res> {
  __$$HospitalVaccineHistoryEmptyImplCopyWithImpl(
      _$HospitalVaccineHistoryEmptyImpl _value,
      $Res Function(_$HospitalVaccineHistoryEmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of HospitalVaccineHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HospitalVaccineHistoryEmptyImpl implements HospitalVaccineHistoryEmpty {
  const _$HospitalVaccineHistoryEmptyImpl();

  @override
  String toString() {
    return 'HospitalVaccineHistoryState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalVaccineHistoryEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<VaccineHistoryModel> vaccineHistory) success,
    required TResult Function(String errorMessage) error,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VaccineHistoryModel> vaccineHistory)? success,
    TResult Function(String errorMessage)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(HospitalVaccineHistoryLoading value) loading,
    required TResult Function(HospitalVaccineHistorySuccess value) success,
    required TResult Function(HospitalVaccineHistoryError value) error,
    required TResult Function(HospitalVaccineHistoryEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HospitalVaccineHistoryLoading value)? loading,
    TResult? Function(HospitalVaccineHistorySuccess value)? success,
    TResult? Function(HospitalVaccineHistoryError value)? error,
    TResult? Function(HospitalVaccineHistoryEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HospitalVaccineHistoryLoading value)? loading,
    TResult Function(HospitalVaccineHistorySuccess value)? success,
    TResult Function(HospitalVaccineHistoryError value)? error,
    TResult Function(HospitalVaccineHistoryEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class HospitalVaccineHistoryEmpty
    implements HospitalVaccineHistoryState {
  const factory HospitalVaccineHistoryEmpty() =
      _$HospitalVaccineHistoryEmptyImpl;
}
