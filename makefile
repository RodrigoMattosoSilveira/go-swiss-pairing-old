# recipe to get a protobuf compiler for GOLANG
PB_VER = 21.4
PB_URL =  https://github.com/protocolbuffers/protobuf/releases/download/v${PB_VER}
PB_PREFIX =  protoc
PB_FN  = osx-x86_64.zip
PB_OSX = ${PB_PREFIX}-${PB_VER}-${PB_FN}
PB_DIR = ./pb
export PATH := ./pb/bin:$(PATH)

PROTODIR = ./grpc/proto

#protoc:
#	rm -f ${PB_OSX}
#	rm -rf ${PB_DIR}
#	curl -LO ${PB_URL}/${PB_OSX}
#	unzip ${PB_OSX} -d ${PB_DIR}

# install the protoc compiler, if necessary
PROTOC_DIR = ./pb/bin
PROTOC_FILES = $(addprefix $(PROTOC_DIR)/,protoc)
PROTOC_COMPILER: $(PROTOC_FILES)
$(PROTOC_FILES): | $(PROTOC_DIR)
$(PROTOC_DIR):
	curl -LO ${PB_URL}/${PB_OSX}
	unzip ${PB_OSX} -d ${PB_DIR}
	rm -f ${PB_OSX}

#protobuf:
#	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
#

# Build the go files to support gRPC operations. Given a folder with *.proto files, when I run my make rule, it builds
# their *.pb.go files in the same folder.
PROTO_FILES = $(wildcard $(PROTODIR)/*.proto)
PB_GO_FILES = $(PROTO_FILES:.proto=.pb.go)
all_pb_go_files: $(PB_GO_FILES)
$(PB_GO_FILES): %.pb.go: %.proto
	protoc  --go_out=./ --go_opt=paths=source_relative $<


