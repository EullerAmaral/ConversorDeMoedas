import UIKit

class CoinValue: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    enum Money: Double {
        case dolarToReal = 5.99
        case realToDolar = 0.20
        case euroToReal = 5.5
        case realToEuro = 0.18
        case dolarToEuro = 0.91
        case euroToDolar = 1.10
    }
}
