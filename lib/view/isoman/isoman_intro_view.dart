import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isomanbangkit/components/IBButtonAccent.dart';
import 'package:isomanbangkit/routes/routes_name.dart';
import 'package:isomanbangkit/view_model/isoman/isoman_intro_view_model.dart';

class IsomanIntroView extends StatelessWidget {
  final IsomanIntroViewModel viewModel = Get.put(IsomanIntroViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff389F6E),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 124, right: 24, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lakukan Isoman!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                      "Aplikasi akan membimbing-mu untuk melakukan isolasi mandiri.",
                      style: TextStyle(color: Colors.white, fontSize: 16))
                ],
              ),
            ),
            Positioned(
              bottom: 12,
              left: 24,
              right: 24,
              child: Container(
                width: Get.mediaQuery.size.width,
                child: IBButtonAccent(
                  "Mulai Isoman",
                  onPressed: () async {
                    try {
                      await viewModel.saveIsoman();
                      Get.offNamed(RoutesName.ISOMAN_HOME);
                    } catch (e) {
                      print(e);
                    }
                  },
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
