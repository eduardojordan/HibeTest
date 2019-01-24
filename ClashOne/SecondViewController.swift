//
//  SecondViewController.swift
//  
//
//  Created by Eduardo on 22/01/2019.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageLink: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var image = UIImage()
    var name = ""
    var descriptions = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageLink.image = image
        
        nameLabel.text = name
        
        descriptionLabel.text = descriptions

    }
    
    

}
