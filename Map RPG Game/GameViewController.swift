import UIKit
import Foundation

class GameViewController: UIViewController {
    @IBOutlet weak var territoryLabel: UILabel!
    @IBOutlet weak var factionLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var attemptsLabel: UILabel!
    var target: Float = 0
    var territory: String = ""
    var attempts: Int = 3
    // gather information from cocopods about who currently owns the territory
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        territoryLabel.text = "Bournemouth Uni"
        attemptsLabel.text = "\(attempts)" + " attempts left"
        factionLabel.text = "Team Instinct Territory"
        //change colour of background
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        generateRandomNumber()
        slider.value = slider.minimumValue
    }
    
    func generateRandomNumber() {
        target = Float.random(in: 0...100).rounded()
        targetLabel.text = "Target Value = "+"\(target)"
    }
    
    @IBAction func claimButton(_ sender: Any) {
        let score = slider.value.rounded() - target
        resultLabel.text = "\(score)"
    
        if score > 5 {generateRandomNumber()
            attempts = attempts - 1
            attemptsLabel.text = "\(attempts)" + " attempts left"
        }
        else if score < -5 {generateRandomNumber()
            attempts = attempts - 1
            attemptsLabel.text = "\(attempts)" + " attempts left"
            
        }
    }
    
}
