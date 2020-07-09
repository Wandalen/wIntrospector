( function _Base_s_( ) {

'use strict';

/* introspector */

if( typeof module !== 'undefined' )
{

  let _ = require( '../../../../../wtools/Tools.s' );

  _.include( 'wCopyable' );
  _.include( 'wProcess' );
  _.include( 'wFiles' );
  _.include( 'wConsequence' );
  _.include( 'wLooker' );
  _.include( 'wLookerExtra' );
  _.include( 'wLogger' );
  _.include( 'wStringer' );
  _.include( 'wSchema' );

}

if( typeof module !== 'undefined' )
module[ 'exports' ] = _global_.wTools;

})();
