//
//  FirstViewController.swift
//  URLHomework
//
//  Created by Chamroeun Chun on 12/14/16.
//  Copyright © 2016 Chamroeun Chun. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,DelegateProtocal {
    var delegate:DelegateProtocal?
    var data:[String:Any]? = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(){
        
        let url = URL(string: "http://120.136.24.174:1301/v1/api/articles?page=1&limit=15")!
        
        let request = NSMutableURLRequest(url:url)
        request.setValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let getTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if error != nil{
                print(error!)
            }else{
                
                if let urlContent = data{
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print("----This is my data-----",jsonResult)
                        
                    }catch{
                        print("JSON Processing Failed")
                    }
                }
            }
        }
        getTask.resume()
    }

    private func FetchDataResponseHTTPEroro(errorResponse: HTTPURLResponse) {
        print("Server error code \(errorResponse.statusCode)")
        print("Server error \(errorResponse)")
    }
    
    func FetchErrorFromClient(errorMessage: NSError) {
        print("Error : \(errorMessage)")
    }
    
    private func FetchDataResponseSuccess(responseData: [String : AnyObject]) {
        print("Success \(responseData)")
    }
}
