//
//  HelloWorldBean.h
//  hw2spm
//
//  Created by ahao on 2024/10/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HelloWorldBean : NSObject
@property(nonatomic,copy)NSString* fieldName;
-(void) sayHello;
+(void) showWorld;

@end

NS_ASSUME_NONNULL_END
