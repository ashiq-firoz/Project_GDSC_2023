import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)


     // TODO: Add your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyDDrI00as9efpL1xwrz17-ESoIyIJyCbrc")



    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
