//
//  KCAServerDelegate.h
//  KeyChainAgent
//
//  Created by Michael Starke on 13/11/15.
//  Copyright © 2015 HicknHack Software GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KeePassHTTPKit/KeePassHTTPKit.h>

@interface KCAServerDelegate : NSObject <KPHDelegate>

- (void)clearPermissions;
- (void)clearKeys;

@end
