//
//  CollectionViewController.swift
//  Todolist
//
//  Created by 许佳强 on 16/5/4.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView1: UICollectionView!
    
    var images = ["AppIcon57x57","AppIcon57x57","AppIcon57x57","AppIcon57x57","AppIcon57x57","AppIcon57x57","AppIcon57x57","AppIcon57x57","AppIcon57x57"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView1.dataSource = self
        collectionView1.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        
        return images.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell:UICollectionViewCell = collectionView1.dequeueReusableCellWithReuseIdentifier("xjqcollection", forIndexPath: indexPath)
        let image:UIImageView = cell.viewWithTag(1) as! UIImageView
        image.image = UIImage(named: images[indexPath.row])
        
        return cell
        
    }

    

}
