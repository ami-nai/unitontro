package com.example.unitontro

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity()

override fun onCreate(savedInstanceState: Bundle?) {
  super.onCreate(savedInstanceState)

  // Enable AR-related functionality on ARCore supported devices only.
  maybeEnableArButton()
  …
}

fun maybeEnableArButton() {
  ArCoreApk.getInstance().checkAvailabilityAsync(this) { availability ->
    if (availability.isSupported) {
      mArButton.visibility = View.VISIBLE
      mArButton.isEnabled = true
    } else { // The device is unsupported or unknown.
      mArButton.visibility = View.INVISIBLE
      mArButton.isEnabled = false
    }
  }
}

// requestInstall(Activity, true) will triggers installation of
// Google Play Services for AR if necessary.
var mUserRequestedInstall = true

override fun onResume() {
  super.onResume()

  // Check camera permission.
  …

  // Ensure that Google Play Services for AR and ARCore device profile data are
  // installed and up to date.
  try {
    if (mSession == null) {
      when (ArCoreApk.getInstance().requestInstall(this, mUserRequestedInstall)) {
        ArCoreApk.InstallStatus.INSTALLED -> {
          // Success: Safe to create the AR session.
          mSession = Session(this)
        }
        ArCoreApk.InstallStatus.INSTALL_REQUESTED -> {
          // When this method returns `INSTALL_REQUESTED`:
          // 1. ARCore pauses this activity.
          // 2. ARCore prompts the user to install or update Google Play
          //    Services for AR (market://details?id=com.google.ar.core).
          // 3. ARCore downloads the latest device profile data.
          // 4. ARCore resumes this activity. The next invocation of
          //    requestInstall() will either return `INSTALLED` or throw an
          //    exception if the installation or update did not succeed.
          mUserRequestedInstall = false
          return
        }
      }
    }
  } catch (e: UnavailableUserDeclinedInstallationException) {
    // Display an appropriate message to the user and return gracefully.
    Toast.makeText(this, "TODO: handle exception " + e, Toast.LENGTH_LONG)
        .show()
    return
  } catch (…) {
    …
    return  // mSession remains null, since session creation has failed.
  }
  …
}

override fun onResume() {
  super.onResume()

  // ARCore requires camera permission to operate.
  if (!CameraPermissionHelper.hasCameraPermission(this)) {
    CameraPermissionHelper.requestCameraPermission(this)
    return
  }

  …
}

override fun onRequestPermissionsResult(
  requestCode: Int,
  permissions: Array<String>,
  results: IntArray
) {
  super.onRequestPermissionsResult(requestCode, permissions, results)
  if (!CameraPermissionHelper.hasCameraPermission(this)) {
    Toast.makeText(this, "Camera permission is needed to run this application", Toast.LENGTH_LONG)
      .show()
    if (!CameraPermissionHelper.shouldShowRequestPermissionRationale(this)) {
      // Permission denied with checking "Do not ask again".
      CameraPermissionHelper.launchPermissionSettings(this)
    }
    finish()
  }
}