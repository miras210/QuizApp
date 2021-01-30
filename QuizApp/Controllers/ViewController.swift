//
//  ViewController.swift
//  QuizApp
//
//  Created by Miras Alimov on 26.01.2021.
//

import UIKit

protocol ViewControllerDelegate {
    func getQuiz()->([Question])
    func setScore(_ score: Int)
}

class ViewController: UIViewController {
    var quiz = [Question]()
    var history = [Score]()

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuiz()
    }

    
    func loadQuiz() {
        quiz.append(Question(id: 1, question: "2+2", ans: ["1","2","3","4"], correctAns: 3, chosen: -1))
        quiz.append(Question(id: 2, question: "e^(i*pi)", ans: ["1","0","-1","e"], correctAns: 2, chosen: -1))
        quiz.append(Question(id: 3, question: "cos(pi)", ans: ["-1","0","1","1/2"], correctAns: 0, chosen: -1))
        quiz.append(Question(id: 4, question: "My name", ans: ["Amir","Miras","Sungat","Alemkhan"], correctAns: 1, chosen: -1))
        quiz.append(Question(id: 5, question: "What am I playing", ans: ["Dota 2","VALORANT","CS:GO","Nothing"], correctAns: 1, chosen: -1))
        quiz.append(Question(id: 6, question: "Mechanics = Statics, Dynamics, ?", ans: ["Quantums","Kinematics","Electrics","No Answer"], correctAns: 1, chosen: -1))
        quiz.append(Question(id: 7, question: "This app was written on ?", ans: ["Objective-C","Java","Swift","Kotlin"], correctAns: 2, chosen: -1))
        quiz.append(Question(id: 8, question: "pi", ans: ["Natural","Rational","Integer","Irrational"], correctAns: 3, chosen: -1))
        quiz.append(Question(id: 9, question: "sqrt(2)", ans: ["Natural","Rational","Integer","Irrational"], correctAns: 3, chosen: -1))
        quiz.append(Question(id: 10, question: "Is this quiz good ?", ans: ["No","Yes","Yes","Yes"], correctAns: 0, chosen: -1))
    }

    @IBAction func playIsPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "QuizViewController") as! QuizViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func historyIsPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "HistoryViewController") as! HistoryViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: ViewControllerDelegate {
    func setScore(_ score: Int) {
        history.append(Score(title: "Attempt #\(history.count)", points: score))
    }
    
    func getQuiz() -> ([Question]) {
        return quiz
    }
}

