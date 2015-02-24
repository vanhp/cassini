//
//  ImageViewController.swift
//  cassini
//
//  Created by Vanh Phom on 2/23/15.
//  Copyright (c) 2015 VSP inc. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate {

    //model for the view
    var imageURL: NSURL? {
        didSet{
            image = nil
            if view.window != nil { //check view is not onscreen
                
                fetchImage()
                
            }
        }
    }
    @IBInspectable
    var minZoomScale: CGFloat  = 0.01 {
        didSet {
            view.setNeedsDisplay()
        }
    }
    @IBInspectable
    var maxZoomScale:CGFloat = 1.0 {
        didSet{
            return view.setNeedsDisplay()
        }
    }
    private func fetchImage(){
        if let url = imageURL {
            spinner?.startAnimating()
            let qos = Int(QOS_CLASS_USER_INITIATED.value)
            // send task to worker thread
            dispatch_async(dispatch_get_global_queue(qos, 0)) { () -> Void in
                let imageData = NSData(contentsOfURL: url)
                // must do UI task in main thread only
                dispatch_async(dispatch_get_main_queue()){
                    // check if it's still same image user want
                    if url == self.imageURL {
                        if imageData != nil {
                            self.image = UIImage(data: imageData!)
                        }else {
                            self.image = nil
                        }
                    }
                }
            }
            
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            // must set the scrollview content 1st
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = minZoomScale
            scrollView.maximumZoomScale = maxZoomScale
        }
        
    }
    
    private var imageView = UIImageView()
    private var image:UIImage? {
        get { return imageView.image}
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            // whenever the image is changed set its content size
            scrollView?.contentSize = imageView.frame.size
            //stop spin wheel when set image
            spinner?.stopAnimating()
            spinner?.hidesWhenStopped = true
            
            
  
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(imageView)
        if imageURL == nil{
            imageURL = MyImageURL.myImage
           
        }
    }
    
}
