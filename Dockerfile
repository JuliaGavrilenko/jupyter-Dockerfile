FROM cern/cc7-base

# Update the system and install dependencies
RUN yum update -y
RUN yum install bzip2 -y

#WORKDIR ~

# Install Jupyter Notebook using Anaconda
RUN yum install -y wget vim
RUN wget http://repo.continuum.io/archive/Anaconda3-4.1.1-Linux-x86_64.sh 
RUN chmod +x Anaconda3-4.1.1-Linux-x86_64.sh
RUN printf '\nyes\n\nyes\n\n' | ./Anaconda3-4.1.1-Linux-x86_64.sh

# RUN cp /etc/profile /etc/profile_backup  && \
#     echo 'export PATH=/opt/anaconda3/bin:$PATH' | tee -a /etc/profile && \
#     source /etc/profile && \
#     echo $PATH
ENV PATH /root/anaconda3/bin:/usr/sue/sbin:/usr/sue/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#WORKDIR ~
#Configure Jupyter Notebook
RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py &&\
    echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py &&\
    echo "c.NotebookApp.port = 8888" >> /root/.jupyter/jupyter_notebook_config.py

