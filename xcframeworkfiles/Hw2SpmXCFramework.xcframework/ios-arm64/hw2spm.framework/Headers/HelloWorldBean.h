//
//  HelloWorldBean.h
//  hw2spm
//
//  Created by ahao on 2024/10/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HelloWorldBean : NSObject
@property(nonatomic,copy)NSString* name;
-(void)showName;
+(void)showStaticName;
@end

NS_ASSUME_NONNULL_END
