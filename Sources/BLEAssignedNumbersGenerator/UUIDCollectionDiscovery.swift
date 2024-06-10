import Foundation
import Algorithms


public class UUIDCollectionDiscovery {
    private let fileManager: FileManager
    
    
    public init(fileManager: FileManager) {
        self.fileManager = fileManager
    }
    
    
    public func discover(fromRepository repoRootDir: URL) -> Result<[URL], UUIDCollectionDiscoveryError> {
        var isDirectory = ObjCBool(true)
        
        guard self.fileManager.fileExists(atPath: URLExtensions.path(ofURL: repoRootDir.absoluteURL), isDirectory: &isDirectory) else {
            return .failure(.couldNotFindRepository(path: URLExtensions.path(ofURL: repoRootDir.absoluteURL)))
        }
        
        let uuidsDir = URL(string: "assigned_numbers/uuids", relativeTo: repoRootDir.absoluteURL)!
        let uuidsDirAbs = uuidsDir.absoluteURL
        
        guard self.fileManager.fileExists(atPath: uuidsDirAbs.relativePath, isDirectory: &isDirectory) else {
            return .failure(.uuidsDirectoryDoesNotExist(path: uuidsDirAbs.relativePath))
        }
        
        do {
            let yamlBasenames = try self.fileManager.contentsOfDirectory(atPath: URLExtensions.path(ofURL: uuidsDirAbs))
            var yamlURLs = yamlBasenames
                .map {
                    var yaml = uuidsDir
                    URLExtensions.append(toURL: &yaml, $0, isDirectory: false)
                    return yaml
                }
            
            yamlURLs.sort(by: { $0.relativePath < $1.relativePath })
            
            return .success(yamlURLs)
        } catch (let e) {
            return .failure(.couldNotReadDirectory(path: uuidsDir.relativePath, error: "\(e)"))
        }
    }
}
