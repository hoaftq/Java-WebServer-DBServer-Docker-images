readTemplate('C:/Oracle/Middleware_Home/wlserver_10.3.6/common/templates/domains/wls.jar')

cd('Servers/AdminServer')
set('ListenAddress','')
set('ListenPort', 7001)

cd('/')
cd('Security/base_domain/User/weblogic')
cmo.setPassword('weblogic1')

setOption('OverwriteDomain', 'true')
writeDomain('C:/Oracle/Middleware_Home/user_projects/domains/testdomain')

closeTemplate()
exit()

