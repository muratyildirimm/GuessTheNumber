
import UIKit

class FinishViewController: UIViewController {
  
  // MARK: IBOutlet
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  // MARK: Variable
  private var result : Bool?
  override func viewDidLoad() {
    super.viewDidLoad()
    // Hide back button
    navigationItem.hidesBackButton = true
    navigationItem.title = "Result Page"
    if result == false {
      imageView.image = UIImage(named: Constants.ImageName.SadImage.rawValue)
      resultLabel.text = Constants.GameResult.youLost.rawValue
    }else if result == true{
      imageView.image = UIImage(named: Constants.ImageName.SmileImage.rawValue)
      resultLabel.text = Constants.GameResult.youWon.rawValue
    }
  }
  // Again Button
  @IBAction func againButton(_ sender: Any) {
    navigationController?.popToRootViewController(animated: true)
  }
}
