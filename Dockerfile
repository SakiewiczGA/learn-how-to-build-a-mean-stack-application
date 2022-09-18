#using node v10
FROM node:10

#create app directory
WORKDIR /usr/src/lafs

#Install app dependencies
#A wildcard is used to ensure both package.json and package-lock.json are copied
COPY package*.json ./

#Run npm install
RUN npm install
#if building code for production
#RUN npm ci --only+production


#Bundle app source
COPY . .

#Expose port 3000 outside container
EXPOSE 3000

#Start application
CMD [ "node", "server/server.js" ]