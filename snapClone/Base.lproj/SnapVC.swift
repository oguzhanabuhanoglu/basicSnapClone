//
//  SnapVC.swift
//  snapClone
//
//  Created by Oğuzhan Abuhanoğlu on 6.12.2022.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import ImageSlideshow
import Kingfisher


class SnapVC: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var selectedSnap : snap?
    var inputArray = [KingfisherSource]()

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        if let snap = selectedSnap {
            
            timeLabel.text = "Time Left : \(snap.timeDifference)"
            
            for imageUrl in snap.imageUrlArray {
                inputArray.append(KingfisherSource(urlString: imageUrl)!)
            }
            
        }
        
    
        let imageSlideShow = ImageSlideshow(frame : CGRect(x: 10, y: 10, width: self.view.frame.width * 0.90, height: self.view.frame.height * 0.90))
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
        pageIndicator.pageIndicatorTintColor = UIColor.black
        imageSlideShow.pageIndicator = pageIndicator
        
        imageSlideShow.backgroundColor = UIColor.white
        imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
        imageSlideShow.setImageInputs(inputArray)
        self.view.addSubview(imageSlideShow)
        self.view.bringSubviewToFront(timeLabel)
        
        
    }
    


}
