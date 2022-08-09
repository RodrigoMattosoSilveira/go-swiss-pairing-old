# recipe to get a protobuf compiler for GOLANG
PB_VER = 21.4
PB_URL =  https://github.com/protocolbuffers/protobuf/releases/download/v${PB_VER}
PB_PREFIX =  protoc
PB_FN  = osx-x86_64.zip
PB_OSX = ${PB_PREFIX}-${PB_VER}-${PB_FN}
PB_DIR = ./pb
export PATH := ./pb/bin:$(PATH)

protoc:
	rm -f ${PB_OSX}
	rm -rf ${PB_DIR}
	curl -LO ${PB_URL}/${PB_OSX}
	unzip ${PB_OSX} -d ${PB_DIR}