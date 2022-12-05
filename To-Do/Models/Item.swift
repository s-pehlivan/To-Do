//
//  Item.swift
//  To-Do
//
//  Created by Sora on 5.12.2022.
//

import Foundation
import RealmSwift

class Item: Object {
    @Persisted var title: String = ""
    @Persisted var isDone: Bool = false
    @Persisted var dateCreated: Date?
    @Persisted(originProperty: "items") var parentCategory: LinkingObjects<Category>
}
