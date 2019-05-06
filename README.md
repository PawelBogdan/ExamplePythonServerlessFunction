# ExamplePythonServerlessFunction

To create this project I used [this link](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-first-function-python).

I created two scripts can be used to create every necessary resource in the azure cloud and to publish this function app. Those scripts are based on azure documentation pages: [this](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-first-function-python) amd [this](https://docs.microsoft.com/en-us/azure/azure-functions/functions-reference-python).

This project uses [https://github.com/PawelBogdan/AdditionalLibrary](https://github.com/PawelBogdan/AdditionalLibrary) as an external dependency.

The aim of this project is to show how to create an Azure Python Function App which uses an external dependency, e.g. the dependency which cannot be fount in Python Packages Index.

I am not able to do so far. Any advices are nicely seen.

## Try 1 -- wheelhouse

According to [this page](https://prmadi.com/install-python-modules-on-azure-app-services/) additional dependencies can be installed from wheelhouse directory.

#### Step 1

Create wheelhouse directory:

```bash
$ pip wheel -r wheel_requirements.txt -w wheelhouse
```

And copy file `Additional_Library-1.0-py3-none-any.whl` to directory `wheelhouse`.

#### Step 2

I am trying to use those wheel files to publish the app to Azure. 

I publish function app using command:

```bash
$ func azure functionapp publish ${APP_NAME} --build-native-deps
```

But it doesn't work with message:
```bash
Error running docker exec -t 96f7fb6684571bd0c3a686445c5d661216fee363412aa97234018f509c6ecd5a /python_docker_build.sh.
output: Looking in links: wheelhouse
Collecting Additional-Library==1.0 (from -r /requirements.txt (line 2))
    Url 'wheelhouse' is ignored. It is either a non-existing path or lacks a specific scheme.
    Could not find a version that satisfies the requirement Additional-Library==1.0 (from r /requirements.txt (line 2)) (from versions: )
No matching distribution found for Additional-Library==1.0 (from -r /requirements.txt (line 2))
You are using pip version 19.0.3, however version 19.1.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
```