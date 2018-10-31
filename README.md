# radar-api

Rollbox code challenge

## Setup with Docker

This code challenge has been dockerize to facilitate its handling

### Prerequisites

You must have Docker installed

You can follow the official guides to install docker here: https://docs.docker.com/install/

### Installing

First of all you have to unzip the file

And them lets build the docker image.

```
cd radar-api
docker build -t radar-api .
```

And run the container with a SECRET_KEY_BASE

```
docker run -it -p 8888:8888 -e SECRET_KEY_BASE="XXXXXX" radar-api
```


### Usage

After ```docker run -it```  you are in the docker container terminal with the rails server up, so you will see the log

Now in other terminal you can run the tests:
```
./spec/test_attack.sh
```


### Running the tests

To run the unit tests:

```
rspec
```

## NOTES

The last test is failing and I consider that the logic is ok but not the test. So since tests were given I wouldn\`t like to modify it

I would have liked to develop the full test with TDD but it was impossible due to time reasons.

### Pending improvements

-Param validations

-Improve errors controll

-Improve select_target_service.rb with better logic and cleaner code

-Add missed tests
