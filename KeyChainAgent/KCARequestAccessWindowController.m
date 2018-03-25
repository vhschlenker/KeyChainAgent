//
//  KCAAssiciationRequestWindowController.m
//  KeyChainAgent
//
//  Created by Michael Starke on 27/11/15.
//  Copyright © 2015 HicknHack Software GmbH. All rights reserved.
//

#import "KCARequestAccessWindowController.h"

@interface KCARequestAccessWindowController () <NSTextFieldDelegate>
@property (weak) IBOutlet NSTextField *messageTextField;
@property (weak) IBOutlet NSTextField *identifierTextField;
@property (weak) IBOutlet NSButton *allowButton;

@property (copy) NSString *requestKey;
@property (copy) void(^completionHandler)(KCARequestResponse response, NSString *identifier);

- (IBAction)allow:(id)sender;
- (IBAction)deny:(id)sender;

@end

@implementation KCARequestAccessWindowController

- (NSString *)windowNibName {
  return @"RequestAccessWindow";
}

- (NSString *)identifier {
  return self.identifierTextField.stringValue;
}

- (instancetype)initWithRequestKey:(NSString *)key completionHandler:(void (^)(KCARequestResponse, NSString *))handler {
  self = [super initWithWindow:nil];
  if(self) {
    self.completionHandler = handler;
    self.requestKey = key;
  }
  return self;
}

- (void)windowDidLoad {
  [super windowDidLoad];
  
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSString *message = NSLocalizedStringFromTableInBundle(@"REQUEST_ACCESS_MESSAGE_%@", @"", bundle, @"Message shown when a new KeePassHTTP Client want's access to the database");
  
  self.identifierTextField.delegate = self;
  self.identifierTextField.stringValue = [NSUUID UUID].UUIDString;
  self.messageTextField.stringValue = [NSString stringWithFormat:message, self.requestKey];
  
}

- (void)controlTextDidChange:(NSNotification *)obj {
  if(obj.object == self.identifierTextField) {
    self.allowButton.enabled = self.identifierTextField.stringValue.length > 0;
  }
}

- (IBAction)allow:(id)sender {
  if(self.completionHandler) {
    self.completionHandler(KCARequestResponseAllow, self.identifierTextField.stringValue);
  }
  [self dismissSheet:KCARequestResponseAllow];
}

- (IBAction)deny:(id)sender {
  if(self.completionHandler) {
    self.completionHandler(KCARequestResponseDeny, self.identifierTextField.stringValue);
  }
  [self dismissSheet:KCARequestResponseDeny];
}
@end
