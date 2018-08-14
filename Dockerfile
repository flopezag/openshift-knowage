FROM fiware/knowage-server-docker:6.1.1

MAINTAINER Fernando López <fernando.lopez@fiware.org>

#allow writing conf files
RUN chmod g+w /home/knowage/apache-tomcat-7.0.57/conf
RUN chmod g+w /home/knowage/apache-tomcat-7.0.57/webapps/knowage/WEB-INF
RUN chmod g+w /home/knowage/apache-tomcat-7.0.57/logs
RUN chmod g+w /home/knowage/apache-tomcat-7.0.57/work
RUN chmod g+w /home/knowage/apache-tomcat-7.0.57/temp

# expose common tomcat port
# this can be used by the host to expose the application
# you can use it while running image with the param '-p 8080:8080'
EXPOSE 8080

# -d option is passed to run knowage forever without exiting from container
ENTRYPOINT ["./entrypoint.sh"]

# this will start knowage just after the previous entrypoint
CMD ["./startup.sh"]

