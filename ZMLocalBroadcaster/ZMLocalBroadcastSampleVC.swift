//
//  ZMLocalBroadcastSampleVC.swift
//  ZMLocalBroadcaster
//
//  Created by Suat Karakusoglu on 14.06.2018.
//  Copyright © 2018 Suat Karakusoglu. All rights reserved.
//

import UIKit

class ZMLocalBroadcastSampleVC: UIViewController {
    
    var observerMagicHappened: ZMLocalBroadcastObserver?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.observerMagicHappened = ZMLocalBroadcastType.someMagicHappened.observeBroadcast {[weak self] (data) in
            guard let sSelf = self else { return }

            if let magicName = data?["magicName"] as? String
            {
                print("\(magicName) is magic")
            }
        }
    }

    deinit
    {
        self.observerMagicHappened?.stopObserving()
    }
}
