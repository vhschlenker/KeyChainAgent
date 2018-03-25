//
//  KCASettingsViewController.m
//  KeyChainAgent
//
//  Created by Michael Starke on 11/11/15.
//  Copyright © 2015 HicknHack Software GmbH. All rights reserved.
//

#import "KCASettingsViewController.h"
#import "KCAKeyChainAgent.h"
#import "KCAServerDelegate.h"

@interface KCASettingsViewController ()

@property (weak) IBOutlet NSTextField *portTextField;
@property (weak) IBOutlet NSButton *showMenuItemCheckButton;
@property (weak) IBOutlet NSButton *showNotificationsCheckButton;
@property (weak) IBOutlet NSButton *allowRemoteConnectionCheckButton;

- (IBAction)clearKeys:(id)sender;
- (IBAction)clearPermissions:(id)sender;

@end

@implementation KCASettingsViewController

- (void)dealloc {
  NSLog(@"%@ dealloc", [self class]);
  [self.portTextField unbind:NSValueBinding];
  [self.showMenuItemCheckButton unbind:NSValueBinding];
}

- (NSBundle *)nibBundle {
  return [NSBundle bundleForClass:[self class]];
}

- (NSString *)nibName {
  return @"KeyChainAgentSettings";
}

- (void)awakeFromNib {
  static BOOL didAwake = NO;
  if(!didAwake) {
    NSUserDefaultsController *defaultsController = [NSUserDefaultsController sharedUserDefaultsController];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.allowsFloats = NO;
    formatter.alwaysShowsDecimalSeparator = NO;
    self.portTextField.formatter = formatter;
    [self.portTextField bind:NSValueBinding
                    toObject:defaultsController
                 withKeyPath:[NSString stringWithFormat:@"values.%@", kKCASettingsKeyHttpPort]
                     options:nil];
    [self.showMenuItemCheckButton bind:NSValueBinding
                              toObject:defaultsController
                           withKeyPath:[NSString stringWithFormat:@"values.%@", kKCASettingsKeyShowMenuItem]
                               options:nil];
    [self.showNotificationsCheckButton bind:NSValueBinding
                                   toObject:defaultsController
                                withKeyPath:[NSString stringWithFormat:@"values.%@", kKCASettingsKeyShowNotifications]
                                    options:nil];
    [self.allowRemoteConnectionCheckButton bind:NSValueBinding
                                   toObject:defaultsController
                                withKeyPath:[NSString stringWithFormat:@"values.%@", kKCASettingsKeyAllowRemoteConnections]
                                    options:nil];
    didAwake = YES;
  }
}
- (IBAction)clearKeys:(id)sender {
  [self.plugin.serverDelegate clearKeys];
}

- (IBAction)clearPermissions:(id)sender {
  [self.plugin.serverDelegate clearPermissions];
}
@end
