//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Miras Alimov on 30.01.2021.
//

import UIKit

protocol QuizViewControllerDelegate {
    func getScore()->Int
    func refreshData()
}

class QuizViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    var questionId = 0
    var score = 0
    var questions: [Question] = []

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    @IBOutlet weak var fourthOptionButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = (delegate?.getQuiz())!
        refreshData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        prepareData()
    }

    
    func prepareData() {
        if questionId == 0 {
            prevButton.isHidden = true;
        } else {
            prevButton.isHidden = false;
        }
        if questionId == questions.count-1 {
            nextButton.setTitle("Submit", for: .normal)
        } else {
            nextButton.setTitle("Next", for: .normal)
        }
        let question = questions[questionId]
        questionLabel.text = question.question
        firstOptionButton.setTitle(question.ans[0], for: .normal)
        secondOptionButton.setTitle(question.ans[1], for: .normal)
        thirdOptionButton.setTitle(question.ans[2], for: .normal)
        fourthOptionButton.setTitle(question.ans[3], for: .normal)
//        firstOptionButton.titleLabel?.text = question.ans[0]
//        secondOptionButton.titleLabel?.text = question.ans[1]
//        thirdOptionButton.titleLabel?.text = question.ans[2]
//        fourthOptionButton.titleLabel?.text = question.ans[3]
        
        firstOptionButton.backgroundColor = .link
        secondOptionButton.backgroundColor = .link
        thirdOptionButton.backgroundColor = .link
        fourthOptionButton.backgroundColor = .link
        
        if question.chosen != -1 {
            firstOptionButton.isEnabled = false;
            secondOptionButton.isEnabled = false;
            thirdOptionButton.isEnabled = false;
            fourthOptionButton.isEnabled = false;
            var btn = firstOptionButton
            var corBtn = firstOptionButton
            switch question.correctAns {
            case 0:
                corBtn = firstOptionButton
            case 1:
                corBtn = secondOptionButton
            case 2:
                corBtn = thirdOptionButton
            case 3:
                corBtn = fourthOptionButton
            case .none: break
            case .some(_): break
            }
            switch question.chosen {
            case 0:
                btn = firstOptionButton
            case 1:
                btn = secondOptionButton
            case 2:
                btn = thirdOptionButton
            case 3:
                btn = fourthOptionButton
            case .none: break
            case .some(_): break
            }
            if question.chosen == question.correctAns {
                btn?.backgroundColor = .systemGreen
                score += 1
            } else {
                corBtn?.backgroundColor = .systemGreen
                btn?.backgroundColor = .systemRed
            }
        } else {
            firstOptionButton.isEnabled = true;
            secondOptionButton.isEnabled = true;
            thirdOptionButton.isEnabled = true;
            fourthOptionButton.isEnabled = true;
        }
    }
    
    @IBAction func prevIsPressed(_ sender: Any) {
        questionId -= 1
        prepareData()
    }
    
    @IBAction func nextIsPressed(_ sender: Any) {
        if questionId == questions.count-1 {
            let vc = storyboard?.instantiateViewController(identifier: "FinishViewController") as! FinishViewController
            vc.delegate = self
            vc.mainDelegate = delegate
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        questionId += 1
        prepareData()
    }
    
    @IBAction func answerIsPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            questions[questionId].chosen=0
        case 2:
            questions[questionId].chosen=1
        case 3:
            questions[questionId].chosen=2
        case 4:
            questions[questionId].chosen=3
        default:
            break
        }
        prepareData()
    }

}

extension QuizViewController: QuizViewControllerDelegate {
    func refreshData() {
        questionId = 0
        score = 0
        for i in 0..<questions.count {
            questions[i].chosen = -1
        }
    }
    
    func getScore() -> Int {
        return score
    }
}
