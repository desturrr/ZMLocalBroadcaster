//
//  ZMLocalBroadcastObserver.swift
//  Zamekan
//
//  Created by Suat Karakusoglu on 11.06.2018.
//  Copyright © 2018 suat.karakusoglu. All rights reserved.
//

import Foundation

class ZMLocalBroadcastObserver
{
    var broadcastObserverUID: String = ZMLocalBroadcastObserver.randomUID(length: 12)
    var broadcastType: ZMLocalBroadcastType
    var broadcastReceivedBlock: ZMBroadcastReceivedBlock
    
    init(broadcastType: ZMLocalBroadcastType, broadcastReceived: @escaping ZMBroadcastReceivedBlock)
    {
        self.broadcastType = broadcastType
        self.broadcastReceivedBlock = broadcastReceived
    }
    
    func startObserving()
    {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(executeBroadcastReceiver(notification:)),
            name: self.broadcastType.createNotificationName(),
            object: nil
        )
    }
    
    @objc func executeBroadcastReceiver(notification: Notification)
    {
        debugPrint("Received broadcast data: \(notification.userInfo?.description ?? " none") on observer observer uid: \(self.broadcastObserverUID)")
        self.broadcastReceivedBlock(notification.userInfo)
    }
    
    func stopObserving()
    {
        NotificationCenter.default.removeObserver(
            self,
            name: self.broadcastType.createNotificationName(),
            object: nil
        )
        
        debugPrint("Stopped observing via observer uid \(self.broadcastObserverUID)")
    }
    
    private class func randomUID(length: Int = 20) -> String
    {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}
