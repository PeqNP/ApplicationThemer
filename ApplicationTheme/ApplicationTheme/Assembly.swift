/**
 
 Copyright © 2018 Upstart Illustration LLC. All rights reserved.
 */

import Foundation
import Swinject
import SwinjectStoryboard

class Assembly {
    
    let container: Container = SwinjectStoryboard.defaultContainer
    
    init() {
        container.register(AppTheme.self) { _ in
            return AppTheme()
        }.inObjectScope(.container)
        
        container.storyboardInitCompleted(ViewController.self) { resolver, controller in
            let theme = resolver.resolve(AppTheme.self)!
            
            controller.inject(theme: AnyUITheme<AppTheme>(theme: theme))
        }
    }
}
