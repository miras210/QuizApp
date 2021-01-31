//
//  FinishViewController.swift
//  QuizApp
//
//  Created by Miras Alimov on 30.01.2021.
//

import UIKit

class FinishViewController: UIViewController {
    
    var delegate: QuizViewControllerDelegate?
    var mainDelegate: ViewControllerDelegate?

    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        // Do any additional setup after loading the view.
    }
    
    func updateData() {
        scoreLabel.text = "Congrats \(delegate?.getScore() ?? 0)/10"
        mainDelegate?.setScore((delegate?.getScore())!)
    }
    
    @IBAction func tryAgainButtonIsPressed(_ sender: Any) {
        delegate?.refreshData()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func mainPageButtonIsPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
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
