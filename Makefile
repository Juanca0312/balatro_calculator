BASE_HREF = /balatro_calculator_web/
GITHUB_USER = Juanca0312
OUTPUT = balatro_calculator_web
GITHUB_REPO = https://$(GITHUB_USER)@github.com/$(GITHUB_USER)/$(OUTPUT).git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy:
ifndef TOKEN
	$(error TOKEN is not set. Usage: make deploy TOKEN=<your_token>)
endif
	@echo "Cleaning project..."
	flutter clean

	@echo "Getting packages..."
	flutter pub get

	@echo "Building for web..."
	flutter build web --base-href $(BASE_HREF) --release

	@echo "Deploying to GitHub repository..."
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M main && \
	git remote add origin https://$(GITHUB_USER):$(TOKEN)@github.com/$(GITHUB_USER)/$(OUTPUT).git && \
	git push -u -f origin main

	@echo "✅ Finished deploy: https://github.com/$(GITHUB_USER)/$(OUTPUT)"
	@echo "🚀 Flutter web URL: https://$(GITHUB_USER).github.io/$(OUTPUT)/"

.PHONY: deploy
