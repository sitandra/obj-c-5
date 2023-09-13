//
//  Loader.h
//  obj-c-5
//
//  Created by Юлия Дебелова on 12.09.2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Loader : NSObject
@property (nonatomic, strong) NSURLSession *session;
-(void) performGETRequestForURL: (NSString *) stringURL
                      arguments: (NSDictionary *) arguments
                      completion: (void(^)(NSDictionary *, NSError *)) completion;
-(void) performPOSTRequestForURL: (NSString *) stringURL
                      arguments: (NSDictionary *) arguments
                      completion: (void(^)(NSDictionary *, NSError *)) completion;
-(void) performGETRequestForURL: (NSString *) stringURL
                      arguments: (NSDictionary *) arguments
                      completionWithHTML: (void(^)(NSString *, NSError *)) completion;
@end

NS_ASSUME_NONNULL_END
