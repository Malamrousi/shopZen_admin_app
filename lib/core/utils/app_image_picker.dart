import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopzen_admin_dashboard/core/app/app_localizations.dart';
import 'package:shopzen_admin_dashboard/core/di/di.dart';
import 'package:shopzen_admin_dashboard/core/helper/extension.dart';

class AppImagePicker {
  const AppImagePicker._();

  static const AppImagePicker _instance = AppImagePicker._();

  factory AppImagePicker() {
    return _instance;
  }

  Future<Uint8List?> pickImage() async {
    try {
      if (kIsWeb) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image,
        );

        if (result != null) {
          return result.files.first.bytes;
        }
      } else {
        final ImagePicker picker = ImagePicker();

        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);

        if (image != null) {
          return await image.readAsBytes();
        }
      }
    } catch (e) {
      if (!kIsWeb) {
        final permissionStatus = await Permission.photos.status;
        if (permissionStatus.isDenied) {
          await showAlertPermissionDialog();
        } else {
          debugPrint("Image Picker Exception: $e");
        }
      } else {
        debugPrint("Web Image Picker Error: $e");
      }
    }
    return null;
  
  }

  Future<void> showAlertPermissionDialog() async {
    return showCupertinoDialog(
      context: getIt.get<GlobalKey<NavigatorState>>().currentState!.context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("permission_denied".tr(context)),
          content: Text("allow_access_to_gallery_and_camera".tr(context)),
          actions: [
            CupertinoDialogAction(
              child: Text("Cancel".tr(context)),
              onPressed: () => context.pop(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("setting".tr(context)),
              onPressed: () => openAppSettings,
            )
          ],
        );
      },
    );
  }
}
