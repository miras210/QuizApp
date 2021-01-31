//
//  HistoryViewController.swift
//  QuizApp
//
//  Created by Miras Alimov on 30.01.2021.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var delegate: ViewControllerDelegate?
    var history: [Score] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        history = (delegate?.getHistory())!
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryTableViewCell")
        tableView.tableFooterView = UIView()
    }
    

}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        let item = history[indexPath.row]
        cell.attemptLabel.text = item.title
        cell.scoreLabel.text = "\(item.points ?? 0)/\(item.numOfQuestions ?? 0)"
        return cell
    }
    
    
}
