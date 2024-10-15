//
//  LibraryOCBean.h
//  SwiftLibraryProject
//
//  Created by ahao on 2024/10/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LibraryOCBean : NSObject
@property(nonatomic,copy)NSString* fieldName;
@property(nonatomic,assign)NSInteger fieldAge;
-(void) showOCMethod;
+(void) showOCStaticMethod;
@end

NS_ASSUME_NONNULL_END
