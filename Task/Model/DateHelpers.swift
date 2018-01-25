//
//  DateHelpers.swift
//  Task
//
//  Created by Erik HARTLEY on 1/24/18.
//  Copyright © 2018 Erik HARTLEY. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
