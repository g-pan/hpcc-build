BINDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


echo $OS | grep -i windows > /dev/null
if [ $? -eq 0 ] # Windows
then
   powershell ${BINDIR}/build.ps1
else  # Unix
   ${BINDIR}/build.sh
fi
