su - oracle $ORACLE_HOME/oracle_common/common/bin/wlst.sh << END
nmConnect('sberpsaas','sbs10ias','localhost','5556','SBErpc12','/home/oracle/Oracle/Middleware12c/ofr1/user_projects_domains/SBErpc12')
prps = makePropertiesObject("AdminURL=http://ottos12.softbase.ch;7001;Username=sberpsaas;Password=sbs10ias;weblogic.ListenPort=7001")
nmStart("AdminServer", props=prps)
exit()
END

#nmKill("AdminServer")
#nodemanager
#wlst
#$ORACLE_HOME/oracle_common/common/bin/wlst.sh