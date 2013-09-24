default["lampdemo"]["apache"]["app_name"] 			= "lampdemo"
default["lampdemo"]["apache"]["server_name"] 		= "localhost"
default["lampdemo"]["apache"]["server_aliases"] 	= ["localhost"]
default["lampdemo"]["apache"]["docroot"]			= ::File.join(File::SEPARATOR, 'var', 'www', 'lampdemo')
