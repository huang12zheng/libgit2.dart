cd `dirname $0`
set -e

PLUGIN_TMP_FILE="include.zip"
latest_url="https://api.github.com/repos/huang12zheng/libgit2/releases/latest"

# Init
[ -d header ] && rm -rf header && mkdir -p header
[ -f "include.zip" ] && rm include.zip
# Download header file
DOWNLOAD_URL=`wget -q -O - $latest_url| awk '/\"browser_download_url\":/{gsub( /[,\"]/,"", $2); print $2}'|grep 'include.zip'`
if [ -f init.log -a -z "`tail init.log|grep $DOWNLOAD_URL`" ]; then
    wget -q -O "$PLUGIN_TMP_FILE" "$DOWNLOAD_URL" && echo "`date` wget -q -O $DOWNLOAD_URL" >> init.log
    unzip include.zip -d header && rm include.zip
fi
