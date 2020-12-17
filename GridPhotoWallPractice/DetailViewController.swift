//
//  DetailViewController.swift
//  GridPhotoWallPractice
//
//  Created by Tai Chin Huang on 2020/12/15.
//

import UIKit

class DetailViewController: UIViewController {
    var imageName = ""
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        imageView.image = UIImage(named: "photo\(indexPath.item)")
        imageView.image = UIImage(named: imageName)
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
