//
//  TASnackbarViewModel.swift
//  TianSources
//
//  Created by Trần Chí Thiện on 29/08/2022.
//

import Foundation
import UIKit

typealias Handlers = (() -> Void)

enum SnackbarType {
    case info
    case action(handler:Handlers)
}

struct SnackbarViewModel {
    let type:SnackbarType
    let text: String?
    let image: UIImage?
}
