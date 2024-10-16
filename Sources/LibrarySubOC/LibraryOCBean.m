//
//  LibraryOCBean.m
//  SwiftLibraryProject
//
//  Created by ahao on 2024/10/15.
//

#import "LibraryOCBean.h"
#import <hw2spm/HelloWorldBean.h>  //okay
//#import "hw2spm/HelloWorldBean.h"//okay
#import <hw2spmswift/hw2spmswift.h>
 

@implementation LibraryOCBean
-(void) showOCMethod{
    NSLog(@"LibraryOCBean::showOCMethod %@,%ld",self.fieldName,self.fieldAge);
}
+(void) showOCStaticMethod{
    NSLog(@"LibraryOCBean::showOCStaticMethod");
    
}
+(void) usage_xcframework{
    HelloWorldBean* bean = [[HelloWorldBean alloc] init];
    bean.name=@"zhangsan";
    [bean showName];
    [HelloWorldBean showStaticName];
    
 
}
@end
