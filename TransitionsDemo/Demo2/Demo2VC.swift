//
//  Demo2VC.swift
//  TransitionsDemo
//
//  Created by 也许、 on 2017/10/15.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

let SCREEN_W = UIScreen.main.bounds.width
let SCREEN_H = UIScreen.main.bounds.height
let NAV_H:CGFloat = 64
private let cellId = "cellid"
class Demo2VC: UIViewController {
    
    lazy var collectionView:UICollectionView = {
        let margin:CGFloat = 2
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = 2
        flowLayout.itemSize = CGSize(width: SCREEN_W / 2 - margin, height: SCREEN_W / 2)
        let collectionView:UICollectionView = UICollectionView(frame: CGRect(x: 0, y: NAV_H, width: SCREEN_W, height: SCREEN_H - NAV_H), collectionViewLayout: flowLayout)
        collectionView.register(UINib.init(nibName: "Demo2Cell", bundle: nil) , forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = UIColor.init(red: 255, green: 68, blue: 102, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    var selectedCell:Demo2Cell?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 设置导航栏控制器的委托为当前控制器
        self.navigationController?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

extension Demo2VC {
    func setupUI() {
        self.title = "转场2"
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
    }
}

extension Demo2VC : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! Demo2Cell
        cell.titleLabel.text = "第\(indexPath.item + 1)条"
        cell.contentImageView.image = UIImage(named: "demo2")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedCell = collectionView.cellForItem(at: indexPath) as? Demo2Cell
        let photosVC = PhotosVC()
        photosVC.image = self.selectedCell?.contentImageView.image
        self.navigationController?.pushViewController(photosVC, animated: true)
        
    }
    
}

// 实现委托方法
extension Demo2VC : UINavigationControllerDelegate {
    
    // 导航栏的转场委托方法与 present形式的转场委托方法不同，需要注意
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return Demo2AnimationManager(type: .push)
        }
        return nil
    }
    
}






























