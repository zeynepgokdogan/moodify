//
//  String+Localization.swift
//  instaClone
//
//  Created by Zeynep Gökdoğan on 15.04.2025.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(
            self,
            comment: ""
        )
    }
}
