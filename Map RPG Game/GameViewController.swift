import UIKit
import Firebase
import Foundation

protocol GameViewControllerDelegate {
    func didFinishGame(success: Bool, territory: Territory)
}

class GameViewController: UIViewController {
    
    @IBOutlet weak var territoryLabel: UILabel!
    @IBOutlet weak var factionLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var attemptsLabel: UILabel!
    var target: Float = 0
    var faction: String = ""     //recieved from UserProfile/Firebase
    var attempts: Int = 3
    var delegate: GameViewControllerDelegate?
    var territory: Territory!
    
    // gather information from cocopods about who currently owns the territory - faction
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        territoryLabel.text = "Location: " + "\(territory)"
        attemptsLabel.text = "\(attempts)" + " attempts left"
        factionLabel.text = "\(faction)" + " Territory"
        //change colour of background
    }
    
    func generateRandomNumber() {
        target = Float.random(in: 0...100).rounded()
        targetLabel.text = "Target Value = "+"\(target)"
    }
    
    @IBAction func claimButton(_ sender: Any) {
        
//        territory.color = .purple
//        delegate?.didFinishGame(success: true, territory: territory)
//        dismiss(animated: true, completion: nil)
        
        
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
        else {
            territory.color = .purple
            delegate?.didFinishGame(success: true, territory: territory)
            dismiss(animated: true, completion: nil)
            // Store values of user's faction + update the values of the location and dismiss the slide back to the MapView. That way the mapView can look at the information in the database for the mapView annotations instead of having to pass information between two VC's

        }
        if attempts == 0 {
            dismiss(animated: true, completion: nil)//dismiss the slide if they fail 3 times (+ unable to try again until xyz amount of time passes.)
        }
    }
}

//extension GameViewController: SendDelegate {
//    func userSelectTerritory(data: Territory) {
//
//    }
//}
