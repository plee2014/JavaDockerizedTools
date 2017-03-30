docker build -t localhost:5000/jsonschema2pojo:openjdk8 .
echo "docker run -it --rm -v \$(pwd)/build:/build localhost:5000/jsonschema2pojo:openjdk8 ">run.sh
echo "docker run -it --rm -v \$(pwd)/tests:/build localhost:5000/jsonschema2pojo:openjdk8 ">run_test.sh
