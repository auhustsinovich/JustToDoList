//
//  Model.swift
//  JustToDoList
//
//  Created by Daniil Auhustsinovich on 7.11.21.
//

import Foundation

var JustToDoItems: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: C.dataKey)
        UserDefaults.standard.synchronize()
    }
    get {
        if let myArray = UserDefaults.standard.array(forKey: C.dataKey) as? [[String:Any]] {
            return myArray
        } else {
            return []
        }
    }
}
func addItem(nameItem:String, isCompleted: Bool = false) {
    if nameItem != "" {
        JustToDoItems.append(["Name" : nameItem, "isCompleted": isCompleted]) }
    else {
        print("Type Something")
    }
}

func removeItem(atIndex:Int) {
    JustToDoItems.remove(at: atIndex)
}
func moveItem(fromIndex: Int, toIndex: Int) {
    let from = JustToDoItems[fromIndex]
    JustToDoItems.remove(at: fromIndex)
    JustToDoItems.insert(from, at: toIndex)
    
}

func changeState(at item: Int) -> Bool{
    JustToDoItems[item]["isCompleted"] = !(JustToDoItems[item]["isCompleted"] as! Bool)
    return JustToDoItems[item]["isCompleted"] as! Bool
    
}


