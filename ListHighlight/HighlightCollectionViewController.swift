//
//  HighlightCollectionViewController.swift
//  ListHighlight
//
//  Created by nagisa-kosuge on 2017/09/05.
//  Copyright © 2017年 RyoKosuge. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel?

    lazy var selectedView: UIView = UIView()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectedBackgroundView = selectedView
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // ここでframeを指定すると、そのframeでのHighlight表示になる
        selectedView.frame = self.bounds.insetBy(dx: 8, dy: 8)

        // もしCollectionViewの子Viewが全部覆うようなレイアウトの場合は一番上に出さなければならない
        self.bringSubview(toFront: selectedView)
    }

    func configure(_ item: Item) {
        textLabel?.text = item.name
        textLabel?.textColor = item.color
        self.selectedView.backgroundColor = item.color
    }

}

private let collectionViewCellIdentifier: String = "CollectionViewCell"

class HighlightCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView?

    lazy var data: [Item] = Item.generates()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HighlightCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let itemWidth = floor(width / 3)
        return CGSize(width: itemWidth, height: itemWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }

}

extension HighlightCollectionViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath)
        if let c = cell as? CollectionViewCell {
            let item = data[indexPath.item]
            c.configure(item)
        }
        return cell
    }

}
