import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "restaurantRef" field.
  DocumentReference? _restaurantRef;
  DocumentReference? get restaurantRef => _restaurantRef;
  bool hasRestaurantRef() => _restaurantRef != null;

  // "orderItems" field.
  List<CartItemTypeStruct>? _orderItems;
  List<CartItemTypeStruct> get orderItems => _orderItems ?? const [];
  bool hasOrderItems() => _orderItems != null;

  // "source" field.
  LatLng? _source;
  LatLng? get source => _source;
  bool hasSource() => _source != null;

  // "destination" field.
  LatLng? _destination;
  LatLng? get destination => _destination;
  bool hasDestination() => _destination != null;

  // "driverPosition" field.
  List<LatLng>? _driverPosition;
  List<LatLng> get driverPosition => _driverPosition ?? const [];
  bool hasDriverPosition() => _driverPosition != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _restaurantRef = snapshotData['restaurantRef'] as DocumentReference?;
    _orderItems = getStructList(
      snapshotData['orderItems'],
      CartItemTypeStruct.fromMap,
    );
    _source = snapshotData['source'] as LatLng?;
    _destination = snapshotData['destination'] as LatLng?;
    _driverPosition = getDataList(snapshotData['driverPosition']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('orders')
          : FirebaseFirestore.instance.collectionGroup('orders');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('orders').doc();

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DateTime? timestamp,
  String? status,
  DocumentReference? restaurantRef,
  LatLng? source,
  LatLng? destination,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'status': status,
      'restaurantRef': restaurantRef,
      'source': source,
      'destination': destination,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timestamp == e2?.timestamp &&
        e1?.status == e2?.status &&
        e1?.restaurantRef == e2?.restaurantRef &&
        listEquality.equals(e1?.orderItems, e2?.orderItems) &&
        e1?.source == e2?.source &&
        e1?.destination == e2?.destination &&
        listEquality.equals(e1?.driverPosition, e2?.driverPosition);
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.status,
        e?.restaurantRef,
        e?.orderItems,
        e?.source,
        e?.destination,
        e?.driverPosition
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
