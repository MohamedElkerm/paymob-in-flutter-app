// To parse this JSON data, do
//
//     final kiosk = kioskFromJson(jsonString);

import 'dart:convert';

Kiosk kioskFromJson(String str) => Kiosk.fromJson(json.decode(str));

String kioskToJson(Kiosk data) => json.encode(data.toJson());

class Kiosk {
  Kiosk({
    required this.id,
    required this.pending,
    required this.amountCents,
    required this.success,
    required this.isAuth,
    required this.isCapture,
    required this.isStandalonePayment,
    required this.isVoided,
    required this.isRefunded,
    required this.is3DSecure,
    required this.integrationId,
    required this.profileId,
    required this.hasParentTransaction,
    required this.order,
    required this.createdAt,
    required this.currency,
    required this.terminalId,
    required this.merchantCommission,
    required this.installment,
    required this.discountDetails,
    required this.isVoid,
    required this.isRefund,
    required this.errorOccured,
    required this.refundedAmountCents,
    required this.capturedAmount,
    required this.merchantStaffTag,
    required this.updatedAt,
    required this.isSettled,
    required this.billBalanced,
    required this.isBill,
    required this.owner,
    required this.parentTransaction,
    required this.merchantOrderId,
    required this.dataMessage,
    required this.sourceDataType,
    required this.sourceDataPan,
    required this.sourceDataSubType,
    required this.acqResponseCode,
    required this.txnResponseCode,
    required this.hmac,
    required this.useRedirection,
    required this.redirectionUrl,
    required this.merchantResponse,
    required this.bypassStepSix,
  });

  int id;
  String pending;
  int amountCents;
  String success;
  String isAuth;
  String isCapture;
  String isStandalonePayment;
  String isVoided;
  String isRefunded;
  String is3DSecure;
  int integrationId;
  int profileId;
  String hasParentTransaction;
  int order;
  DateTime createdAt;
  String currency;
  String terminalId;
  int merchantCommission;
  String installment;
  List<dynamic> discountDetails;
  String isVoid;
  String isRefund;
  String errorOccured;
  int refundedAmountCents;
  int capturedAmount;
  String merchantStaffTag;
  DateTime updatedAt;
  String isSettled;
  String billBalanced;
  String isBill;
  int owner;
  String parentTransaction;
  String merchantOrderId;
  String dataMessage;
  String sourceDataType;
  String sourceDataPan;
  String sourceDataSubType;
  String acqResponseCode;
  String txnResponseCode;
  String hmac;
  bool useRedirection;
  String redirectionUrl;
  String merchantResponse;
  bool bypassStepSix;

  factory Kiosk.fromJson(Map<String, dynamic> json) => Kiosk(
    id: json["id"],
    pending: json["pending"],
    amountCents: json["amount_cents"],
    success: json["success"],
    isAuth: json["is_auth"],
    isCapture: json["is_capture"],
    isStandalonePayment: json["is_standalone_payment"],
    isVoided: json["is_voided"],
    isRefunded: json["is_refunded"],
    is3DSecure: json["is_3d_secure"],
    integrationId: json["integration_id"],
    profileId: json["profile_id"],
    hasParentTransaction: json["has_parent_transaction"],
    order: json["order"],
    createdAt: DateTime.parse(json["created_at"]),
    currency: json["currency"],
    terminalId: json["terminal_id"],
    merchantCommission: json["merchant_commission"],
    installment: json["installment"],
    discountDetails: List<dynamic>.from(json["discount_details"].map((x) => x)),
    isVoid: json["is_void"],
    isRefund: json["is_refund"],
    errorOccured: json["error_occured"],
    refundedAmountCents: json["refunded_amount_cents"],
    capturedAmount: json["captured_amount"],
    merchantStaffTag: json["merchant_staff_tag"],
    updatedAt: DateTime.parse(json["updated_at"]),
    isSettled: json["is_settled"],
    billBalanced: json["bill_balanced"],
    isBill: json["is_bill"],
    owner: json["owner"],
    parentTransaction: json["parent_transaction"],
    merchantOrderId: json["merchant_order_id"],
    dataMessage: json["data.message"],
    sourceDataType: json["source_data.type"],
    sourceDataPan: json["source_data.pan"],
    sourceDataSubType: json["source_data.sub_type"],
    acqResponseCode: json["acq_response_code"],
    txnResponseCode: json["txn_response_code"],
    hmac: json["hmac"],
    useRedirection: json["use_redirection"],
    redirectionUrl: json["redirection_url"],
    merchantResponse: json["merchant_response"],
    bypassStepSix: json["bypass_step_six"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pending": pending,
    "amount_cents": amountCents,
    "success": success,
    "is_auth": isAuth,
    "is_capture": isCapture,
    "is_standalone_payment": isStandalonePayment,
    "is_voided": isVoided,
    "is_refunded": isRefunded,
    "is_3d_secure": is3DSecure,
    "integration_id": integrationId,
    "profile_id": profileId,
    "has_parent_transaction": hasParentTransaction,
    "order": order,
    "created_at": createdAt.toIso8601String(),
    "currency": currency,
    "terminal_id": terminalId,
    "merchant_commission": merchantCommission,
    "installment": installment,
    "discount_details": List<dynamic>.from(discountDetails.map((x) => x)),
    "is_void": isVoid,
    "is_refund": isRefund,
    "error_occured": errorOccured,
    "refunded_amount_cents": refundedAmountCents,
    "captured_amount": capturedAmount,
    "merchant_staff_tag": merchantStaffTag,
    "updated_at": updatedAt.toIso8601String(),
    "is_settled": isSettled,
    "bill_balanced": billBalanced,
    "is_bill": isBill,
    "owner": owner,
    "parent_transaction": parentTransaction,
    "merchant_order_id": merchantOrderId,
    "data.message": dataMessage,
    "source_data.type": sourceDataType,
    "source_data.pan": sourceDataPan,
    "source_data.sub_type": sourceDataSubType,
    "acq_response_code": acqResponseCode,
    "txn_response_code": txnResponseCode,
    "hmac": hmac,
    "use_redirection": useRedirection,
    "redirection_url": redirectionUrl,
    "merchant_response": merchantResponse,
    "bypass_step_six": bypassStepSix,
  };
}
