//
//  UIViewController+Extension.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import Foundation
import SVProgressHUD

extension UIViewController {
    func showAlertWithTitle(title: String, message: String, options: String..., completion: ((Int) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                if completion != nil {
                    completion!(index)
                }
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showActivity() {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setContainerView(self.view)
        SVProgressHUD.show()
    }
    
    func dismissActivity() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
