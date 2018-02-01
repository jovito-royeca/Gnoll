//
//  MainViewController.swift
//  Gnoll
//
//  Created by Jovito Royeca on 30/01/2018.
//  Copyright © 2018 Jovito Royeca. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for vc in childViewControllers {
            if let nav = vc as? UINavigationController {
                for nvc in nav.childViewControllers {
                    if let vc = nvc as? RepositoriesViewController {
                        let _ = RepositoriesRouter.initRepositoriesModule(withView: vc)
                        nav.tabBarItem.setFAIcon(icon: .FAGithub, size: nil, orientation: .up, textColor: UIColor.lightGray, backgroundColor: UIColor.clear, selectedTextColor: UIColor.blue, selectedBackgroundColor: UIColor.clear)
                    } else {
                        // TO DO: my repositories
                        nav.tabBarItem.setFAIcon(icon: .FABook, size: nil, orientation: .up, textColor: UIColor.lightGray, backgroundColor: UIColor.clear, selectedTextColor: UIColor.blue, selectedBackgroundColor: UIColor.clear)
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
