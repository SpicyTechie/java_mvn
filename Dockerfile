FROM amazon correctto:17.0.7-alpine
WORKDIR	./my-app
COPY . .
RUN mvn clean package
EXPOSE 8085
CMD ["java","-jar","App.java"]
