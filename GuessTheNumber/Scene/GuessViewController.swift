
import UIKit

class GuessViewController: UIViewController {
  // MARK: IBOutlet
  @IBOutlet weak var remainingLabel: UILabel!
  @IBOutlet weak var helpLabel: UILabel!
  @IBOutlet weak var textField: UITextField!
  // MARK: Variables
  private var remaining = 5
  private var randomNumber : Int?
  private var result : Bool?
  override func viewDidLoad() {
    super.viewDidLoad()
    // Creating gesture recognizer to hide keyboard when you tap anywhere on the screen
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    view.addGestureRecognizer(gestureRecognizer)
    // Creating random number between 0 and 50
    randomNumber = Int(arc4random_uniform(50))
  }
  // Hide keyboard method
  @objc func hideKeyboard(){
    view.endEditing(true)
  }
  
  @IBAction func guessButton(_ sender: Any) {
    helpLabel.isHidden = false
    // Optional binding
    if let number = textField.text {
      // Casting
      if let newNumber = Int(number){
        // Control the remaining chance
        if remaining > 0 {
          remaining -= 1
          if newNumber == randomNumber!{
            performSegue(withIdentifier: Constants.ControllerName.toFinishVC.rawValue, sender: true)
          }
          if newNumber > randomNumber! {
            helpLabel.text = "Decrease"
          }
          if newNumber < randomNumber! {
            helpLabel.text = "Increase"
          }
        } else {
          performSegue(withIdentifier: Constants.ControllerName.toFinishVC.rawValue, sender: false)
          remainingLabel.text = "Remaining Chance: \(String(remaining))"
        }
      } else {
        // Creating alert if user enter nil
        let alertController = createAlertController(title: "Attention", message: "Fill in the blank")
        let alertAction = createAlertAction(title: "OK")
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
      }
    }
    // Cleaning text field
    textField.text = ""
    remainingLabel.text = "Remaining Chance: \(String(remaining))"
  }
  // Alert action method
  func createAlertAction(title: String) -> UIAlertAction {
    let alertAction = UIAlertAction(title: title, style: .default)
    return alertAction
  }
  // Alert controller method
  func createAlertController(title: String, message: String) -> UIAlertController{
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    return alertController
  }
  // Listen to segue
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if sender is Bool{
      if segue.identifier == Constants.ControllerName.toFinishVC.rawValue{
        let destination = segue.destination as! FinishViewController
        destination.result = sender as? Bool
      }
    }
  }
}
