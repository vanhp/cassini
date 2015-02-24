//
//  ViewController.swift
//  cassini
//
//  Created by Vanh Phom on 2/23/15.
//  Copyright (c) 2015 VSP inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepareForSegue(segue:UIStoryboardSegue,sender:AnyObject?){
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "earth":
                        ivc.imageURL = MyImageURL.NASA.Earth
                        ivc.title = "Earth"
                    case "saturn":
                        ivc.imageURL = MyImageURL.NASA.Saturn
                        ivc.title = "Saturn"
                    case "cassini":
                        ivc.imageURL = MyImageURL.NASA.Cassini
                        ivc.title = "Cassini"
                default:break
                }                
            }
        }
    }
}

