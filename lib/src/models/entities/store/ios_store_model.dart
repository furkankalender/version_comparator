import '../../../utils/constants/endpoint_constants.dart';
import 'base_store_model.dart';

final class IosStoreModel extends BaseStoreModel {
  @override
  final String storeUrl;
  @override
  final String appId;
  @override
  final String versionQuery;

  IosStoreModel.custom(
      {required this.storeUrl,
      required this.appId,
      required this.versionQuery});

  IosStoreModel(String bundleId)
      : appId = bundleId,
        versionQuery = 'bundleId=$bundleId&_cb=${_getCacheBufferDate()}',
        storeUrl = EndpointConstants.iosStoreUrl;

  static String _getCacheBufferDate() {
    final now = DateTime.now().toUtc();

    final cacheBuster = '${now.year}'
        '${now.month.toString().padLeft(2, '0')}'
        '${now.day.toString().padLeft(2, '0')}'
        '${now.hour.toString().padLeft(2, '0')}';
    return cacheBuster;
  }     
}
