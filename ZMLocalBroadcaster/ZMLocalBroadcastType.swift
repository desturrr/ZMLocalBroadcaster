//
//  ZMLocalBroadcastType.swift
//  Zamekan
//
//  Created by Suat Karakusoglu on 11.06.2018.
//  Copyright © 2018 suat.karakusoglu. All rights reserved.
//

import Foundation

typealias ZMBroadcastReceivedBlock = ([AnyHashable: Any]?) -> Void

enum ZMLocalBroadcastType: String
{
    case someMagicHappened
    
    func broadcast(with data: [AnyHashable: Any]? = nil)
    {
        debugPrint("Broadcasting: \(self.rawValue) with data: \(data?.description ?? " none")")
        NotificationCenter.default.post(
            name: self.createNotificationName(),
            object: nil,
            userInfo: data
        )
    }
    
    func observeBroadcast(receivingBlock: @escaping ZMBroadcastReceivedBlock) -> ZMLocalBroadcastObserver
    {
        let localObserver = ZMLocalBroadcastObserver(
            broadcastType: self,
            broadcastReceived: receivingBlock
        )
        
        localObserver.startObserving()
        return localObserver
    }
    
    func createNotificationName() -> Notification.Name
    {
        return Notification.Name(self.rawValue)
    }
}
