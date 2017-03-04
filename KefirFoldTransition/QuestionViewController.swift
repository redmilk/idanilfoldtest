//
//  ViewController.swift
//  KefirFoldTransition
//
//  Created by Artem on 2/23/17.
//  Copyright © 2017 ApiqA. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    
    var theGameController: GameController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theGameController = GameController()
        // Do any additional setup after loading the view, typically from a nib.
        theGameController.mathQuestionGenerator()
    }


}

