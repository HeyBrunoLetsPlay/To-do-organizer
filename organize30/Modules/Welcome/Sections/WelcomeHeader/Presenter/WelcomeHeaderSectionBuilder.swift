//
//  WelcomeHeaderSectionBuilder.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 17/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation

final class WelcomeHeaderSectionBuilder {
   
    static func make()->WelcomeHeaderSection {
        return WelcomeHeaderSection.init(with:WelcomeHeaderDisplayItemBuilder())
    }
}
