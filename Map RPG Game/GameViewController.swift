import UIKit
import Firebase
import Foundation

class GameViewController: UIViewController {
    @IBOutlet weak var territoryLabel: UILabel!
    @IBOutlet weak var factionLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var attemptsLabel: UILabel!
    var target: Float = 0
    var territory: String = ""      //recieved from MapVC
    var faction: String = ""     //recieved from UserProfile
    var attempts: Int = 3
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
            attemptsLabel.text = "Congratulations! Territory Claimed!"
            // Store values of user's faction + update the values of the location and dismiss the slide back to the MapView. That way the mapView can look at the information in the database for the mapView annotations instead of having to pass information between two VC's
            //save value of
        }
        func failAttemptToClaim() {
            if attempts == 0 {
                dismiss(animated: true, completion: nil)
                //(save value of 'fail' to database - prevent user from accessing same location until XYZ time passes.)
            }
        }
        //dismiss the slide if they fail 3 times (+ unable to try again until xyz amount of time passes.)
    }
}

//extension GameViewController: SendDelegate {
//    func userSelectTerritory(data: Territory) {
//
//    }
//}
