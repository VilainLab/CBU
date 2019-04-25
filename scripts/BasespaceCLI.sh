#Create a link with your basespace account and the linux environment (server), from which you are uploading your data. This is only done once.
bs authenticate
#Uploading data:
# -i Sample ID name.
# -p project name Same as basespace project name, where you are uploading samples.
# input fastq files following the basepece criterions
bs upload sample -i "DSD-SEA-3062-0" -p "DSD" /home/vlab/data/Hayk/basespace/DSD-SEA-3062-0_S1_L001_R1_001.fastq.gz /home/vlab/data/Hayk/basespace/DSD-SEA-3062-0_S1_L001_R2_001.fastq.gz
