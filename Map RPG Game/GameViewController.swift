import UIKit
import Foundation

class GameViewController: UIViewController {
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    var target: Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        generateRandomNumber()
        slider.value = slider.minimumValue
    }
    
    func generateRandomNumber() {
        target = Float.random(in: 0...100).rounded()
        targetLabel.text = "Target = "+"\(target)"
    }
    
    @IBAction func claimButton(_ sender: Any) {
        let score = slider.value.rounded() - target
        resultLabel.text = "\(score)"
    
        if score > 5 {generateRandomNumber()}
        else if score < -5 {generateRandomNumber()}
    }
    
}
