import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';
import '../../../models/package.dart';

part 'packages_event.dart';
part 'packages_state.dart';


class PackagesBloc extends Bloc<PackagesEvent, PackagesState> {
  final BasePackagesRepository _packagesRepos;
  StreamSubscription? _streamSubscription;

  PackagesBloc({required PackagesRepos packagesRepos})
      : _packagesRepos = packagesRepos,
        super(const PackagesLoaded()) {
    on<LoadPackages>(_mapLoadPackagesToState);
    on<UpdatePackages>(_mapUpdatePackagesToState);
  }

  FutureOr<void> _mapUpdatePackagesToState(
      UpdatePackages event, Emitter<PackagesState> emit) async {
    emit(PackagesLoaded(packages: event.packages));
  }

  FutureOr<void> _mapLoadPackagesToState(
      LoadPackages event, Emitter<PackagesState> emit) async {
    _streamSubscription?.cancel();
    _streamSubscription = _packagesRepos.getAllPackages().listen(
          (packages) {
        add(
          UpdatePackages(packages),
        );
      },
    );
  }
}
