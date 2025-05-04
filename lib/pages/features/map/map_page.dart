import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unitontro/controllers/map_controller';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';

import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});


  final MapController mapController = Get.put(MapController()); // Initialize the controller


  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  bool _showFeaturePoints = false;
  bool _showPlanes = false;
  bool _showWorldOrigin = false;
  bool _showAnimatedGuide = true;
  String _planeTexturePath = "Images/triangle.png";
  bool _handleTaps = false;

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    this.arSessionManager!.onInitialize(
          showFeaturePoints: _showFeaturePoints,
          showPlanes: _showPlanes,
          customPlaneTexturePath: _planeTexturePath,
          showWorldOrigin: _showWorldOrigin,
          showAnimatedGuide: _showAnimatedGuide,
          handleTaps: _handleTaps,
        );
    this.arObjectManager!.onInitialize();
  }

  void updateSessionSettings() {
    this.arSessionManager!.onInitialize(
          showFeaturePoints: _showFeaturePoints,
          showPlanes: _showPlanes,
          customPlaneTexturePath: _planeTexturePath,
          showWorldOrigin: _showWorldOrigin,
        );
  }

  @override
  void dispose() {
    //super.dispose();
    arSessionManager!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Debug Options'),
        ),
        body: Container(
            child: Stack(children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
            showPlatformType: true,
          ),
          Align(
            alignment: FractionalOffset.bottomRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              color: Color(0xFFFFFFF).withOpacity(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                    title: const Text('Feature Points'),
                    value: _showFeaturePoints,
                    onChanged: (bool value) {
                      mapController.toggleFeaturePoints(value);
                          updateSessionSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Planes'),
                    value: _showPlanes,
                    onChanged: (bool value) {
                      mapController.togglePlanes(value);
                          updateSessionSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('World Origin'),
                    value: _showWorldOrigin,
                    onChanged: (bool value) {
                      mapController.toggleWorldOrigin(value);
                          updateSessionSettings();
                    },
                  ),
                ],
              ),
            ),
          ),
        ])));
  }

}