#!make

help:
	@echo "Example: "
	@echo "make install APP_PORT=5000 DATABASE_URI=jdbc://USER:PASS@HOST:PORT/DB_NAME"

run: 
	yarn dev

install: requirements
	@echo "Adding dependencies"
	@yarn install
	@yarn prisma introspect
	@yarn prisma generate

requirements:
	@echo "Creating .env file"
	@touch .env
	@printf 'DATABASE_URI=$(DATABASE_URI)\nAPP_PORT=$(APP_PORT)' > .env
