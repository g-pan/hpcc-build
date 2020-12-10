BINDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "In main.sh"
echo "INPUT_GITHUB_USER: ${INPUT_GITHUB_USER}"
echo "INPUT_BUILD_CATEGORY: ${INPUT_BUILD_CATEGORY}"
echo "INPUT_BUILD_CATEGORY 2: ${inputs.build_category}"


echo $OS | grep -i windows > /dev/null
if [ $? -eq 0 ] # Windows
then
   powershell ${BINDIR}/build.ps1
else  # Unix
   echo "test"
   #${BINDIR}/build.sh
fi
