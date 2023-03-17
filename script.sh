# 1. build source ra html
# - link tới docs folder: p
# - tên của docker builder image : hardcode

# 2. build docker image từ html
# - tên output của docker image tag : t

# 3. push lên docker hub
# - link tới dockerhub repo

while getopts p:b:t: flag
do
    case "${flag}" in
        p) pathToDocs=${OPTARG};;
        b) sphinxBuilderImageTag=${OPTARG};;
        t) outputImageTag=${OPTARG};;
    esac
done

echo ">> Path to docs folder: $pathToDocs";

echo "";

echo ">> Sphinx builder image tag: $sphinxBuilderImageTag";

echo "";

echo ">> Output image tag: $outputImageTag";

echo "";

echo "===> Build sphinx-builder-image: $sphinxBuilderImageTag";
docker build -f builder-dockerfile -t $sphinxBuilderImageTag .;

echo "";

echo "===> Build source code to html";
docker run --rm -v $pathToDocs:/docs $sphinxBuilderImageTag make html;

echo "";

echo "===> Copy html folder to current folder";
rm -rf html;
cp -R $pathToDocs/build/html .;

echo "";

echo "===> Build final webserver docker image: $outputImageTag";
docker build -f webserver-dockerfile -t $outputImageTag .;

echo "";

echo "===> Remove html folder";
rm -rf html;