import 'package:flutter/material.dart';

class ChangeProfilePictureCard extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;
  final VoidCallback onClose;

  const ChangeProfilePictureCard({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 360,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFf0f0f0), width: 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            // === Close Button (X Circle) ===
            Positioned(
              right: 10,
              top: 10,
              child: GestureDetector(
                onTap: onClose,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF757575),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: Color(0xFF757575),
                    size: 14,
                  ),
                ),
              ),
            ),

            // === Main Content ===
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    "Change Profile Picture",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xFF007083),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // === Camera Button ===
                  _buildActionButton(
                    title: "From Camera",
                    subtitle: "Click a new picture from your camera",
                    iconPath: "assets/img/camera.png",
                    onTap: onCameraTap,
                  ),

                  const SizedBox(height: 8),

                  // === Gallery Button ===
                  _buildActionButton(
                    title: "From Gallery",
                    subtitle: "Upload a picture from your gallery",
                    iconPath: "assets/img/gallery.png",
                    onTap: onGalleryTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String title,
    required String subtitle,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 340,
        // height: 51,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF007083),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // === Texts ===
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            // === Icon ===
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(iconPath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
