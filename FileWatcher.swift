import Cocoa

class FileWatcher{
  let filePaths:[String]  // paths to watch - works on folders and file paths
  var hasStarted = false
  var streamRef:FSEventStreamRef?
  private(set) var lastEventId:FSEventStreamEventId
  var callback:((_ fileWatcherEvent:FileWatcherEvent) -> Void)?
  var queue:DispatchQueue?
  
  init(_ paths:[String], _ sinceWhen:FSEventStreamEventId) {
    self.lastEventId = sinceWhen
    self.filePaths = paths
  }
  
  /**
   * Start listening for FSEvents
   */
  func start() {
    guard !hasStarted else { return } // -- make sure we are not already listening!
    
    var context = FSEventStreamContext(
      version: 0, info: Unmanaged.passUnretained(self).toOpaque(),
      retain: retainCallback, release: releaseCallback,
      copyDescription:nil
    )
        
    let flags = UInt32(kFSEventStreamCreateFlagUseCFTypes | kFSEventStreamCreateFlagFileEvents)
    streamRef = FSEventStreamCreate(kCFAllocatorDefault, eventCallback, &context, filePaths as CFArray, lastEventId, 0/*<--latency*/, flags)//Creates an FSEventStream.
    
    if let queue = queue {
      print("using dispach queue")
      FSEventStreamSetDispatchQueue(streamRef!, queue)
    }else {
      print("using main run loop")
      FSEventStreamScheduleWithRunLoop(streamRef!, CFRunLoopGetMain(), CFRunLoopMode.defaultMode.rawValue)
    }
    FSEventStreamStart(streamRef!)
    hasStarted = true
  }
  
  /**
   * Stop listening for FSEvents
   */
  func stop() {
    Swift.print("FileWatcher stop - has started: " + "\(hasStarted)")
    if(!hasStarted){return} // only stop if it has been started
    FSEventStreamStop(streamRef!)
    FSEventStreamInvalidate(streamRef!)
    FSEventStreamRelease(streamRef!)
    streamRef = nil
    hasStarted = false
  }
  
  private let eventCallback:FSEventStreamCallback = {(stream:ConstFSEventStreamRef,contextInfo:UnsafeMutableRawPointer?,numEvents:Int,eventPaths:UnsafeMutableRawPointer,eventFlags:UnsafePointer<FSEventStreamEventFlags>?,eventIds:UnsafePointer<FSEventStreamEventId>?) in
    let fileSystemWatcher = Unmanaged<FileWatcher>.fromOpaque(contextInfo!).takeUnretainedValue()
    let paths = Unmanaged<CFArray>.fromOpaque(eventPaths).takeUnretainedValue() as! [String]
    var eventFlagArray = Array(UnsafeBufferPointer(start: eventFlags, count: numEvents))
    for index in 0..<numEvents {
      fileSystemWatcher.callback?(FileWatcherEvent(eventIds![index], paths[index], eventFlags![index]))
    }
    fileSystemWatcher.lastEventId = eventIds![numEvents - 1]//<--i'm not sure if this is needed anymore
  }
  
  private let retainCallback:CFAllocatorRetainCallBack = {(info:UnsafeRawPointer?) in
    _ = Unmanaged<FileWatcher>.fromOpaque(info!).retain()
    return info
  }
  
  private let releaseCallback:CFAllocatorReleaseCallBack = {(info:UnsafeRawPointer?) in
    Unmanaged<FileWatcher>.fromOpaque(info!).release()
  }
}

extension FileWatcher{
  /**
   * Convenince init
   */
  convenience init(_ pathsToWatch:[String]) {
    self.init(pathsToWatch, FSEventStreamEventId(kFSEventStreamEventIdSinceNow))
  }
}
