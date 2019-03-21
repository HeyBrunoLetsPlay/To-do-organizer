//
//  WelcomePhotoSectionBuilder.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 25/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation

final class WelcomePhotoSectionBuilder {
    static func make() -> WelcomePhotoSection {
        return WelcomePhotoSection.init(with:WelcomeHeaderDisplayItemBuilder())
    }
}
