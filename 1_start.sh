curDir=$(pwd)
docker run -d --name n8n -p 5678:5678 \
  -v n8n_data:/home/node/.n8n \
  -v $curDir:/files \
  -e N8N_USER_MANAGEMENT_DISABLED=true \
  docker.n8n.io/n8nio/n8n

echo "Waiting for n8n to start..."
sleep 5

docker exec -it n8n n8n import:workflow --input=/files/terminal_todolist.json

echo "http://localhost:5678/workflows"
