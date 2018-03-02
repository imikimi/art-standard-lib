# generated by Neptune Namespaces v3.x.x
# file: Art.StandardLib/index.coffee

module.exports = require './namespace'
module.exports
.includeInNamespace require './StandardLib'
.addModules
  ArrayExtensions:    require './ArrayExtensions'   
  AsyncExtensions:    require './AsyncExtensions'   
  CallStack:          require './CallStack'         
  Clone:              require './Clone'             
  CommonJs:           require './CommonJs'          
  DateExtensions:     require './DateExtensions'    
  Environment:        require './Environment'       
  Eq:                 require './Eq'                
  ErrorWithInfo:      require './ErrorWithInfo'     
  Function:           require './Function'          
  Iteration:          require './Iteration'         
  Log:                require './Log'               
  Map:                require './Map'               
  MapExtensions:      require './MapExtensions'     
  MathExtensions:     require './MathExtensions'    
  MinimalBaseObject:  require './MinimalBaseObject' 
  ObjectDiff:         require './ObjectDiff'        
  ObjectExtensions:   require './ObjectExtensions'  
  ParseUrl:           require './ParseUrl'          
  Promise:            require './Promise'           
  PromisedFileReader: require './PromisedFileReader'
  PromiseWorkerPool:  require './PromiseWorkerPool' 
  PushBackTimer:      require './PushBackTimer'     
  RegExpExtensions:   require './RegExpExtensions'  
  RequestError:       require './RequestError'      
  Ruby:               require './Ruby'              
  ShallowClone:       require './ShallowClone'      
  StringExtensions:   require './StringExtensions'  
  Time:               require './Time'              
  TypesExtended:      require './TypesExtended'     
  Unique:             require './Unique'            
require './Core'
require './Inspect'