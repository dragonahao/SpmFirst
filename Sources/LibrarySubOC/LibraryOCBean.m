//
//  LibraryOCBean.m
//  SwiftLibraryProject
//
//  Created by ahao on 2024/10/15.
//

#import "LibraryOCBean.h"

@implementation LibraryOCBean
-(void) showOCMethod{
    NSLog(@"LibraryOCBean::showOCMethod %@,%ld",self.fieldName,self.fieldAge);
}
+(void) showOCStaticMethod{
    NSLog(@"LibraryOCBean::showOCStaticMethod");
}
@end
