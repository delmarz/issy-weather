//
//  NibLoadableView + ReusableView.swift
//  weather issy
//
//  Created by Issy Mayor on 23/5/2022.
//

import UIKit

// MARK: - NibLoadableView

protocol NibLoadableView: AnyObject {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension UITableViewCell: NibLoadableView {}


// MARK: - ReusableView


protocol ReusableView: AnyObject {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}
