

import UIKit
import QuartzCore
import Alamofire

class StockDetailViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func refresh(owner:String, code:String) {
        Alamofire.request(Model.Router.StockDetail(owner, code)).validate().response {
            (request, response, nsdata, error) -> Void in
            let dataString  = NSString(data: nsdata as! NSData, encoding:CFStringConvertEncodingToNSStringEncoding(0x0632))
            println(dataString)
        }
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.setToolbarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setToolbarHidden(true, animated: true)
    }
    


}

