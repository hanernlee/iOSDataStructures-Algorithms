import Foundation

public class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {
    public typealias Node = TrieNode<CollectionType.Element>
    private let root = Node(key: nil, parent: nil)
    public init() {}
    
    public func insert(_ collection: CollectionType) {
        var current = root
        
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
        current.isTerminating = true
    }
    
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        for element in collection {
            guard let child = current.children[element] else { return false }
            current = child
        }
        return current.isTerminating
    }
    
    public func remove(_ collection: CollectionType) {
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return
            }
            current = child
        }
        guard current.isTerminating else { return }
        current.isTerminating = false
        while let parent = current.parent, current.children.isEmpty && !current.isTerminating {
            parent.children[current.key!] = nil
            current = parent
        }
    }
}
