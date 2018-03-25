//
//  KCAAssiciationRequestWindowController.h
//  KeyChainAgent
//
//  Created by Michael Starke on 27/11/15.
//  Copyright © 2015 HicknHack Software GmbH. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <HNHUi/HNHUi.h>

typedef NS_ENUM(NSInteger, KCARequestResponse) {
  KCARequestResponseAllow,
  KCARequestResponseDeny,
};

@interface KCARequestAccessWindowController : HNHUISheetWindowController

/**
 *  The identifier supplied by the user. Default is a UUID string.
 */
@property (nonatomic, copy, readonly) NSString *identifier;
/**
 *  Creates a request window controller
 *
 *  @param key     key of the request
 *  @param handler handler to be called on user interaction (deny/allo)
 *
 *  @return window controller instance
 */
- (instancetype)initWithRequestKey:(NSString *)key completionHandler:(void(^)(KCARequestResponse response, NSString *identifier))handler;

@end
