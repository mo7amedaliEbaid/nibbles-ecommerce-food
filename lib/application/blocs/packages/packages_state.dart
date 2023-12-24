part of 'packages_bloc.dart';

@immutable
abstract class PackagesState extends Equatable {
  const PackagesState();

  @override
  List<Object> get props => [];
}

class PackagesLoading extends PackagesState {}

class PackagesLoaded extends PackagesState {
  final List<PackageModel> packages;

  const PackagesLoaded({this.packages = const <PackageModel>[]});

  @override
  List<Object> get props => [packages];
}
