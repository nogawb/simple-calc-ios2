//
//  HistoryViewController.swift
//  simple-calc-ios2
//
//  Created by Ben Nogawa on 2/4/18.
//  Copyright © 2018 Ben Nogawa. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    
    @IBOutlet weak var HistoryScroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        for index in 0...historyArray.count - 1 {
            let label = UILabel(frame: CGRect(x: 0, y: index * 45, width: 300, height: 40))
            label.text = historyArray[index]
            HistoryScroll.addSubview(label)
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
