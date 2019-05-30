lexer grammar VSqlLexer;


//Keywords
K_ALL : A L L    ;
K_AND : A N D    ;
K_ANY : A N Y    ;
K_ARRAY : A R R A Y    ;
K_AS : A S    ;
K_ASC : A S C    ;
K_AUTHORIZATION : A U T H O R I Z A T I O N    ;
K_BETWEEN : B E T W E E N    ;
K_BIGINT : B I G I N T    ;
K_BINARY : B I N A R Y    ;
K_BIT : B I T    ;
K_BOOLEAN : B O O L E A N    ;
K_BOTH : B O T H    ;
K_CASE : C A S E    ;
K_CAST : C A S T    ;
K_CHAR : C H A R    ;
K_CHAR_LENGTH : C H A R  UNDERSCORE L E N G T H    ;
K_CHARACTER_LENGTH : C H A R A C T E R  UNDERSCORE L E N G T H    ;
K_CHECK : C H E C K    ;
K_COLLATE : C O L L A T E    ;
K_COLUMN : C O L U M N    ;
K_CONSTRAINT : C O N S T R A I N T    ;
K_CORRELATION : C O R R E L A T I O N    ;
K_CREATE : C R E A T E    ;
K_CROSS : C R O S S    ;
K_CURRENT_DATABASE : C U R R E N T  UNDERSCORE D A T A B A S E    ;
K_CURRENT_DATE : C U R R E N T  UNDERSCORE D A T E    ;
K_CURRENT_SCHEMA : C U R R E N T  UNDERSCORE S C H E M A    ;
K_CURRENT_TIME : C U R R E N T  UNDERSCORE T I M E    ;
K_CURRENT_TIMESTAMP : C U R R E N T  UNDERSCORE T I M E S T A M P    ;
K_CURRENT_USER : C U R R E N T  UNDERSCORE U S E R    ;
K_DATEDIFF : D A T E D I F F    ;
K_DATETIME : D A T E T I M E    ;
K_DECIMAL : D E C I M A L    ;
K_DECODE : D E C O D E    ;
K_DEFAULT : D E F A U L T    ;
K_DEFERRABLE : D E F E R R A B L E    ;
K_DESC : D E S C    ;
K_DISTINCT : D I S T I N C T    ;
K_ELSE : E L S E    ;
K_ENCODED : E N C O D E D    ;
K_END : E N D    ;
K_EXCEPT : E X C E P T    ;
K_EXISTS : E X I S T S    ;
K_EXTRACT : E X T R A C T    ;
K_FALSE : F A L S E    ;
K_FLOAT : F L O A T    ;
K_FOR : F O R    ;
K_FOREIGN : F O R E I G N    ;
K_FROM : F R O M    ;
K_FULL : F U L L    ;
K_GRANT : G R A N T    ;
K_GROUP : G R O U P    ;
K_HAVING : H A V I N G    ;
K_ILIKE : I L I K E    ;
K_ILIKEB : I L I K E B    ;
K_IN : I N    ;
K_INITIALLY : I N I T I A L L Y    ;
K_INNER : I N N E R    ;
K_INOUT : I N O U T    ;
K_INT : I N T    ;
K_INTEGER : I N T E G E R    ;
K_INTERSECT : I N T E R S E C T    ;
K_INTERVAL : I N T E R V A L    ;
K_INTERVALYM : I N T E R V A L Y M    ;
K_INTO : I N T O    ;
K_IS : I S    ;
K_ISNULL : I S N U L L    ;
K_JOIN : J O I N    ;
K_KSAFE : K S A F E    ;
K_LEADING : L E A D I N G    ;
K_LEFT : L E F T    ;
K_LIKE : L I K E    ;
K_LIKEB : L I K E B    ;
K_LIMIT : L I M I T    ;
K_LOCALTIME : L O C A L T I M E    ;
K_LOCALTIMESTAMP : L O C A L T I M E S T A M P    ;
K_MATCH : M A T C H    ;
K_MINUS : M I N U S    ;
K_MONEY : M O N E Y    ;
K_NATURAL : N A T U R A L    ;
K_NCHAR : N C H A R    ;
K_NEW : N E W    ;
K_NONE : N O N E    ;
K_NOT : N O T    ;
K_NOTNULL : N O T N U L L    ;
K_NULL : N U L L    ;
K_NULLSEQUAL : N U L L S E Q U A L    ;
K_NUMBER : N U M B E R    ;
K_NUMERIC : N U M E R I C    ;
K_OFFSET : O F F S E T    ;
K_OLD : O L D    ;
K_ON : O N    ;
K_ONLY : O N L Y    ;
K_OR : O R    ;
K_ORDER : O R D E R    ;
K_OUT : O U T    ;
K_OUTER : O U T E R    ;
K_OVER : O V E R    ;
K_OVERLAPS : O V E R L A P S    ;
K_OVERLAY : O V E R L A Y    ;
K_PINNED : P I N N E D    ;
K_POSITION : P O S I T I O N    ;
K_PRECISION : P R E C I S I O N    ;
K_PRIMARY : P R I M A R Y    ;
K_REAL : R E A L    ;
K_REFERENCES : R E F E R E N C E S    ;
K_RIGHT : R I G H T    ;
K_ROW : R O W    ;
K_SCHEMA : S C H E M A    ;
K_SELECT : S E L E C T    ;
K_SESSION_USER : S E S S I O N  UNDERSCORE U S E R    ;
K_SIMILAR : S I M I L A R    ;
K_SMALLDATETIME : S M A L L D A T E T I M E    ;
K_SMALLINT : S M A L L I N T    ;
K_SOME : S O M E    ;
K_SUBSTRING : S U B S T R I N G    ;
K_SYSDATE : S Y S D A T E    ;
K_TABLE : T A B L E    ;
K_TEXT : T E X T    ;
K_THEN : T H E N    ;
K_TIME : T I M E    ;
K_TIMESERIES : T I M E S E R I E S    ;
K_TIMESTAMP : T I M E S T A M P    ;
K_TIMESTAMPADD : T I M E S T A M P A D D    ;
K_TIMESTAMPDIFF : T I M E S T A M P D I F F    ;
K_TIMESTAMPTZ : T I M E S T A M P T Z    ;
K_TIMETZ : T I M E T Z    ;
K_TIMEZONE : T I M E Z O N E    ;
K_TINYINT : T I N Y I N T    ;
K_TO : T O    ;
K_TRAILING : T R A I L I N G    ;
K_TREAT : T R E A T    ;
K_TRIM : T R I M    ;
K_TRUE : T R U E    ;
K_UNBOUNDED : U N B O U N D E D    ;
K_UNION : U N I O N    ;
K_UNIQUE : U N I Q U E    ;
K_USER : U S E R    ;
K_USING : U S I N G    ;
K_UUID : U U I D    ;
K_VARBINARY : V A R B I N A R Y    ;
K_VARCHAR : V A R C H A R    ;
K_VARCHAR2 : V A R C H A R '2'   ;
K_WHEN : W H E N    ;
K_WHERE : W H E R E    ;
K_WINDOW : W I N D O W    ;
K_WITH : W I T H    ;
K_WITHIN : W I T H I N    ;


// Non reserved keywords
K_ABORT : A B O R T    ;
K_ABSOLUTE : A B S O L U T E    ;
K_ACCESS : A C C E S S    ;
K_ACCESSRANK : A C C E S S R A N K    ;
K_ACCOUNT : A C C O U N T    ;
K_ACTION : A C T I O N    ;
K_ACTIVATE : A C T I V A T E    ;
K_ACTIVEPARTITIONCOUNT : A C T I V E P A R T I T I O N C O U N T    ;
K_ADD : A D D    ;
K_ADMIN : A D M I N    ;
K_AFTER : A F T E R    ;
K_AGGREGATE : A G G R E G A T E    ;
K_ALSO : A L S O    ;
K_ALTER : A L T E R    ;
K_ANALYSE : A N A L Y S E    ;
K_ANALYTIC : A N A L Y T I C    ;
K_ANALYZE : A N A L Y Z E    ;
K_ANNOTATED : A N N O T A T E D    ;
K_ANTI : A N T I    ;
K_ASSERTION : A S S E R T I O N    ;
K_ASSIGNMENT : A S S I G N M E N T    ;
K_AT : A T    ;
K_AUTHENTICATION : A U T H E N T I C A T I O N    ;
K_AUTO : A U T O    ;
K_AUTO_INCREMENT : A U T O  UNDERSCORE I N C R E M E N T    ;
K_AVAILABLE : A V A I L A B L E    ;
K_BACKWARD : B A C K W A R D    ;
K_BASENAME : B A S E N A M E    ;
K_BATCH : B A T C H    ;
K_BEFORE : B E F O R E    ;
K_BEGIN : B E G I N    ;
K_BEST : B E S T    ;
K_BLOCK : B L O C K    ;
K_BLOCK_DICT : B L O C K  UNDERSCORE D I C T    ;
K_BLOCKDICT_COMP : B L O C K D I C T  UNDERSCORE C O M P    ;
K_BROADCAST : B R O A D C A S T    ;
K_BY : B Y    ;
K_BYTEA : B Y T E A    ;
K_BYTES : B Y T E S    ;
K_BZIP : B Z I P    ;
K_BZIP_COMP : B Z I P  UNDERSCORE C O M P    ;
K_CACHE : C A C H E    ;
K_CALLED : C A L L E D    ;
K_CASCADE : C A S C A D E    ;
K_CATALOGPATH : C A T A L O G P A T H    ;
K_CHAIN : C H A I N    ;
K_CHARACTER : C H A R A C T E R    ;
K_CHARACTERISTICS : C H A R A C T E R I S T I C S    ;
K_CHARACTERS : C H A R A C T E R S    ;
K_CHECKPOINT : C H E C K P O I N T    ;
K_CLASS : C L A S S    ;
K_CLEAR : C L E A R    ;
K_CLOSE : C L O S E    ;
K_CLUSTER : C L U S T E R    ;
K_COLSIZES : C O L S I Z E S    ;
K_COLUMNS_COUNT : C O L U M N S  UNDERSCORE C O U N T    ;
K_COMMENT : C O M M E N T    ;
K_COMMIT : C O M M I T    ;
K_COMMITTED : C O M M I T T E D    ;
K_COMMONDELTA_COMP : C O M M O N D E L T A  UNDERSCORE C O M P    ;
K_COMMUNAL : C O M M U N A L    ;
K_COMPLEX : C O M P L E X    ;
K_CONNECT : C O N N E C T    ;
K_CONSTRAINTS : C O N S T R A I N T S    ;
K_CONTROL : C O N T R O L    ;
K_COPY : C O P Y    ;
K_CPUAFFINITYMODE : C P U A F F I N I T Y M O D E    ;
K_CPUAFFINITYSET : C P U A F F I N I T Y S E T    ;
K_CREATEDB : C R E A T E D B    ;
K_CREATEUSER : C R E A T E U S E R    ;
K_CSV : C S V    ;
K_CUBE : C U B E    ;
K_CURRENT : C U R R E N T    ;
K_CURSOR : C U R S O R    ;
K_CUSTOM : C U S T O M    ;
K_CUSTOM_PARTITIONS : C U S T O M  UNDERSCORE P A R T I T I O N S    ;
K_CYCLE : C Y C L E    ;
K_DATA : D A T A    ;
K_DATABASE : D A T A B A S E    ;
K_DATAPATH : D A T A P A T H    ;
K_DAY : D A Y    ;
K_DEACTIVATE : D E A C T I V A T E    ;
K_DEALLOCATE : D E A L L O C A T E    ;
K_DEC : D E C    ;
K_DECLARE : D E C L A R E    ;
K_DEFAULTS : D E F A U L T S    ;
K_DEFERRED : D E F E R R E D    ;
K_DEFINE : D E F I N E    ;
K_DEFINER : D E F I N E R    ;
K_DELETE : D E L E T E    ;
K_DELIMITER : D E L I M I T E R    ;
K_DELIMITERS : D E L I M I T E R S    ;
K_DELTARANGE_COMP : D E L T A R A N G E  UNDERSCORE C O M P    ;
K_DELTARANGE_COMP_SP : D E L T A R A N G E  UNDERSCORE C O M P  UNDERSCORE S P    ;
K_DELTAVAL : D E L T A V A L    ;
K_DEPENDS : D E P E N D S    ;
K_DETERMINES : D E T E R M I N E S    ;
K_DIRECT : D I R E C T    ;
K_DIRECTCOLS : D I R E C T C O L S    ;
K_DIRECTED : D I R E C T E D    ;
K_DIRECTGROUPED : D I R E C T G R O U P E D    ;
K_DIRECTPROJ : D I R E C T P R O J    ;
K_DISABLE : D I S A B L E    ;
K_DISABLED : D I S A B L E D    ;
K_DISCONNECT : D I S C O N N E C T    ;
K_DISTVALINDEX : D I S T V A L I N D E X    ;
K_DO : D O    ;
K_DOMAIN : D O M A I N    ;
K_DOUBLE : D O U B L E    ;
K_DROP : D R O P    ;
K_DURABLE : D U R A B L E    ;
K_EACH : E A C H    ;
K_ENABLE : E N A B L E    ;
K_ENABLED : E N A B L E D    ;
K_ENCLOSED : E N C L O S E D    ;
K_ENCODING : E N C O D I N G    ;
K_ENCRYPTED : E N C R Y P T E D    ;
K_ENFORCELENGTH : E N F O R C E L E N G T H    ;
K_EPHEMERAL : E P H E M E R A L    ;
K_EPOCH : E P O C H    ;
K_ERROR : E R R O R    ;
K_ESCAPE : E S C A P E    ;
K_EVENT : E V E N T    ;
K_EVENTS : E V E N T S    ;
K_EXCEPTION : E X C E P T I O N    ;
K_EXCEPTIONS : E X C E P T I O N S    ;
K_EXCLUDE : E X C L U D E    ;
K_EXCLUDING : E X C L U D I N G    ;
K_EXCLUSIVE : E X C L U S I V E    ;
K_EXECUTE : E X E C U T E    ;
K_EXECUTIONPARALLELISM : E X E C U T I O N P A R A L L E L I S M    ;
K_EXPIRE : E X P I R E    ;
K_EXPLAIN : E X P L A I N    ;
K_EXPORT : E X P O R T    ;
K_EXTERNAL : E X T E R N A L    ;
K_FAILED_LOGIN_ATTEMPTS : F A I L E D  UNDERSCORE L O G I N  UNDERSCORE A T T E M P T S    ;
K_FAULT : F A U L T    ;
K_FENCED : F E N C E D    ;
K_FETCH : F E T C H    ;
K_FILESYSTEM : F I L E S Y S T E M    ;
K_FILLER : F I L L E R    ;
K_FILTER : F I L T E R    ;
K_FIRST : F I R S T    ;
K_FIXEDWIDTH : F I X E D W I D T H    ;
K_FLEX : F L E X    ;
K_FLEXIBLE : F L E X I B L E    ;
K_FOLLOWING : F O L L O W I N G    ;
K_FORCE : F O R C E    ;
K_FORMAT : F O R M A T    ;
K_FORWARD : F O R W A R D    ;
K_FREEZE : F R E E Z E    ;
K_FUNCTION : F U N C T I O N    ;
K_FUNCTIONS : F U N C T I O N S    ;
K_GCDDELTA : G C D D E L T A    ;
K_GET : G E T    ;
K_GLOBAL : G L O B A L    ;
K_GRACEPERIOD : G R A C E P E R I O D    ;
K_GROUPED : G R O U P E D    ;
K_GROUPING : G R O U P I N G    ;
K_GZIP : G Z I P    ;
K_GZIP_COMP : G Z I P  UNDERSCORE C O M P    ;
K_HANDLER : H A N D L E R    ;
K_HCATALOG : H C A T A L O G    ;
K_HCATALOG_CONNECTION_TIMEOUT : H C A T A L O G  UNDERSCORE C O N N E C T I O N  UNDERSCORE T I M E O U T    ;
K_HCATALOG_DB : H C A T A L O G  UNDERSCORE D B    ;
K_HCATALOG_SCHEMA : H C A T A L O G  UNDERSCORE S C H E M A    ;
K_HCATALOG_SLOW_TRANSFER_LIMIT : H C A T A L O G  UNDERSCORE S L O W  UNDERSCORE T R A N S F E R  UNDERSCORE L I M I T    ;
K_HCATALOG_SLOW_TRANSFER_TIME : H C A T A L O G  UNDERSCORE S L O W  UNDERSCORE T R A N S F E R  UNDERSCORE T I M E    ;
K_HCATALOG_USER : H C A T A L O G  UNDERSCORE U S E R    ;
K_HIGH : H I G H    ;
K_HIVE_PARTITION_COLS : H I V E  UNDERSCORE P A R T I T I O N  UNDERSCORE C O L S    ;
K_HIVESERVER2_HOSTNAME : H I V E S E R V E R '2' UNDERSCORE H O S T N A M E    ;
K_HOLD : H O L D    ;
K_HOST : H O S T    ;
K_HOSTNAME : H O S T N A M E    ;
K_HOUR : H O U R    ;
K_HOURS : H O U R S    ;
K_IDENTIFIED : I D E N T I F I E D    ;
K_IDENTITY : I D E N T I T Y    ;
K_IDLESESSIONTIMEOUT : I D L E S E S S I O N T I M E O U T    ;
K_IF : I F    ;
K_IGNORE : I G N O R E    ;
K_IMMEDIATE : I M M E D I A T E    ;
K_IMMUTABLE : I M M U T A B L E    ;
K_IMPLICIT : I M P L I C I T    ;
K_INCLUDE : I N C L U D E    ;
K_INCLUDING : I N C L U D I N G    ;
K_INCREMENT : I N C R E M E N T    ;
K_INDEX : I N D E X    ;
K_INHERITS : I N H E R I T S    ;
K_INPUT : I N P U T    ;
K_INSENSITIVE : I N S E N S I T I V E    ;
K_INSERT : I N S E R T    ;
K_INSTEAD : I N S T E A D    ;
K_INTERFACE : I N T E R F A C E    ;
K_INTERPOLATE : I N T E R P O L A T E    ;
K_INVOKER : I N V O K E R    ;
K_ISOLATION : I S O L A T I O N    ;
K_JSON : J S O N    ;
K_KEY : K E Y    ;
K_LABEL : L A B E L    ;
K_LANCOMPILER : L A N C O M P I L E R    ;
K_LANGUAGE : L A N G U A G E    ;
K_LARGE : L A R G E    ;
K_LAST : L A S T    ;
K_LATEST : L A T E S T    ;
K_LESS : L E S S    ;
K_LEVEL : L E V E L    ;
K_LIBRARY : L I B R A R Y    ;
K_LISTEN : L I S T E N    ;
K_LOAD : L O A D    ;
K_LOCAL : L O C A L    ;
K_LOCATION : L O C A T I O N    ;
K_LOCK : L O C K    ;
K_LONG : L O N G    ;
K_LOW : L O W    ;
K_LZO : L Z O    ;
K_MANAGED : M A N A G E D    ;
K_MASK : M A S K    ;
K_MATCHED : M A T C H E D    ;
K_MATERIALIZE : M A T E R I A L I Z E    ;
K_MAXCONCURRENCY : M A X C O N C U R R E N C Y    ;
K_MAXCONCURRENCYGRACE : M A X C O N C U R R E N C Y G R A C E    ;
K_MAXCONNECTIONS : M A X C O N N E C T I O N S    ;
K_MAXMEMORYSIZE : M A X M E M O R Y S I Z E    ;
K_MAXPAYLOAD : M A X P A Y L O A D    ;
K_MAXQUERYMEMORYSIZE : M A X Q U E R Y M E M O R Y S I Z E    ;
K_MAXVALUE : M A X V A L U E    ;
K_MEDIUM : M E D I U M    ;
K_MEMORYCAP : M E M O R Y C A P    ;
K_MEMORYSIZE : M E M O R Y S I Z E    ;
K_MERGE : M E R G E    ;
K_MERGEOUT : M E R G E O U T    ;
K_METHOD : M E T H O D    ;
K_MICROSECONDS : M I C R O S E C O N D S    ;
K_MILLISECONDS : M I L L I S E C O N D S    ;
K_MINUTE : M I N U T E    ;
K_MINUTES : M I N U T E S    ;
K_MINVALUE : M I N V A L U E    ;
K_MODE : M O D E    ;
K_MODEL : M O D E L    ;
K_MONTH : M O N T H    ;
K_MOVE : M O V E    ;
K_MOVEOUT : M O V E O U T    ;
K_NAME : N A M E    ;
K_NATIONAL : N A T I O N A L    ;
K_NATIVE : N A T I V E    ;
K_NETWORK : N E T W O R K    ;
K_NEXT : N E X T    ;
K_NO : N O    ;
K_NOCREATEDB : N O C R E A T E D B    ;
K_NOCREATEUSER : N O C R E A T E U S E R    ;
K_NODE : N O D E    ;
K_NODES : N O D E S    ;
K_NOTHING : N O T H I N G    ;
K_NOTIFIER : N O T I F I E R    ;
K_NOTIFY : N O T I F Y    ;
K_NOWAIT : N O W A I T    ;
K_NULLAWARE : N U L L A W A R E    ;
K_NULLCOLS : N U L L C O L S    ;
K_NULLS : N U L L S    ;
K_OBJECT : O B J E C T    ;
K_OCTETS : O C T E T S    ;
K_OF : O F    ;
K_OFF : O F F    ;
K_OIDS : O I D S    ;
K_OPERATOR : O P E R A T O R    ;
K_OPT : O P T    ;
K_OPTIMIZER : O P T I M I Z E R    ;
K_OPTION : O P T I O N    ;
K_OPTVER : O P T V E R    ;
K_ORC : O R C    ;
K_OTHERS : O T H E R S    ;
K_OWNER : O W N E R    ;
K_PARAMETER : P A R A M E T E R    ;
K_PARAMETERS : P A R A M E T E R S    ;
K_PARQUET : P A R Q U E T    ;
K_PARSER : P A R S E R    ;
K_PARTIAL : P A R T I A L    ;
K_PARTITION : P A R T I T I O N    ;
K_PARTITIONING : P A R T I T I O N I N G    ;
K_PASSWORD : P A S S W O R D    ;
K_PASSWORD_GRACE_TIME : P A S S W O R D  UNDERSCORE G R A C E  UNDERSCORE T I M E    ;
K_PASSWORD_LIFE_TIME : P A S S W O R D  UNDERSCORE L I F E  UNDERSCORE T I M E    ;
K_PASSWORD_LOCK_TIME : P A S S W O R D  UNDERSCORE L O C K  UNDERSCORE T I M E    ;
K_PASSWORD_MAX_LENGTH : P A S S W O R D  UNDERSCORE M A X  UNDERSCORE L E N G T H    ;
K_PASSWORD_MIN_DIGITS : P A S S W O R D  UNDERSCORE M I N  UNDERSCORE D I G I T S    ;
K_PASSWORD_MIN_LENGTH : P A S S W O R D  UNDERSCORE M I N  UNDERSCORE L E N G T H    ;
K_PASSWORD_MIN_LETTERS : P A S S W O R D  UNDERSCORE M I N  UNDERSCORE L E T T E R S    ;
K_PASSWORD_MIN_LOWERCASE_LETTERS : P A S S W O R D  UNDERSCORE M I N  UNDERSCORE L O W E R C A S E  UNDERSCORE L E T T E R S    ;
K_PASSWORD_MIN_SYMBOLS : P A S S W O R D  UNDERSCORE M I N  UNDERSCORE S Y M B O L S    ;
K_PASSWORD_MIN_UPPERCASE_LETTERS : P A S S W O R D  UNDERSCORE M I N  UNDERSCORE U P P E R C A S E  UNDERSCORE L E T T E R S    ;
K_PASSWORD_REUSE_MAX : P A S S W O R D  UNDERSCORE R E U S E  UNDERSCORE M A X    ;
K_PASSWORD_REUSE_TIME : P A S S W O R D  UNDERSCORE R E U S E  UNDERSCORE T I M E    ;
K_PATTERN : P A T T E R N    ;
K_PERCENT : P E R C E N T    ;
K_PERMANENT : P E R M A N E N T    ;
K_PLACING : P L A C I N G    ;
K_PLANNEDCONCURRENCY : P L A N N E D C O N C U R R E N C Y    ;
K_POLICY : P O L I C Y    ;
K_POOL : P O O L    ;
K_PORT : P O R T    ;
K_PRECEDING : P R E C E D I N G    ;
K_PREPARE : P R E P A R E    ;
K_PREPASS : P R E P A S S    ;
K_PRESERVE : P R E S E R V E    ;
K_PREVIOUS : P R E V I O U S    ;
K_PRIOR : P R I O R    ;
K_PRIORITY : P R I O R I T Y    ;
K_PRIVILEGES : P R I V I L E G E S    ;
K_PROCEDURAL : P R O C E D U R A L    ;
K_PROCEDURE : P R O C E D U R E    ;
K_PROFILE : P R O F I L E    ;
K_PROJECTION : P R O J E C T I O N    ;
K_PROJECTIONS : P R O J E C T I O N S    ;
K_PSDATE : P S D A T E    ;
K_QUERY : Q U E R Y    ;
K_QUEUETIMEOUT : Q U E U E T I M E O U T    ;
K_QUOTE : Q U O T E    ;
K_RANGE : R A N G E    ;
K_RAW : R A W    ;
K_READ : R E A D    ;
K_RECHECK : R E C H E C K    ;
K_RECORD : R E C O R D    ;
K_RECOVER : R E C O V E R    ;
K_RECURSIVE : R E C U R S I V E    ;
K_REFRESH : R E F R E S H    ;
K_REINDEX : R E I N D E X    ;
K_REJECTED : R E J E C T E D    ;
K_REJECTMAX : R E J E C T M A X    ;
K_RELATIVE : R E L A T I V E    ;
K_RELEASE : R E L E A S E    ;
K_REMOVE : R E M O V E    ;
K_RENAME : R E N A M E    ;
K_REORGANIZE : R E O R G A N I Z E    ;
K_REPEATABLE : R E P E A T A B L E    ;
K_REPLACE : R E P L A C E    ;
K_RESET : R E S E T    ;
K_RESOURCE : R E S O U R C E    ;
K_RESTART : R E S T A R T    ;
K_RESTRICT : R E S T R I C T    ;
K_RESULTS : R E S U L T S    ;
K_RETURN : R E T U R N    ;
K_RETURNREJECTED : R E T U R N R E J E C T E D    ;
K_REVOKE : R E V O K E    ;
K_RLE : R L E    ;
K_ROLE : R O L E    ;
K_ROLES : R O L E S    ;
K_ROLLBACK : R O L L B A C K    ;
K_ROLLUP : R O L L U P    ;
K_ROWS : R O W S    ;
K_RULE : R U L E    ;
K_RUNTIMECAP : R U N T I M E C A P    ;
K_RUNTIMEPRIORITY : R U N T I M E P R I O R I T Y    ;
K_RUNTIMEPRIORITYTHRESHOLD : R U N T I M E P R I O R I T Y T H R E S H O L D    ;
K_SAVE : S A V E    ;
K_SAVEPOINT : S A V E P O I N T    ;
K_SCROLL : S C R O L L    ;
K_SEARCH_PATH : S E A R C H  UNDERSCORE P A T H    ;
K_SECOND : S E C O N D    ;
K_SECONDS : S E C O N D S    ;
K_SECURITY : S E C U R I T Y    ;
K_SECURITY_ALGORITHM : S E C U R I T Y  UNDERSCORE A L G O R I T H M    ;
K_SEGMENTED : S E G M E N T E D    ;
K_SEMI : S E M I    ;
K_SEMIALL : S E M I A L L    ;
K_SEQUENCE : S E Q U E N C E    ;
K_SEQUENCES : S E Q U E N C E S    ;
K_SERIALIZABLE : S E R I A L I Z A B L E    ;
K_SESSION : S E S S I O N    ;
K_SET : S E T    ;
K_SETOF : S E T O F    ;
K_SETS : S E T S    ;
K_SHARE : S H A R E    ;
K_SHARED : S H A R E D    ;
K_SHOW : S H O W    ;
K_SIMPLE : S I M P L E    ;
K_SINGLEINITIATOR : S I N G L E I N I T I A T O R    ;
K_SITE : S I T E    ;
K_SITES : S I T E S    ;
K_SKIP : S K I P    ;
K_SOURCE : S O U R C E    ;
K_SPLIT : S P L I T    ;
K_SSL_CONFIG : S S L  UNDERSCORE C O N F I G    ;
K_STABLE : S T A B L E    ;
K_STANDBY : S T A N D B Y    ;
K_START : S T A R T    ;
K_STATEMENT : S T A T E M E N T    ;
K_STATISTICS : S T A T I S T I C S    ;
K_STDIN : S T D I N    ;
K_STDOUT : S T D O U T    ;
K_STEMMER : S T E M M E R    ;
K_STORAGE : S T O R A G E    ;
K_STREAM : S T R E A M    ;
K_STRENGTH : S T R E N G T H    ;
K_STRICT : S T R I C T    ;
K_SUBNET : S U B N E T    ;
K_SYSID : S Y S I D    ;
K_SYSTEM : S Y S T E M    ;
K_TABLES : T A B L E S    ;
K_TABLESAMPLE : T A B L E S A M P L E    ;
K_TABLESPACE : T A B L E S P A C E    ;
K_TEMP : T E M P    ;
K_TEMPLATE : T E M P L A T E    ;
K_TEMPORARY : T E M P O R A R Y    ;
K_TEMPSPACECAP : T E M P S P A C E C A P    ;
K_TERMINATOR : T E R M I N A T O R    ;
K_THAN : T H A N    ;
K_TIES : T I E S    ;
K_TLS : T L S    ;
K_TOAST : T O A S T    ;
K_TOKENIZER : T O K E N I Z E R    ;
K_TOLERANCE : T O L E R A N C E    ;
K_TRANSACTION : T R A N S A C T I O N    ;
K_TRANSFORM : T R A N S F O R M    ;
K_TRICKLE : T R I C K L E    ;
K_TRIGGER : T R I G G E R    ;
K_TRUNCATE : T R U N C A T E    ;
K_TRUSTED : T R U S T E D    ;
K_TUNING : T U N I N G    ;
K_TYPE : T Y P E    ;
K_UDPARAMETER : U D P A R A M E T E R    ;
K_UNCOMMITTED : U N C O M M I T T E D    ;
K_UNCOMPRESSED : U N C O M P R E S S E D    ;
K_UNI : U N I    ;
K_UNINDEXED : U N I N D E X E D    ;
K_UNKNOWN : U N K N O W N    ;
K_UNLIMITED : U N L I M I T E D    ;
K_UNLISTEN : U N L I S T E N    ;
K_UNLOCK : U N L O C K    ;
K_UNPACKER : U N P A C K E R    ;
K_UNSEGMENTED : U N S E G M E N T E D    ;
K_UPDATE : U P D A T E    ;
K_USAGE : U S A G E    ;
K_VACUUM : V A C U U M    ;
K_VALIDATE : V A L I D A T E    ;
K_VALIDATOR : V A L I D A T O R    ;
K_VALINDEX : V A L I N D E X    ;
K_VALUE : V A L U E    ;
K_VALUES : V A L U E S    ;
K_VARYING : V A R Y I N G    ;
K_VERBOSE : V E R B O S E    ;
K_VERTICA : V E R T I C A    ;
K_VIEW : V I E W    ;
K_VOLATILE : V O L A T I L E    ;
K_WAIT : W A I T    ;
K_WEBHDFS_ADDRESS : W E B H D F S  UNDERSCORE A D D R E S S    ;
K_WEBSERVICE_HOSTNAME : W E B S E R V I C E  UNDERSCORE H O S T N A M E    ;
K_WEBSERVICE_PORT : W E B S E R V I C E  UNDERSCORE P O R T    ;
K_WITHOUT : W I T H O U T    ;
K_WORK : W O R K    ;
K_WRITE : W R I T E    ;
K_YEAR : Y E A R    ;
K_ZONE : Z O N E    ;

// more keywords
K_UDPARAMETERS: U D P A R A M E T E R S;
K_ALLNODES: A L L N O D E S;
// additional
K_PUBLIC: P U B L I  C;
K_DIRECTORY: D I R E C T O R Y;
K_ROWGROUPSIZEMB: R O W G R O U P S I Z E M B;
K_COMPRESSION: C O M P R E S S I O N;
K_FILESIZEMB: F I L E S  I Z E M B ;
K_FILEMODE: F I L E M O D E;
K_DIRMODE: D I R M O D E;
K_ZSTD: Z S T D;
K_ROUTE: R O U T E;
K_ROUTING: R O U T I N G; 
K_ESCAPE_STRING_WARNING:
	E S C A P E UNDERSCORE S T R I N G UNDERSCORE W A R N I N G;

K_STANDARD_CONFORMING_STRINGS:
	S T A N D A R D UNDERSCORE C O N F O R M I N G UNDERSCORE S T R I N G S;

K_AUTOCOMMIT: A U T O C O M M I T;

K_LOCALE: L O C A L E;

K_MULTIPLEACTIVERESULTSETS:
	M U L T I P L E A C T I V E R E S U L T S E T S;

K_RESOURCE_POOL: R E S O U R C E UNDERSCORE P O O L;

K_INTERVALSTYLE: I N T E R V A L S T Y L E;

K_PLAIN: P L A I N;

K_UNITS: U N I T S;

K_DATESTYLE: D A T E S T Y L E;
K_ISO: I S O;
K_MDY: M D Y;
K_POSTGRES: P O S T G R E S;
K_SQL: S Q L;
K_GERMAN: G E R M A N;
K_DMY: D M Y;
K_TLSMODE: T L S M O D E;
K_PREFER: P R E F E R;
K_INT8: I N T '8';
K_FLOAT8: F L O A T '8';
K_GEOMETRY: G E O M E T R Y;

K_GEOGRAPHY: G E O G R A P H Y;
K_DATE: D A T E;

K_ADDRESS: A D D R E S S;
K_BALANCE: B A L A N C E;
K_GBYTYPE: G B Y T Y P E;
K_HASH: H A S H;
K_PIPE: P I P E;
K_SYN_JOIN: S Y N UNDERSCORE J O I N;
K_ENABLE_WITH_CLAUSE_MATERIALIZATION: E N A B L E UNDERSCORE W I T H UNDERSCORE C L A U S E UNDERSCORE M A T E R I A L I Z A T I O N;
K_EARLY_MATERIALIZATION: E A R L Y UNDERSCORE M A T E R I A L I Z A T I O N;
K_SYNTACTIC_JOIN: S Y N T A C T I C UNDERSCORE J O I N;
K_BRANCH: B R A N C H;
K_DATATYPE: D A  T A T Y P E;
K_VERBATIM: V E R B A T I M;
K_IGNORECONST: I G N O R E C O N S T;
K_UTYPE: U T Y P E;
K_JTYPE: J T Y P E;
K_DISTRIB: D I S T R I B;
K_PROJS: P R O J S;
K_SKIP_PROJS: S K I P UNDERSCORE P R O J S;

// symbols
COMMA: ',';
MINUS: '-';
STAR: '*';
PLUS: '+';
DCOLON: '::';
OPEN_PAREN: '(';
CLOSE_PAREN: ')';
DOT: '.';
SEMI: ';';
UNDERSCORE: '_';
// operator tokens
AMP: '&';
AMP_AMP: '&&';
AMP_LT: '&<';
BANG: '!';
BANG_BANG: '!!';
BANG_EQUAL: '!=';
EQUAL: '=';
EQUAL_GT: '=>';
EQUAL2: '<=>';
GT: '>';
GTE: '>=';
LT: '<';
LTE: '<=';
LT_GT: '<>';
DIV: '/';	
DPIPE: '||';

//other

IPV4_ADDR:
	[']? IPV4_OCTECT DOT IPV4_OCTECT DOT IPV4_OCTECT DOT IPV4_OCTECT [']?;

IPV6_ADDR:
	[']? IPV6_OCTECT [:] IPV6_OCTECT [:] IPV6_OCTECT [:] IPV6_OCTECT [:] IPV6_OCTECT [:] IPV6_OCTECT
		[:] IPV6_OCTECT [:] IPV6_OCTECT [']?;

// types

SPACE: [ \t\r\n]+ -> skip;

// comments

COMMENT: '/*' ~'+' ( COMMENT | .)*? '*/' -> channel ( HIDDEN );

LINE_COMMENT: '--' ~[\r\n]* -> channel ( HIDDEN );
COMMAND: ('\\' (.)*? ';'[\r\n]) -> channel ( HIDDEN );

OPEN_HINT: '/*+';
CLOSE_HINT: '*/';

// Identifiers

DOUBLE_QUOTE_STRING: E? '"' ( '\\'. | '""' | ~('"'| '\\') )* '"';

PARAM: ':' [\p{Alnum}\p{General_Category=Other_Letter}_]+;

WORD:
	[\p{Alpha}\p{General_Category=Other_Letter}_] [\p{Alnum}\p{General_Category=Other_Letter}_:]*;

SINGLE_QUOTE_STRING: E? '\'' ('\\'. | '\'\'' | ~('\'' | '\\'))* '\'';

FLOAT: [+-]? DEC_DOT_DEC;
REAL: [+-]? ( DECIMAL | DEC_DOT_DEC) ( 'E' [+-]? DEC_DIGIT+);
DECIMAL: [+-]? DEC_DIGIT+;
ANY: .;
fragment IPV6_OCTECT: HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT;

fragment IPV4_OCTECT: [0-9]? [0-9]? [0-9];

fragment DEC_DOT_DEC:
	(DEC_DIGIT+ '.' DEC_DIGIT+ | DEC_DIGIT+ '.' | '.' DEC_DIGIT+);

fragment HEX_DIGIT: [0-9A-Fa-f];

fragment DEC_DIGIT: [0-9];

// Fragments

fragment A: ( 'A' | 'a');

fragment B: ( 'B' | 'b');

fragment C: ( 'C' | 'c');

fragment D: ( 'D' | 'd');

fragment E: ( 'E' | 'e');

fragment F: ( 'F' | 'f');

fragment G: ( 'G' | 'g');

fragment H: ( 'H' | 'h');

fragment I: ( 'I' | 'i');

fragment J: ( 'J' | 'j');

fragment K: ( 'K' | 'k');

fragment L: ( 'L' | 'l');

fragment M: ( 'M' | 'm');

fragment N: ( 'N' | 'n');

fragment O: ( 'O' | 'o');

fragment P: ( 'P' | 'p');

fragment Q: ( 'Q' | 'q');

fragment R: ( 'R' | 'r');

fragment S: ( 'S' | 's');

fragment T: ( 'T' | 't');

fragment U: ( 'U' | 'u');

fragment V: ( 'V' | 'v');

fragment W: ( 'W' | 'w');

fragment X: ( 'X' | 'x');

fragment Y: ( 'Y' | 'y');

fragment Z: ( 'Z' | 'z');
