# Course Production Landing Page
Public landing page to course production services and resources.

## Development

**Requirements**: Docker, NodeJS

```bash
docker compose up --build
```
1. Browse to `localhost:8080` to see site with *live reload* enabled.

If you encounter an error, consider the following:

* Ensure Node.js (and npm) are installed on your computer
* Ensure you run the command from the project root (same folder as package.json)

## Deployment

This package was modified to run on Kubernetes. To build and test the image locally, run:

```bash
docker build -t course-production-site .

docker run -p 8080:8080 course-production-site
```

Browse to `http://localhost:8080/` to view the container.

## Contact

[courseproduction@bcit.ca](mailto:courseproduction@bcit.ca).
 
