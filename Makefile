# Build and run commands for Art Gallery application

.PHONY: build run clean test

# Default target
all: build

# Build the application
build:
	./scripts/build.sh

# Run the application
run:
	./scripts/run.sh

# Clean build artifacts
clean:
	./scripts/clean.sh

# Run tests
test:
	./scripts/test.sh

# Run tests with coverage
test-coverage:
	./scripts/test-coverage.sh

# Install dependencies
deps:
	./scripts/deps.sh

# Format code
fmt:
	./scripts/fmt.sh
