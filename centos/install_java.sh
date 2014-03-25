echo "installing java"

DIST_FOLDER=/usr/lib/jvm/jdk1.6.0_33
if [ -f $DIST_FOLDER ];then
    echo "java already installed. skipping"
fi

CURRENT_DIRECTORY=`pwd`

cd "$(dirname "$0")"

INSTALL_JAVA_DIR=/usr/lib/jvm
mkdir -p $INSTALL_JAVA_DIR
cd $INSTALL_JAVA_DIR
wget -O jdk.bin --no-check-certificate --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk6-downloads-1637591.html;" http://download.oracle.com/otn-pub/java/jdk/6u33-b03/jdk-6u33-linux-x64.bin
chmod 755 jdk.bin
echo "yes" | ./jdk.bin &>/dev/null
export JAVA_HOME=$DIST_FOLDER
echo "JAVA_HOME is $JAVA_HOME"
rm -f jdk.bin
ln -Tfs $JAVA_HOME/bin/java /usr/bin/java
ln -Tfs $JAVA_HOME/bin/javac /usr/bin/javac

cd $CURRENT_DIRECTORY