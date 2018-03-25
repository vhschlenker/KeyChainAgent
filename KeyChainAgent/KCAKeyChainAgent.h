//
//  KCAKeyChainAgent.h
//  KeyChainAgent
//
//  Created by Michael Starke on 11/11/15.
//  Copyright © 2015 HicknHack Software GmbH. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MPPlugin.h"


FOUNDATION_EXPORT NSUInteger const kKeePassHTTPDefaultPort;

FOUNDATION_EXPORT NSString *const kKCASettingsKeyShowMenuItem;
FOUNDATION_EXPORT NSString *const kKCASettingsKeyHttpPort;
FOUNDATION_EXPORT NSString *const kKCASettingsKeyAllowRemoteConnections;
FOUNDATION_EXPORT NSString *const kKCASettingsKeyShowNotifications;
FOUNDATION_EXPORT NSString *const kKCASettingsKeyIncludeKPHStringFields;

@class KCAServerDelegate;

@interface KCAKeyChainAgent : MPPlugin <MPPluginSettings>

@property (strong,readonly) KCAServerDelegate *serverDelegate;

@end
