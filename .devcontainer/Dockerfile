FROM quay.io/mhildenb/tekton-tutorial-base:latest

COPY .bashrc /opt/app-root/src
COPY convert-kubeconfig-for-devcontainer.sh /$HOME/bin/convert-kubeconfig-for-devcontainer.sh

USER root

RUN dnf -y upgrade && npm rm --global npx && npm i -g @antora/cli@2.3 @antora/site-generator-default@2.3 \
    && npm install --global npx && npm install --global gulp 
    
RUN chown -R default $HOME && chmod -R +x $HOME/bin/

USER default