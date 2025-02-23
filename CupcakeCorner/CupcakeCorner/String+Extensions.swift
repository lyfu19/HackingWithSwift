//
//  String+Extensions.swift
//  CupcakeCorner
//
//  Created by 阿福 on 24/02/2025.
//

import Foundation

extension String {
    var isBlank: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
