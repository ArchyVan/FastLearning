#!/bin/sh

#从plist文件中读取ipa包名和配置文件名
profile_Name='/usr/libexec/PlistBuddy -c "print profile_Name" ./example.plist'
ipa_Name='/usr/libexec/PlistBuddy -c "print app_Name" ./example.plist'

#进入工程目录
cd ../ProjectName
echo "go to projectName workspace path"

#报名时根据时间戳命名的，所以这里有用到
buildTime=$(date +%Y%m%d%H%M)

profile="${profile_Name}"

echo $profile $ipa_Name

#一下方法主要是创建打包的路径和最后导出的ipa的路径
if [ ! -d "../PackageShell/Package" ]; then
    mkdir ../PackageShell/Package
fi

if [ ! -d "../PackageShell/Package/ArchiveProduction" ]; then
    mkdir ../PackageShell/Package/ArchiveProduction
fi

if [ ! -d "../PackageShell/Package/ArchiveProduction/QA" ]; then
    mkdir ../PackageShell/Package/ArchiveProduction/QA
    echo "Create ArchiveProduction path"
fi 

if [ ! -d "../PackageShell/Package/ipa" ]; then
    mkdir ../PackageShell/Package/ipa
fi

if [ ! -d "../PackageShell/Package/ipa/QA" ]; then
    mkdir ../PackageShell/Package/ipa/QA
    echo "Create ipa path"
fi

buildConfiguration="QA"

buildPath="../PackageShell/Package/ArchiveProduction/QA/${ipa_Name}_${buildTime}.xcarchive"
ipaName="../PackageShell/Package/ipa/QA/${ipa_Name}_${buildTime}.ipa"

#先进行clean操作
xctool -workspace PackageExample.xcworkspace -scheme PackageExample -configuration ${buildConfiguration} clean

#打包的命令
xctool -workspace PackageExample.xcworkspace -scheme PackageExample -configuration ${buildConfiguration} archive -archivePath ${buildPath}

#导出ipa包的命令
xcodebuild -exportArchive -exportFormat IPA -archivePath ${buildPath} -exportPath ${ipaName} -exportProvisioningProfile "$profile"
