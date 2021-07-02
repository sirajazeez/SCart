component extends="framework.one"{
	this.name = "Shopping cart";

	this.sessionManagement = true;
	this.sessionTimeout = createTimespan(0, 2, 0, 0);
	this.datasource = "shop";
	this.username="root";
	this.password="root";

	this.mappings[ '/framework' ] = getDirectoryFromPath( getBaseTemplatePath() ) & 'framework';

  	function _get_framework_one() {
        if ( !structKeyExists( request, '_framework_one' ) ) {
            request._framework_one = new MyApplication({
                reloadApplicationOnEveryRequest : true
                //,generateSES : true
                //,SESOmitIndex : true 
            });
        }
        return request._framework_one;
    }

    // delegation of lifecycle methods to FW/1:
    function onApplicationStart() {
        return _get_framework_one().onApplicationStart();
    }
    function onError( exception, event ) {
        return _get_framework_one().onError( exception, event );
    }
    function onRequest( targetPath ) {
        return _get_framework_one().onRequest( targetPath );
    }
    function onRequestEnd() {
        return _get_framework_one().onRequestEnd();
    }
    function onRequestStart( targetPath ) {
        return _get_framework_one().onRequestStart( targetPath );
    }
    function onSessionStart() {
        return _get_framework_one().onSessionStart();
    }
}