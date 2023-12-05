//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
        
    @IBOutlet var animalResultLabel: UILabel!
    @IBOutlet var animalResultDescriptionLabel: UILabel!
    
    var chosenAnswers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        showChoosenAnimal()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

private extension ResultViewController {
    func getMostRatedAnimal() -> Animal? {
        
        var animalsCount: [Animal: Int] = [:]
        
        chosenAnswers.forEach { answer in
            animalsCount[answer.animal, default: 0] += 1
        }
        
        let mostRatedAnimal = animalsCount.max { a, b in a.value < b.value }?.key
       
        return mostRatedAnimal
        
    }
    
    func showChoosenAnimal() {
        let chosenAnimal = getMostRatedAnimal()
        let chosenAnimalTextForLabel = "Вы - \(chosenAnimal?.rawValue ?? "🐙")"
        animalResultLabel.text = chosenAnimalTextForLabel
        animalResultDescriptionLabel.text = chosenAnimal?.definition ?? "Вы осьминог"
    }
}
