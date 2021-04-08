
install:
	yarn install
	yarn prisma introspect
	yarn prisma generate
