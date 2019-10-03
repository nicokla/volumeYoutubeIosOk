//
//  SecondVC.swift
//  essai2YoutubeVolume
//
//  Created by Nicolas Klarsfeld on 10/3/19.
//  Copyright © 2019 Nicolas Klarsfeld. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "tatayoyo", sender: self)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
