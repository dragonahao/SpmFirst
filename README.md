# SpmFirst
spm first test

# swift独立spm-target
1. 只含有swift代码文件
# oc独立spm-target
1. 只含有objective-c 代码文件, 不能包含swift文件(否则编译无法通过)
2. 头文件导出(默认在spm-target源码下的include目录 )
3. 头文件导出自定义 
```swift
//放在Package.swift 的 targets中
         .target(
            name: "SwiftLibraryFirstSubOC",
            path: "Sources/LibrarySubOC",
            publicHeadersPath:"../LibrarySubOC/header"
        ),
```

# swift独立target中可以依赖oc-spm-target   
1. 说明 苹果官方不希望，一个spm-target包里头同时有oc和swift，可能是考虑到后期切换到swift的纯洁性
2. spm 打出来的target 可以认为都是swift格式
3. 虽然里面不能有swift (这是一个 spm-target-oc 子包)， 但是却可以作为独立子包被swift引用到

# spm的验证工具
1. 验证开发环境 swift build -c debug 
2. 验证生产环境 swift build -c release 
3. 验证时 swift build 没有直接在xcode上build准确
```
    如使用到了spm-xcframework时，导入<hw2spm/HelloWorldBean.h>之后
    swift build 是无法完成的\失败的，但是 xcode 上build是成功的 ,三方接入后也是可以使用的
```

# spm的发布工具(最简单)
1. git / github 等，复用了现有的仓库管理工具
2. 使用git直接推送到对应的仓库即可

# spm来控制可见性
1. open 外部可见，且可以继承 
2. public 外部可见，且final，不能继承
3. internal 外部不可见；默认，模块spm内可见(类声明内可见，类文件内可见)
4. private 外部不可见；仅仅类声明内可见

# spm来添加objective-c生成
1. @objcMembers修饰类，类、类的成员变量、类的成员方法都对objective-c可读写
2. @objc修饰 类、类的成员变量、类的成员方法，才对objective-c可互操作(可读、写、调用等)
3. 类没有被@objcMembers修饰， 成员没有被@objc修饰，成员对swift不可互操作(不可读，不可写，不可调用等)

# spm制作xcframework
framework -> xcframework -> spm-binary-target -> spm-target-oc -> spm-target
```shell
#合并多个framework
xcodebuild -create-xcframework \
    -framework "PathToFirstFramework/MyFramework.framework" \
    -framework "PathToSecondFramework/AnotherFramework.framework" \
    -output "MyXCFramework.xcframework"

#如 hw2spm.framework 文件
#合并一个framework
xcodebuild -create-xcframework \
    -framework "hw2spm.framework" \
    -output "Hw2SpmXCFramework.xcframework"


# spm添加xcframework dependencies:["MyBinary"]
targets:[
        .binaryTarget(
            name: "MyBinary",
            path:
                "xcframeworkfiles/Hw2SpmXCFramework.xcframework"
           
        ),
]

# Hw2SpmXCFramework.xcframework中文件的使用
# 如xcframework中包含了一个 hw2spm.framework（使用OC制作而成）
# hw2spm.framework中导出了 HelloWorldBean.h 文件

# 使用机制 需要在 spm-target-oc子模块中使用才行
#import <hw2spm/HelloWorldBean.h> 
HelloWorldBean* bean=[[HelloWorldBean alloc ]init];
bean.name="name";
[bean showName];

# 在spm-target-swift中调用，无法直接调用
# 可以转为spm-target-oc子模块，再通过spm-target调用子模块的方式来调用(绕弯\不便)
# 真有一个 xcframework文件，可以直接放到 xcode 的 frameworkds中来用(直接\方便)
```
# spm制作xcframework外部也有可达性
1. spm-target-xcframework-oc的可达性
>
>1.外部的oc项目的.h头文件中可以直接使用 #import <frameworkName/someHeader.h>
>2.外部的swift项目可以通过 frameworkName-Swift-BridgeHeader.h 注册  #import <frameworkName/someHeader.h> 之后使用
>

2. spm-target-xcframework-swift的可达性
>
> 1. 外部oc项目的.h头文件中 不可达，无法操作 (转2 用Swift可达性来操作)
> 2. 外部swift项目可以通过 import frameworkName 来使用 ，如 let bean=HelloSpm()
> 


# spm 链接系统framework库
```shell 
targets:[
    target:[
        name:"",
        path:""
            linkerSettings: [
                .linkedFramework("系统的framework名称不带后缀"
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("sqlite")
            )

        ]
    ]
]
```
      



# spm 依赖转圈问题修复
```shell
    xcodebuild -resolvePackageDependencies

```

Showing All Errors Only
Cannot open file handle for file at path: /Users/ahao/Library/Developer/Xcode/DerivedData/LucaJsSDKCoreThirdSwiftClient-abdjdidgknlunhfzgkywgpvfawtn/SourcePackages/checkouts/SpmFirst/Sources/Hw2SpmXCFramework.xcframework/ios-arm64/hw2spm.framework: The file “hw2spm.framework” doesn’t exist.

