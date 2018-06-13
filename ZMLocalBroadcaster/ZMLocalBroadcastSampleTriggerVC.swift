//
//  ZMLocalBroadcastSampleTriggerVC.swift
//  ZMLocalBroadcaster
//
//  Created by Suat Karakusoglu on 14.06.2018.
//  Copyright © 2018 Suat Karakusoglu. All rights reserved.
//

import UIKit

class ZMLocalBroadcastSampleTriggerVC: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ZMLocalBroadcastType.someMagicHappened.broadcast(with: ["magicName": "knockKnockMagic"])
    }
}
