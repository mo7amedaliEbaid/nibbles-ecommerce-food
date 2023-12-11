part of 'packages_bloc.dart';


@immutable
abstract class PackagesEvent extends Equatable {
  const PackagesEvent();

  List<Object> get props => [];
}

class LoadPackages extends PackagesEvent {}

class UpdatePackages extends PackagesEvent {
  final List<PackageModel> packages;

  const UpdatePackages(this.packages);

  @override
  List<Object> get props => [packages];
}
