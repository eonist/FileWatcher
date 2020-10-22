import Cocoa
import FileWatcher_macOS

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   @IBOutlet weak var window: NSWindow!
   func applicationDidFinishLaunching(_ aNotification: Notification) {
      let filewatcher = FileWatcher([NSString(string: "~/Desktop").expandingTildeInPath])
      filewatcher.callback = { (event: FileWatcherEvent) in
         print("Something happened here: \(event.path)")
         Swift.print("event.description:  \(event.description)")
         if !FileManager().fileExists(atPath: event.path) { Swift.print("was deleted") }
         Swift.print("event.flags:  \(event.flags)")
      }
      filewatcher.start() // start monitoring
   }
   func applicationWillTerminate(_ aNotification: Notification) {
      // Insert code here to tear down your application
   }
}
