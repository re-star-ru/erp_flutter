import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/sku_info/sku.dart';

class SkuCubit extends Cubit<SkuInfo> {
  SkuCubit() : super(SkuInfo("name"));

  void showSkuInfo(String sku) async {
    return;
  }
}
