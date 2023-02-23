Pros of part 1:

    1. Part 1 is a simple Bash script that retrieves the parameter values and generates a Kubernetes deployment YAML file with the values included in the container's command.

    2. No additional Kubernetes resources needed: Part 1 doesn't require any additional Kubernetes resources to be created.

Cons of part 1:

    1. Part 1 requires the user to run the Bash script manually to deploy the application for updated paramters.

    2. Part 1 solution exposes the APIs and parameters in the scripts and anyone can get the paramters and APIs


Pros of the alternative solution:

    Security: Alternative solution is more secure way as APIs are in the another script file and it is using configmap to hide the paramters from the manifests of Yamls. 

    Separation of concerns: The alternative solution separates the parameter values from the deployment YAML file using Configmap, which makes it easier to modify the parameter values without modifying the deployment and no need to redeploy after modification of parameters.