//
//  RootViewControoler.swift
//  PagingMenuControllerDemo
//
//  Created by Cheng-chien Kuo on 5/14/16.
//  Copyright © 2016 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController

private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    private let viewController1 = UIViewController()
    private let viewController2 = UIViewController()
    private let viewController3 = UIViewController()
    private let viewController4 = UIViewController()
    private let viewController5 = UIViewController()
    private let viewController6 = UIViewController()
    private let viewController7 = UIViewController()
    private let viewController8 = UIViewController()
    
    
    
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    fileprivate var pagingControllers: [UIViewController] {
        return [viewController1, viewController2,
                viewController3, viewController4,
                viewController5, viewController6,
                viewController7, viewController8,]
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .standard(widthMode: MenuItemWidthMode.fixed(width: 100), centerItem: true, scrollingMode: MenuScrollingMode.pagingEnabled)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(),
            MenuItem3(), MenuItem4(),
            MenuItem5(), MenuItem6(),
            MenuItem7(), MenuItem8(),]
        }
    }
    
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "第一支"))
        }
        
    }
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .multilineText(title: MenuItemText(text: "几分"), description: MenuItemText(text: "第二支"))
        }
    }
    fileprivate struct MenuItem3: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let view = CustomView.instanceFromNib()
            return .custom(view: view)
        }
    }
    fileprivate struct MenuItem4: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .image(image: #imageLiteral(resourceName: "cross"), selectedImage: #imageLiteral(resourceName: "fullscreen"))
        }
    }
    fileprivate struct MenuItem5: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let view = CustomView.instanceFromNib()
            return .custom(view: view)
        }
    }
    fileprivate struct MenuItem6: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let view = CustomView.instanceFromNib()
            return .custom(view: view)
        }
    }
    fileprivate struct MenuItem7: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let view = CustomView.instanceFromNib()
            return .custom(view: view)
        }
    }
    fileprivate struct MenuItem8: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let view = CustomView.instanceFromNib()
            return .custom(view: view)
        }
    }
}

class RootViewControoler: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.view.frame.origin.y += 64
        pagingMenuController.view.frame.size.height -= 64
        
        
        
        pagingMenuController.onMove = { state in
            switch state {
            case let .willMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .didMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .willMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case let .didMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            }
        }
        
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParentViewController: self)
    }
}
