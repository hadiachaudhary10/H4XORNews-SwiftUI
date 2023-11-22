//
//  NetworkManager.swift
//  H4XORNews-SwiftUI
//
//  Created by Dev on 25/08/2022.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(){
        
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { [weak self] (data, urlResponse, error) in
                
                
                guard let strongself = self else {return}
                
                if error != nil {
                    print (error!)
                }
                else{

                    if let safeData = data{
                        let decoder = JSONDecoder()
                        
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                strongself.posts = results.hits
                            }
                            
                        }
                        catch{
                            print(error)
                        }
                    
                    }
                }
                
            }
            task.resume()
        }
    
    }
    
}
