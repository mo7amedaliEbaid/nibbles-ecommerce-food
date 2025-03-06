import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NibblesInfo extends Equatable {
  final String verse1;
  final String verse2;
  final String verse3;
  final String verse4;

  const NibblesInfo({
    required this.verse1,
    required this.verse2,
    required this.verse3,
    required this.verse4,
  });


  factory NibblesInfo.fromSnapshot(DocumentSnapshot snap) {
    return NibblesInfo(
      verse1: snap['verse1'],
      verse2: snap['verse2'],
      verse3: snap['verse3'],
      verse4: snap['verse4'],
    );
  }

  @override
  List<Object?> get props => [verse1, verse2, verse3, verse4];

}
