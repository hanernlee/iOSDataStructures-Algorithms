// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "insert and contain") {
    let trie = Trie<String>
    trie.insert("cute")
    if trie.contains("cute") {
        print("cute is in the trie")
    }
}
