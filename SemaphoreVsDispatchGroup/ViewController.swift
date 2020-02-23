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
        let dispatchGroup = DispatchGroup()
        fetchImage { (_,_) in
            print("Finsihed fetching image 1")
        }
        fetchImage { (_,_) in
            print("Finsihed fetching image 2")
        }
        fetchImage { (_,_) in
            print("Finsihed fetching image 3")
        }
        dispatchGroup.notify(queue: .main) {
            print("Finished feetching images.")
        }
        print("Waiting for images to finish fetching...")
    }
    func fetchImage(completion: @escaping (UIImage?, Error?) -> ()) {
        guard let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/5a90871e-408a-46da-a43c-210348a67082")
            else {
                return }
        URLSession.shared.dataTask(with: url) {
            (data, resp, err) in
            completion(UIImage(data: data ?? Data()), nil)
        }
    .resume()
    }
}

