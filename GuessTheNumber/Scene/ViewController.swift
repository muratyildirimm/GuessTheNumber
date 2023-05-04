
import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  // MARK: IBAction
  @IBAction func startButton(_ sender: Any) {
    performSegue(withIdentifier: Constants.ControllerName.toGuessVC.rawValue , sender: nil)
  }
}
