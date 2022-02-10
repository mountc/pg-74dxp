#!/bin/bash
#
# Liferay and Tomcat locations
LIFERAY_HOME="./liferay"
CATALINA_HOME="$LIFERAY_HOME/tomcat-9.0.56"

declare -a persistent_files=(
  "$LIFERAY_HOME/portal-ext.properties"
  "$LIFERAY_HOME/portal-setup-wizard.properties"
  "$LIFERAY_HOME/osgi/configs/com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.cfg"
  "$LIFERAY_HOME/osgi/configs/com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.cfg"
  "$LIFERAY_HOME/osgi/configs/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.cfg"
  "$CATALINA_HOME/conf/server.xml"
  "$CATALINA_HOME/conf/web.xml"
  "$CATALINA_HOME/bin/setenv.sh"
  "$CATALINA_HOME/webapps/ROOT/WEB-INF/classes/ehcache-config/"
  "$CATALINA_HOME/lib/ojdbc8.jar"
  "$LIFERAY_HOME/patching-tool/default.properties"
  "$LIFERAY_HOME/osgi/marketplace/override/"
  "$CATALINA_HOME/conf/Catalina/localhost/"
  "$CATALINA_HOME/webapps/ROOT/WEB-INF/classes/META-INF/portal-log4j-ext.xml"
)

echo "Persisting the following files"

tar cvfz ./persisted_bundle_configs-`date +%Y%m%d.%H%M`.tgz --files-from <(printf "%s\n" "${persistent_files[@]}")
