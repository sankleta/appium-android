FROM ubuntu:16.10
MAINTAINER Tanya Kozel <sankleta@gmail.com>

RUN apt-get update
RUN apt-get install -y curl

RUN apt-get install -y openjdk-8-jre-headless
    
RUN curl "https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz" | tar -zxv -C /opt/
RUN echo y | /opt/android-sdk-linux/tools/android update sdk --all --filter platform-tools,build-tools-25.0.0 --no-ui --force

ENV ANDROID_HOME /opt/android-sdk-linux

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get -y install yarn

RUN yarn add appium@1.6.0

EXPOSE 4723
CMD /opt/appium/node_modules/appium/bin/appium.js