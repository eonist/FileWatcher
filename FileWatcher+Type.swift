import Cocoa

/**
 * Callback signature
 */
extension FileWatcher {
   public typealias CallBack = (_ fileWatcherEvent: FileWatcherEvent) -> Void
}
