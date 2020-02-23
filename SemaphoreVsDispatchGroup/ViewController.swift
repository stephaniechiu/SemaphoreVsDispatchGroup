//
//  ViewController.swift
//  SemaphoreVsDispatchGroup
//
//  Created by Stephanie on 2/23/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sharedResource = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dispatchQueue = DispatchQueue.global(qos: .background)
        
        dispatchQueue.async {
            
            self.fetchImage { (_, _) in
                print("Finished fetching image 1")
                self.sharedResource.append("1")
                semaphore.signal()
            }
            semaphore.wait()
            
            self.fetchImage { (_, _) in
                print("Finished fetching image 2")
                self.sharedResource.append("1")
                semaphore.signal()
            }
            semaphore.wait()
            
            self.fetchImage { (_, _) in
                print("Finished fetching image 3")
                self.sharedResource.append("1")
                semaphore.signal()
            }
            semaphore.wait()
        }

//        let dispatchGroup = DispatchGroup()
//
//        dispatchGroup.enter()
//        fetchImage { (_,_) in
//            print("Finished fetching image 1")
//            dispatchGroup.leave()
//        }
//
//        dispatchGroup.enter()
//        fetchImage { (_,_) in
//            print("Finished fetching image 2")
//            dispatchGroup.leave()
//        }
//
//        dispatchGroup.enter()
//        fetchImage { (_,_) in
//            print("Finished fetching image 3")
//            dispatchGroup.leave()
//        }
//
//        dispatchGroup.notify(queue: .main) {
//            print("Finished fetching images.")
//        }
//        print("Waiting for images to finish fetching...")
//    }
//    func fetchImage(completion: @escaping (UIImage?, Error?) -> ()) {
//        guard let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/5a90871e-408a-46da-a43c-210348a67082")
//            else {
//                return }
//        URLSession.shared.dataTask(with: url) {
//            (data, resp, err) in
//            completion(UIImage(data: data ?? Data()), nil)
//        }
//    .resume()
    }
}

