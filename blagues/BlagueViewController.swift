//
//  BlagueViewController.swift
//  blagues
//
//  Created by formation on 10/05/2021.
//


import UIKit
import Alamofire

class BlagueViewController: UIViewController {
        
    var theme: String?
    let domaineUrl = "https://www.blagues-api.fr/api"
    let token: String =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMTU3MDc3MTcwMzc0NzA1MTUyIiwibGltaXQiOjEwMCwia2V5IjoidnFQazVZWGl6Umk1dktYbWxzeXFIUmJJOFRObDAwN3V5bG5TYkVRakF0OUZ2TVRtVVYiLCJjcmVhdGVkX2F0IjoiMjAyMS0wNS0xMlQwNzowODowNCswMDowMCIsImlhdCI6MTYyMDgwMzI4NH0.Gjn5W0ldQ8mRTchYm5b4OLeyVLbLnNJ3fMuzMApIQRw"
    var currentJoke: Blague?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let header: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        let url = "\(domaineUrl)/type/\(theme!)/random"
            
        AF.request(url, headers: header).responseJSON { response in
            print(response)
            
        }
    }

}


struct Blague: Codable {
    var id: Int
    var type: String
    var joke: String
    var answer: String
}

//protocol EasyRequestDelegate: class {
//    func onError()
//}
//
//public struct EasyRequest<Model: Codable> {
//    public typealias SuccessCompletionHandler = (_ response: Model) -> Void
//
//    static func get(_ delegate: EasyRequestDelegate?, path: String, url: String, success successCallback: @escaping SuccessCompletionHandler) {
//        guard let urlComponent = URLComponents(string: url), let usableUrl = urlComponent.url else {
//            delegate?.onError()
//            return
//        }
//
//        var request = URLRequest(url: usableUrl)
//        request.httpMethod = "GET"
//
//        var dataTask: URLSessionTask?
//        let defaultSession = URLSession(configuration: .default)
//
//        dataTask = defaultSession.dataTask(with: request) { data, response, error in
//            defer {
//                dataTask = nil
//            }
//            if error != nil {
//                delegate?.onError()
//            } else if
//                let data = data,
//                let response = response as? HTTPURLResponse, response.statusCode == 200 {
//                    guard let model = self.parsedModel(with: data, at: path)
//                else {
//                    delegate?.onError()
//                    return
//                }
//                successCallback(model)
//            }
//        }
//        dataTask?.resume()
//    }
//
//    static func parsedModel(with data: Data, at path: String) -> Model? {
//        do {
//            let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
//            if let dictAtPath = json?.value(forKeyPath: path) {
//                let jsonData = try JSONSerialization.data(withJSONObject: dictAtPath, options: .prettyPrinted)
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let model = try decoder.decode(Model.self, from: jsonData)
//                return model
//            } else {
//                return nil
//            }
//        } catch {
//            return nil
//        }
//    }
//}
//
//extension ViewController: EasyRequestDelegate {
//    func onError() {
//        DispatchQueue.main.async() {
//            let alert = UIAlertController(title: "Ups", message: "An error has occured...", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true)
//        }
//    }
//}
//
