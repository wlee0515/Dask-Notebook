# Dask-Notebook
A Jupyter Notebook environment with Dask

## To Build Image
1. Go to repository directory
2. Execute the following command
```bash
docker-compose build
```

## To Run
1. Enable Docker Swarm with the following command
```bash
docker swarm init
```
2. Go to repository directory
3. Execute the following command
```bash
docker stack deploy --compose-file .\docker-compose.yml <Stack Name>
```
#### Example
```bash
docker stack deploy --compose-file .\docker-compose.yml DaskNotebook
```

## To Scale
1. Execute the following command
```bash
docker scale <Stack Name>_workers=<Number of Desire Workers>
 ```
#### Example
```bash
docker scale DaskNotebook_workers=4
 ```
