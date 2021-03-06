//
//  ContentViewChangable.swift
//  SHSideMenu
//
//  Created by 홍성호 on 2018. 8. 6..
//  Copyright © 2018년 홍성호. All rights reserved.
//

import Foundation
import RxSwift

public protocol ContentViewChangable {
    var viewTransition: BehaviorSubject<UIViewController> { get }
}

private struct AssociatedKey {
    static var menuContainerViewController: String = "SideMenuUsable.menuContainerViewController"
}

extension ContentViewChangable {
    weak var menuContainerViewController: UIViewController? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.menuContainerViewController) as? UIViewController
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.menuContainerViewController, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
    }
}
