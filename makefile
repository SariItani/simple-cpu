all: compile simulate

compile:
	./scripts/compile.sh

simulate:
	./scripts/simulate.sh

clean:
	./scripts/clean.sh
