# Usamos Jenkins LTS con Java 17 (requerido por las versiones modernas de Android)
FROM jenkins/jenkins:lts-jdk17

# Cambiamos a usuario root para poder instalar programas
USER root

# 1. Instalar pre-requisitos de sistema operativo para Android y Flutter
RUN apt-get update && apt-get install -y \
    curl git unzip xz-utils zip libglu1-mesa wget \
    && rm -rf /var/lib/apt/lists/*

# 2. Configurar el SDK de Android
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

RUN mkdir -p $ANDROID_HOME/cmdline-tools && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip -O android_tools.zip && \
    unzip -q android_tools.zip -d $ANDROID_HOME/cmdline-tools && \
    mv $ANDROID_HOME/cmdline-tools/cmdline-tools $ANDROID_HOME/cmdline-tools/latest && \
    rm android_tools.zip

# Aceptar licencias de Android automáticamente e instalar herramientas base
RUN yes | sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# 3. Configurar e instalar el SDK de Flutter
ENV FLUTTER_HOME=/opt/flutter
ENV PATH=$PATH:$FLUTTER_HOME/bin

RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME

# 4. Darle permisos al usuario "jenkins" para que no haya errores de acceso (Error 32)
RUN chown -R jenkins:jenkins /opt/android-sdk /opt/flutter

# Volvemos al usuario seguro de Jenkins
USER jenkins

# 5. Pre-descargar los binarios de Flutter y aceptar licencias para agilizar el pipeline
RUN yes | flutter doctor --android-licenses
RUN flutter precache