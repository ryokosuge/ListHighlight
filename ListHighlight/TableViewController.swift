//
//  TableViewController.swift
//  ListHighlight
//
//  Created by nagisa-kosuge on 2017/09/05.
//  Copyright © 2017年 RyoKosuge. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    lazy var selectedView: UIView = UIView()

    override func awakeFromNib() {
        super.awakeFromNib()

        self.selectedBackgroundView = selectedView
    }

    func configure(_ item: Item) {
        self.textLabel?.text = item.name
        self.textLabel?.textColor = item.color
        self.selectedView.backgroundColor = item.color
    }

}

private let tableViewCellIdentifier: String = "TableViewCell"

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?

    lazy var data: [Item] = Item.generates()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TableViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRow:    \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension TableViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath)
        if let c = cell as? TableViewCell {
            let item = data[indexPath.row]
            c.configure(item)
        }
        return cell
    }

}
