pip install -r requirements.txt
pip install jsonlines
pip install bitsandbytes
python -m spacy download en_core_web_sm
mkdir model
cd model
wget https://huggingface.co/THUDM/CogAgent/resolve/main/cogagent-vqa.zip?download=true
apt update
apt install unzip 
unzip cogagent-vqa.zip?download=true
cd ..
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install
mkdir data 
cd data
# mkdir images
aws s3 cp s3://canva-data3.0/ ./ --recursive
cd ..
cd finetune_demo
# Finetuning
bash finetune_cogagent_lora.sh
aws s3 cp checkpoints/ s3://canva-model/ --recursive 
