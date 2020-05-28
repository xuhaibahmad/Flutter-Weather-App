// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$_forecastFutureAtom = Atom(name: '_WeatherStore._forecastFuture');

  @override
  ObservableFuture<Forecast> get _forecastFuture {
    _$_forecastFutureAtom.context.enforceReadPolicy(_$_forecastFutureAtom);
    _$_forecastFutureAtom.reportObserved();
    return super._forecastFuture;
  }

  @override
  set _forecastFuture(ObservableFuture<Forecast> value) {
    _$_forecastFutureAtom.context.conditionallyRunInAction(() {
      super._forecastFuture = value;
      _$_forecastFutureAtom.reportChanged();
    }, _$_forecastFutureAtom, name: '${_$_forecastFutureAtom.name}_set');
  }

  final _$forecastViewModelAtom = Atom(name: '_WeatherStore.forecastViewModel');

  @override
  ForecastViewModel get forecastViewModel {
    _$forecastViewModelAtom.context.enforceReadPolicy(_$forecastViewModelAtom);
    _$forecastViewModelAtom.reportObserved();
    return super.forecastViewModel;
  }

  @override
  set forecastViewModel(ForecastViewModel value) {
    _$forecastViewModelAtom.context.conditionallyRunInAction(() {
      super.forecastViewModel = value;
      _$forecastViewModelAtom.reportChanged();
    }, _$forecastViewModelAtom, name: '${_$forecastViewModelAtom.name}_set');
  }

  final _$errorAtom = Atom(name: '_WeatherStore.error');

  @override
  String get error {
    _$errorAtom.context.enforceReadPolicy(_$errorAtom);
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.context.conditionallyRunInAction(() {
      super.error = value;
      _$errorAtom.reportChanged();
    }, _$errorAtom, name: '${_$errorAtom.name}_set');
  }

  final _$getForecastAsyncAction = AsyncAction('getForecast');

  @override
  Future getForecast() {
    return _$getForecastAsyncAction.run(() => super.getForecast());
  }
}
