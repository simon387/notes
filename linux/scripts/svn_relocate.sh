#!/bin/sh
oldTrunk="https://factory.open.reply.it/repos/open/confcommercio/trunk/"
newTrunk="https://open.reply.it/repos/open/confcommercio/trunk/"
localPath="/home/scelia/thinkopen/open_reply/confcommercio/liferay-plugins-sdk-6.1.1/"
svnDir="$1"
localDir="$2"
#prj="/$3"
c=0

#svn switch --relocate $oldTrunk$svnDir$prj $newTrunk$svnDir$prj $localPath$localDir$prj
#echo svn switch $oldTrunk$svnDir$prj $newTrunk$svnDir$prj $localPath$localDir$prj

for prj in "$@"
do
	if [ "$c" -gt 1 ]; then 
		#echo $prj
		svn switch --relocate $oldTrunk$svnDir"/"$prj $newTrunk$svnDir"/"$prj $localPath$localDir"/"$prj
	fi
	let "c++"
done

#++++++++++++++++++++++++
# svn       + local     +
#++++++++++++++++++++++++
# lf_ext    + ext       +
# lf_layout + layouttpl + 
# lf_hook   + hooks     +
# lf_module + portlets  +
#++++++++++++++++++++++++
