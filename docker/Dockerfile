FROM node
RUN apt-get update && apt-get install -y unzip
RUN wget https://github.com/trshugu/ut/archive/master.zip
RUN unzip master.zip
WORKDIR ut-master/docker/express
RUN pwd
RUN npm i
CMD npm start