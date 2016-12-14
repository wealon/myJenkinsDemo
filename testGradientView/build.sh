#!/bin/sh


projName="testGradientView"
scheme="${projName}"
archive="${projName}.xcarchive"
ipa="${projName}.ipa"

outPath="./build"
archivePath="${outPath}/${archive}"
ipaPath="${outPath}/${ipa}"

logPath="${outPath}/log"
buildLog="${logPath}/build.log"
archiveLog="${logPath}/archive.log"
exportLog="${logPath}/export.log"


# show the commands
set -x

echo "clear old outputs..."
rm -r ${outPath}
mkdir ${outPath}
mkdir ${logPath}

# 1. buid&test
echo "build&test..."
xcodebuild -workspace ${projName}.xcworkspace/ -scheme ${scheme} -destination 'platform=iOS Simulator,name=iPhone 5s' clean build test > ${buildLog} 

if [ 0 == $? ]; then
	echo "build&test succ..."

	# 2. archive
	echo "archive..."
	xcodebuild -workspace ${projName}.xcworkspace/ -scheme ${scheme} -archivePath ${archivePath} archive > ${archiveLog}

	if [ 0 == $? ]; then
		echo "archive succ..."

		# 3. export ipa
		echo "export ipa..."
		xcodebuild -exportArchive -archivePath ${archivePath} -exportPath ${ipaPath} > ${exportLog}

		if [ 0 == $? ]; then
			echo "export ipa succ, so all succ"
			exit 0
		else 
			echo "export ipa failed"
			exit 3
		fi
	else
		echo "archive failed"
		exit 2 
	fi
else
	echo "build failed"
	exit 1
fi

