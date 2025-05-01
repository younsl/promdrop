# Go parameters
GO := go
GOFLAGS := $(GOFLAGS)
LDFLAGS := "-s -w" # 작고 최적화된 바이너리를 위한 링커 플래그 (선택 사항)

# Build parameters
CMD_DIR := ./cmd/promdrop
BINARY_NAME := promdrop
OUTPUT_DIR := .

# Default target (optional)
all: build

# Build the application
build:
	@echo "Tidying up ..."
	go mod tidy
	@echo "Building $(BINARY_NAME) ..."
	$(GO) build $(GOFLAGS) -ldflags=$(LDFLAGS) -o $(OUTPUT_DIR)/$(BINARY_NAME) $(CMD_DIR)
	@echo "Build complete: $(OUTPUT_DIR)/$(BINARY_NAME)"

# Format the code
fmt:
	@echo "Formatting code..."
	gofmt -w .

# Remove the binary
clean:
	@echo "Cleaning up ..."
	rm -f $(OUTPUT_DIR)/$(BINARY_NAME)

# Declare phony targets
.PHONY: all build fmt clean