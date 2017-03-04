//
//  FoldTestViewController.swift
//  KefirFoldTransition
//
//  Created by Artem on 3/1/17.
//  Copyright © 2017 ApiqA. All rights reserved.
//

import UIKit

class FoldTestViewController: UIViewController {
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    
    var viewOne: UIView?
    var viewTwo: UIView?
    var blackButton: UIButton?
    var redButton: UIButton?
    var spacingBetweenButtons: CGFloat = 8
    var isViewTwoOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isViewTwoOpen = false
        initCentralViews()
        addCentralViews([viewOne, viewTwo])
        initBlackButton()
        initRedButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let labelFrame = CGRect(x: 0, y: 0, width: view.frame.width * 0.4, height: view.frame.height * 0.1)
        self.labelThree.frame = labelFrame
        self.labelThree.center = CGPoint(x: view.frame.width/2, y: view.frame.height * 0.1)
    }
    
    func initRedButton() {
        self.redButton = UIButton()
        guard self.redButton != nil else {return}
        view.addSubview(self.redButton!)
        self.redButton!.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        self.redButton!.setTitle("DICH", for: .normal)
        self.redButton!.backgroundColor = UIColor.red
        self.redButton!.titleLabel!.font = UIFont.systemFont(ofSize: 21, weight: UIFontWeightThin)
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 0.2, height: self.view.frame.height * 0.05)
        self.redButton!.frame = frame
        self.redButton!.center = CGPoint(x: self.blackButton!.center.x, y: self.blackButton!.center.y - self.spacingBetweenButtons - self.redButton!.frame.height)
    }
    
    func initBlackButton() {
        self.blackButton = UIButton()
        guard self.blackButton != nil else {return}
        view.addSubview(self.blackButton!)
        self.blackButton!.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        self.blackButton!.setTitle("BITCH", for: .normal)
        self.blackButton!.backgroundColor = UIColor.black
        self.blackButton!.titleLabel!.font = UIFont.systemFont(ofSize: 21, weight: UIFontWeightThin)
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 0.2, height: self.view.frame.height * 0.05)
        self.blackButton!.frame = frame
        self.blackButton!.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height - self.view.frame.height * 0.1)
    }
    
    func initCentralViews() {
        let viewOne = UIView()
        let viewOneFrame = CGRect(x: 0, y: 0, width: self.view.frame.width * 0.8, height: self.view.frame.height * 0.4)
        viewOne.frame = viewOneFrame
        viewOne.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/3)
        viewOne.backgroundColor = UIColor.magenta
        self.viewOne = viewOne
        let viewTwo = UIView()
        viewTwo.frame = viewOneFrame //odinakovie freimi s pervoi viewshkoi
        viewTwo.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/3)
        viewTwo.backgroundColor = UIColor.black
        self.viewTwo = viewTwo
    }
    
    func addCentralViews(_ views: [UIView?]) {
        for view in views {
            if let view_ = view {
                self.view.addSubview(view_)
            }
        }
    }
    
    func addButtons(buttons: [UIButton]) {
        for button in buttons {
            self.view.addSubview(button)
        }
    }
    
    func buttonHandler(_ sender: UIButton!) {
        
        print("button pressed")
        sender.isUserInteractionEnabled = false
        isViewTwoOpen = !isViewTwoOpen
        let toView = isViewTwoOpen ? self.labelTwo : self.labelOne
        MPFoldTransition.transition(from: self.labelThree, to: toView, duration: 1, style: UInt(MPFoldStyleCubic), transitionAction: MPTransitionActionNone, completion: {_ in
            self.labelThree.backgroundColor = toView?.backgroundColor
            self.labelThree.text = toView?.text
            sender.isUserInteractionEnabled = true
        })
        
        MPFoldTransition.transition(from: self.blackButton, to: self.blackButton, duration: 1, style: UInt(MPFoldStyleCubic), transitionAction: MPTransitionActionNone, completion: {_ in
            sender.isUserInteractionEnabled = true
        })
    }
}
