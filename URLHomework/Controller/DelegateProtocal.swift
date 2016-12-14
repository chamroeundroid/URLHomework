//
//  DelegateProtocal.swift
//  URLHomework
//
//  Created by Chamroeun Chun on 12/14/16.
//  Copyright © 2016 Chamroeun Chun. All rights reserved.
//

import Foundation
@objc public  protocol DelegateProtocal{
    @objc optional func FetchDataResponseSuccess(responseData: Array<AnyObject>)
    @objc optional func FetchErrorFromClient(errorMessage:NSError)
    @objc optional func FetchDataResponseHTTPEroro(responseError:HTTPURLResponse)
}
