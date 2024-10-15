rm -rf .build

# debug 环境的library
swift build 

# release 环境的library
swift build -c release 