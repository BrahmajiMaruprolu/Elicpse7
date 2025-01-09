<html>
<body>
<h2>Hello World!</h2>


























<%--
-->create helloworld.yml playbook<---

>nano hello_world.yml
	CONTENT
---
- hosts: ansiblehost
  tasks:
  - name: create docker image
    command: docker build -t hello_world:latest .
    args:
     chdir: /opt/docker
  - name: create tag to push image onto dockerHub
    command: docker tag hello_world:latest dockerhub_username/hello_world:latest
  - name: Push docker image
    command: docker push dockerhub_username/hello_world:latest

--->create deploy_hello_world.yml playbook<----

Content:-

---
- hosts: dockerhost
  tasks:
  - name: create container
    command: docker run -d --name hello_world_server -p 808*:8080 dockerhub_username/hello_world

--%>
</body>
</html>
