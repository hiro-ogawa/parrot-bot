# Update this to give whichever name you want. This may be set on the command line:
# > make build OUT_FILE=./outfile.zip
OUT_FILE?=./deliverable.zip

### Below this point it should not need to be changed
# get absolute path of zipfile to deliver
DELIVERABLE=$(abspath $(OUT_FILE))

PYTHON_VER=3.7

# Install all the libs locally
install:
	pipenv --python=${PYTHON_VER}
	pipenv install --three

# Destroy the virtualenv
uninstall:
	pipenv --rm

# Run the import
run:
	pipenv run python ./hello_lambda.py

# Clean delivrable
clean:
	rm -f ${DELIVERABLE}

# Rebuild the delivrable
build:
	$(eval VENV = $(shell pipenv --venv))
	cd ${VENV}/lib/python${PYTHON_VER}/site-packages && zip -r9 ${DELIVERABLE} ./*
	zip -r9 ${DELIVERABLE} *.py
