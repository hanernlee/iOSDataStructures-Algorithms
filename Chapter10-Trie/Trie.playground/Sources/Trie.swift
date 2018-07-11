import Foundation

public class Trie<CollectinoType: Collection where CollectionType.Element: Hashable> {
    public typealias Node = TrieNode<CollectionType.Element>
    private let root = Node(key: nil, parent: nil)
    public init() {}
}
