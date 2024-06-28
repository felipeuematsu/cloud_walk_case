import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_details.freezed.dart';

part 'transaction_details.g.dart';

@freezed
class TransactionDetails with _$TransactionDetails {
  const factory TransactionDetails({
    required String description,
    required int valueCents,
  }) = _TransactionDetails;

  factory TransactionDetails.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailsFromJson(json);
}
