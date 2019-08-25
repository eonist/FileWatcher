import Foundation
/**
 * - Parameters:
 *    - id: is an id number that the os uses to differentiate between events.
 *    - path: is the path the change took place. its formated like so: Users/John/Desktop/test/text.txt
 *    - flag: pertains to the file event type.
 * ## Examples:
 * let url = NSURL(fileURLWithPath: event.path)//<--formats paths to: file:///Users/John/Desktop/test/text.txt
 * Swift.print("fileWatcherEvent.fileChange: " + "\(event.fileChange)")
 * Swift.print("fileWatcherEvent.fileModified: " + "\(event.fileModified)")
 * Swift.print("\t eventId: \(event.id) - eventFlags:  \(event.flags) - eventPath:  \(event.path)")
 */
public class FileWatcherEvent {
    public var id: FSEventStreamEventId
    public var path: String
    public var flags: FSEventStreamEventFlags
    init(_ eventId: FSEventStreamEventId, _ eventPath: String, _ eventFlags: FSEventStreamEventFlags) {
        self.id = eventId
        self.path = eventPath
        self.flags = eventFlags
    }
}
/**
 * The following code is to differentiate between the FSEvent flag types (aka file event types)
 * - Remark: Be aware that .DS_STORE changes frequently when other files change
 */
extension FileWatcherEvent {
    /*general*/
    var fileChange: Bool { return (flags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemIsFile)) != 0 }
    var dirChange: Bool { return (flags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemIsDir)) != 0 }
    /*CRUD*/
    var created: Bool { return (flags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemCreated)) != 0 }
    var removed: Bool { return (flags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemRemoved)) != 0 }
    var renamed: Bool { return (flags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemRenamed)) != 0 }
    var modified: Bool { return (flags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemModified)) != 0 }
}
/**
 * Convenince
 */
extension FileWatcherEvent {
    /*File*/
    public var fileCreated: Bool { return fileChange && created }
    public var fileRemoved: Bool { return fileChange && removed }
    public var fileRenamed: Bool { return fileChange && renamed }
    public var fileModified: Bool { return fileChange && modified }
    /*Directory*/
    public var dirCreated: Bool { return dirChange && created }
    public var dirRemoved: Bool { return dirChange && removed }
    public var dirRenamed: Bool { return dirChange && renamed }
    public var dirModified: Bool { return dirChange && modified }
}
/**
 * Simplifies debugging
 * ## Examples:
 * Swift.print(event.description)//Outputs: The file /Users/John/Desktop/test/text.txt was modified
 */
extension FileWatcherEvent {
    public var description: String {
        var result = "The \(fileChange ? "file":"directory") \(self.path) was"
        if self.removed { result += " removed" }
        else if self.created { result += " created" }
        else if self.renamed { result += " renamed" }
        else if self.modified { result += " modified" }
        return result
    }
}
