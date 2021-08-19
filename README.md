# Dask-Notebook
A Deployment to run Jupyter-Lab in an environment setup with Dask. The number of Dask Workers is scalable creating more Worcker containers in the cluster.

# Image Creation
## To Build Image
1. Go to repository directory
2. Execute the following command
```bash
docker-compose build
```
## To Add More Python Modules to Jupyter-Lab
1. Go to repository directory
2. Add new Python module to [requirements.txt](./requirements.txt) 
3. Rebuild Docker Image using the following command 
```bash
docker-compose build --no-cache
 ```

# Docker Swarm Deployment
Once deployed, Jupyter-Lab and Dask-Dashboard will be available from localhost

Jupyter-Lab : http://localhost:8888

Dask-Dashboard : http://localhost:8787

The root directory of Jupyter lab is mapped to the folder [playground](./playground). Files saved in Jupyter-Lab will be available in the [playground](./playground) folder. 

## To Run Deployment
1. Enable Docker Swarm with the following command
```bash
docker swarm init
```
2. Go to repository directory
3. Execute the following command
```bash
docker stack deploy --compose-file .\docker-compose.yml <Deployment Name>
```
#### Example
```bash
docker stack deploy --compose-file .\docker-compose.yml DaskNotebook
```

## To Stop Deployment
1. Execute the following command
```bash
docker stack rm <Deployment Name>
 ```
#### Example
```bash
docker stack rm DaskNotebook
```
 
## To Scale Deployment
1. Execute the following command
```bash
docker scale <Deployment Name>_workers=<Number of Desire Workers>
 ```
#### Example
```bash
docker scale DaskNotebook_workers=4
 ```


# Kubernetes Deployment
Once deployed, Jupyter-Lab and Dask-Dashboard will be available from localhost

Jupyter-Lab : http://localhost:30081

Dask-Dashboard : http://localhost:30081

## To Run Deployment
1. Go to repository directory
2. Execute the following command
```bash
kubectl create -f .\kubectl_dask_notebook.yml
```

## To Stop Deployment
1. Execute the following command
```bash
kubectl delete -f .\kubectl_dask_notebook.yml
 ```
 
## To Scale Deployment
1. Execute the following command
```bash
 kubectl scale --replicas=3 deployment/dask-notebook-workers
 ```
