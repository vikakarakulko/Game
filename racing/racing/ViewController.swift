//
//  ViewController.swift
//  racing
//
//  Created by Виктория Каракулько on 10/12/20.
//  Copyright © 2020 Виктория Каракулько. All rights reserved.
//

import UIKit

var road1: CGFloat = 0.0
var road2: CGFloat = 0.0

class ViewController: UIViewController {

    
    @IBOutlet weak var roadImage: UIImageView!
    @IBOutlet weak var road2Image: UIImageView!
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var kust2: UIImageView!
    @IBOutlet weak var kust1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        road2Image.frame.origin.y = road2Image.frame.origin.y - road2Image.frame.size.height
            
        road1 = roadImage.frame.origin.y
        road2 = road2Image.frame.origin.y
//        road2Image.layer.frame.origin.y = 0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(processTap(_:)))
        view.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(processPane(_:)))
        view.addGestureRecognizer(panGesture)
        
                       }
        
            @objc func processTap (_ tapGesture: UITapGestureRecognizer) {
            let initialLocation = tapGesture.location(in: view)
            carImage.center.x = initialLocation.x
            carImage.center.y = initialLocation.y
        
            }
        
            @objc func processPane (_ panGesture: UIPanGestureRecognizer) {
            let location = panGesture.location(in: view)
            carImage.center.x = location.x
            carImage.center.y = location.y
        
                       }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            animateRoad()
            animateKust1()
//            anumateKust2()
            
           }
           
           func animateRoad() {
               UIImageView.animate(withDuration: 3, delay: 0, options:[.curveLinear], animations: {
                   self.roadImage.frame.origin.y = self.roadImage.frame.size.height
                 self.road2Image.frame.origin.y = 0
               }) { (result) in
                   self.roadImage.frame.origin.y = road1
                   self.road2Image.frame.origin.y = road2
                   self.animateRoad()
               }
           }
    func animateKust1() {
        UIImageView.animate(withDuration: 3, delay: 0, options: [.curveLinear], animations: {
            self.kust1.frame.origin.y = self.kust1.frame.origin.y + self.roadImage.frame.size.height
                   }) { (result) in
                       self.kust1.frame.origin.y = 0
                    self.animateKust1()
//                    self.kust1.layer.shadowColor = UIColor.red.cgColor
//                    self.kust1.layer.shadowOffset = CGSize(width: -5, height: -5)
//                    self.kust1.layer.shadowRadius = 10
                   }
               }
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
    
    }
//    func animateRightTree() {
//        UIImageView.animate(withDuration: 2, delay: 0, options: [.curveLinear], animations: {
//
//            self.kust2.frame.origin.y = self.kust2.frame.origin.y + self.roadImage.frame.size.height
//
//            }) { (result) in
//                self.kust2.frame.origin.y = 0
//                self.animateKust2()
//            }
//        }
    }
    




