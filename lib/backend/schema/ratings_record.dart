import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingsRecord extends FirestoreRecord {
  RatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _rating = castToType<int>(snapshotData['rating']);
    _review = snapshotData['review'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ratings')
          : FirebaseFirestore.instance.collectionGroup('ratings');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('ratings').doc();

  static Stream<RatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingsRecord.fromSnapshot(s));

  static Future<RatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingsRecord.fromSnapshot(s));

  static RatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingsRecordData({
  int? rating,
  String? review,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rating': rating,
      'review': review,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingsRecordDocumentEquality implements Equality<RatingsRecord> {
  const RatingsRecordDocumentEquality();

  @override
  bool equals(RatingsRecord? e1, RatingsRecord? e2) {
    return e1?.rating == e2?.rating && e1?.review == e2?.review;
  }

  @override
  int hash(RatingsRecord? e) =>
      const ListEquality().hash([e?.rating, e?.review]);

  @override
  bool isValidKey(Object? o) => o is RatingsRecord;
}
