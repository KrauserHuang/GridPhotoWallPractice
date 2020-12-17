//
//  PhotoCollectionViewController.swift
//  GridPhotoWallPractice
//
//  Created by Tai Chin Huang on 2020/12/14.
//

import UIKit

private let reuseIdentifier = "PhotoCollectionViewCell"

class PhotoCollectionViewController: UICollectionViewController {
    
    struct PropertyKeys {
        static let PhotoCollectionViewCell = "PhotoCollectionViewCell"
    }
    
    var photos = [
        "photo0", "photo1", "photo2", "photo3", "photo4", "photo5", "photo6", "photo7", "photo8", "photo9", "photo10", "photo11", "photo12", "photo13", "photo14", "photo15", "photo16", "photo17", "photo18", "photo19", "photo20",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //用程式建立cell，這邊用storyboard拉所以用不到
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        //cell and cell spacing
        let itemSpace: CGFloat = 3
        //how many colume in a row
        let columeCount: CGFloat = 3
        //將collectionViewLayout轉型成UICollectionViewFlowLayout(向下捲動)
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        //計算cell寬度，利用畫面的寬減去要的間距然後再除以要拆分成幾格(這樣可以避開不同的型號的iphone算出對應的寬度
        let width = floor((collectionView.bounds.width-itemSpace*(columeCount-1))/columeCount)
        //設定cell的大小
        flowLayout?.itemSize = CGSize(width: width, height: width)
        //設成zero才會根據itemSize來設定cell大小，不然會被autoLayout條件影響(如果有額外設定cell autoLayout)
        flowLayout?.estimatedItemSize = CGSize.zero
        //定義cell間的間距(左右間距)
        flowLayout?.minimumInteritemSpacing = itemSpace
        //定義colume間的間距(上下間距)
        flowLayout?.minimumLineSpacing = itemSpace
        //定義cell到編框間的間距(上下左右)
//        flowLayout?.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PropertyKeys.PhotoCollectionViewCell, for: indexPath) as! PhotoCollectionViewCell
        // Configure the cell
        //直接抓圖庫的圖片
//        cell.photoImageView.image = UIImage(named: "photo\(indexPath.item)")
        //藉由變數photos利用indexPath判斷要顯示哪個item
        cell.photoImageView.image = UIImage(named: "\(photos[indexPath.item])")
        return cell
    }

    @IBSegueAction func showDetail(_ coder: NSCoder) -> UIViewController? {
//        guard let item = collectionView.indexPathsForSelectedItems else { return nil }
        //利用indexPathsForSelectedItems?.first?.item(row)來對應要顯示的物件
        guard let item = collectionView.indexPathsForSelectedItems?.first?.item else { return nil }
        let controller = DetailViewController(coder: coder)
        controller?.imageName = photos[item]
        return controller
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
