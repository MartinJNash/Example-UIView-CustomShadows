//
//  ViewController.swift
//  Shadow Boxer
//
//  Created by Martin Nash on 5/1/17.
//  Copyright © 2017 Martin Nash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var holderView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         To display a shadow on a view (actually a view's layer), we need the view's layer to not mask to bounds because shadows are drawn outside of bounds.
         
         On an image view, if maks to bounds is false, the image portion that shouldn't be visible because of scaling is drawn.
         
         So with image views, we need to put them inside of a holder view to display a shadow.
         
         */
        
        // image view for image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        
        // holder view for shadow
        holderView.layer.masksToBounds = false
        


        // Create a path for the shadow to lie in.
        var rect = holderView.layer.bounds
        rect.size.height *= 0.2
        rect.size.width *= 0.9
        let path = UIBezierPath(ovalIn: rect)
        
        // shadow should be in this shape. This can be an arbitrary CGPath. You could make hearts, stars, circles, anything that can be expressed by CGPath and custom QuartzCore drawing.
        holderView.layer.shadowPath = path.cgPath
        
        
        
        // shadow offset is where the shadow lies
        holderView.layer.shadowOffset = CGSize(width: 10, height: holderView.bounds.height * 0.95)

        let pinkColor = UIColor(colorLiteralRed: 255.0/255.0, green: 182.0/255.0, blue: 193.0/255.0, alpha: 1.0).cgColor
        holderView.layer.shadowColor = pinkColor
        holderView.layer.shadowOpacity = 0.7
        holderView.layer.shadowRadius = 10
        
    
    }


}


