FROM ghcr.io/userver-framework/ubuntu-22.04-userver-pg:latest

RUN groupadd -r devcontainer && useradd -m -g devcontainer devcontainer && apt update && apt install rsync gdb -y

COPY --chown=devcontainer . /workspaceTemplate
WORKDIR /workspaceTemplate

USER devcontainer

RUN /usr/bin/cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -S/workspaceTemplate -B/workspaceTemplate/build -G Ninja