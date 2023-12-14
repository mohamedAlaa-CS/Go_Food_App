import 'package:equatable/equatable.dart';

class Information extends Equatable {
  final int? id;
  final String? identityNumber;
  final String? taxRecord;
  final dynamic activity;
  final String? nationality;
  final String? vehicleImage;
  final String? vehicleTabletImage;
  final String? vehicleRegistration;
  final String? drivingImage;

  const Information({
    this.id,
    this.identityNumber,
    this.taxRecord,
    this.activity,
    this.nationality,
    this.vehicleImage,
    this.vehicleTabletImage,
    this.vehicleRegistration,
    this.drivingImage,
  });

  factory Information.fromJson(Map<String, dynamic> json) => Information(
        id: json['id'] as int?,
        identityNumber: json['identity_number'] as String?,
        taxRecord: json['tax_record'] as String?,
        activity: json['activity'] as dynamic,
        nationality: json['nationality'] as String?,
        vehicleImage: json['vehicle_image'] as String?,
        vehicleTabletImage: json['vehicle_tablet_image'] as String?,
        vehicleRegistration: json['vehicle_registration'] as String?,
        drivingImage: json['driving_image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'identity_number': identityNumber,
        'tax_record': taxRecord,
        'activity': activity,
        'nationality': nationality,
        'vehicle_image': vehicleImage,
        'vehicle_tablet_image': vehicleTabletImage,
        'vehicle_registration': vehicleRegistration,
        'driving_image': drivingImage,
      };

  @override
  List<Object?> get props {
    return [
      id,
      identityNumber,
      taxRecord,
      activity,
      nationality,
      vehicleImage,
      vehicleTabletImage,
      vehicleRegistration,
      drivingImage,
    ];
  }
}
