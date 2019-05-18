import Cocoa
import FileWatcher_macOS

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   @IBOutlet weak var window: NSWindow!
   func applicationDidFinishLaunching(_ aNotification: Notification) {
      let filewatcher = FileWatcher([NSString(string: "~/Desktop").expandingTildeInPath])
      filewatcher.callback = { event in
         print("Something happened here: \(event.path)")
      }
      filewatcher.start() // start monitoring
   }
   func applicationWillTerminate(_ aNotification: Notification) {
      // Insert code here to tear down your application
   }
}
