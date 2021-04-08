#!make

help:
	@echo "Example: "
	@echo "make install APP_PORT=5000 DATABASE_URI=jdbc://USER:PASS@HOST:PORT/DB_NAME"

run: 
	yarn dev

install: requiriments
	@echo "Adding dependencies"
	yarn install
	yarn prisma introspect
	yarn prisma generate

requiriments:
	@echo "Creating .env file"
	@touch .env
	@printf 'DATABASE_URI=$(DATABASE_URI)\nAPP_PORT=$(APP_PORT)' > .env
