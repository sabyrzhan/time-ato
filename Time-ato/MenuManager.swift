//
//  MenuManager.swift
//  Time-ato
//
//  Created by Sabyrzhan Tynybayev on 25.09.2022.
//

import Foundation
import AppKit

class MenuManager: NSObject, NSMenuDelegate {
    let statusMenu: NSMenu
    var menuIsOpen = false
    var tasks = Task.sampleTasksWithStatus
    
    let itemsBeforeTasks = 2
    let itemsAfterTasks = 6
    
    init(statusMenu: NSMenu) {
        self.statusMenu = statusMenu
        super.init()
    }
    
    func menuWillOpen(_ menu: NSMenu) {
        menuIsOpen = true
    }
    
    func menuDidClose(_ menu: NSMenu) {
        menuIsOpen = false
        clearTasksFromMenu()
    }
    
    func clearTasksFromMenu() {
        let stopAtIndex = statusMenu.items.count - itemsAfterTasks
        
        for _ in itemsBeforeTasks ..< stopAtIndex {
            statusMenu.removeItem(at: itemsBeforeTasks)
        }
    }
}
