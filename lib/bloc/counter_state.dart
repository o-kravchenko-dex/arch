part of 'counter_bloc.dart';

class CounterState {
  final int data;

  CounterState({required this.data});

  CounterState.initial() : this(data: 0);

  CounterState copyWith({int? data}) => CounterState(data: data ?? this.data);

  factory CounterState.fromJson(Map<String, dynamic> json) => CounterState(data: json['data']);
  Map<String, dynamic> toJson() => {'data': data};
}
