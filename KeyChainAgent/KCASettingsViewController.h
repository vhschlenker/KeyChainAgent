//
//  KCASettingsViewController.h
//  KeyChainAgent
//
//  Created by Michael Starke on 11/11/15.
//  Copyright © 2015 HicknHack Software GmbH. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class KCAKeyChainAgent;

@interface KCASettingsViewController : NSViewController

@property (weak) KCAKeyChainAgent *plugin;

@end
