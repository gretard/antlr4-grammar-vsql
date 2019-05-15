lexer grammar VSqlLexer;

@header {
  package org.antlr4.vsql;
}
tokens { KEYWORD }
//Keywords

K_ABORT
:
	A B O R T
;

K_ABSOLUTE
:
	A B S O L U T E
;

K_ACCESS
:
	A C C E S S
;

K_ACCESSRANK
:
	A C C E S S R A N K
;

K_ACCOUNT
:
	A C C O U N T
;

K_ACTION
:
	A C T I O N
;

K_ACTIVATE
:
	A C T I V A T E
;

K_ACTIVEPARTITIONCOUNT
:
	A C T I V E P A R T I T I O N C O U N T
;

K_ADD
:
	A D D
;

K_ADMIN
:
	A D M I N
;

K_AFTER
:
	A F T E R
;

K_AGGREGATE
:
	A G G R E G A T E
;

K_ALL
:
	A L L
;

K_ALSO
:
	A L S O
;

K_ALTER
:
	A L T E R
;

K_ANALYSE
:
	A N A L Y S E
;

K_ANALYTIC
:
	A N A L Y T I C
;

K_ANALYZE
:
	A N A L Y Z E
;

K_AND
:
	A N D
;

K_ANNOTATED
:
	A N N O T A T E D
;

K_ANTI
:
	A N T I
;

K_ANY
:
	A N Y
;

K_ARRAY
:
	A R R A Y
;

K_AS
:
	A S
;

K_ASC
:
	A S C
;

K_ASSERTION
:
	A S S E R T I O N
;

K_ASSIGNMENT
:
	A S S I G N M E N T
;

K_AT
:
	A T
;

K_AUTHENTICATION
:
	A U T H E N T I C A T I O N
;

K_AUTHORIZATION
:
	A U T H O R I Z A T I O N
;

K_AUTO
:
	A U T O
;

K_AUTO_INCREMENT
:
	A U T O UNDERSCORE I N C R E M E N T
;

K_AVAILABLE
:
	A V A I L A B L E
;

K_BACKWARD
:
	B A C K W A R D
;

K_BASENAME
:
	B A S E N A M E
;

K_BATCH
:
	B A T C H
;

K_BEFORE
:
	B E F O R E
;

K_BEGIN
:
	B E G I N
;

K_BEST
:
	B E S T
;

K_BETWEEN
:
	B E T W E E N
;

K_BIGINT
:
	B I G I N T
;

K_BINARY
:
	B I N A R Y
;

K_BIT
:
	B I T
;

K_BLOCK
:
	B L O C K
;

K_BLOCKDICT_COMP
:
	B L O C K D I C T UNDERSCORE C O M P
;

K_BLOCK_DICT
:
	B L O C K UNDERSCORE D I C T
;

K_BOOLEAN
:
	B O O L E A N
;

K_BOTH
:
	B O T H
;

K_BROADCAST
:
	B R O A D C A S T
;

K_BY
:
	B Y
;

K_BYTEA
:
	B Y T E A
;

K_BYTES
:
	B Y T E S
;

K_BZIP
:
	B Z I P
;

K_BZIP_COMP
:
	B Z I P UNDERSCORE C O M P
;

K_CACHE
:
	C A C H E
;

K_CALLED
:
	C A L L E D
;

K_CASCADE
:
	C A S C A D E
;

K_CASE
:
	C A S E
;

K_CAST
:
	C A S T
;

K_CATALOGPATH
:
	C A T A L O G P A T H
;

K_CHAIN
:
	C H A I N
;

K_CHAR
:
	C H A R
;

K_CHARACTER
:
	C H A R A C T E R
;

K_CHARACTERISTICS
:
	C H A R A C T E R I S T I C S
;

K_CHARACTERS
:
	C H A R A C T E R S
;

K_CHARACTER_LENGTH
:
	C H A R A C T E R UNDERSCORE L E N G T H
;

K_CHAR_LENGTH
:
	C H A R UNDERSCORE L E N G T H
;

K_CHECK
:
	C H E C K
;

K_CHECKPOINT
:
	C H E C K P O I N T
;

K_CLASS
:
	C L A S S
;

K_CLEAR
:
	C L E A R
;

K_CLOSE
:
	C L O S E
;

K_CLUSTER
:
	C L U S T E R
;

K_COLLATE
:
	C O L L A T E
;

K_COLSIZES
:
	C O L S I Z E S
;

K_COLUMN
:
	C O L U M N
;

K_COLUMNS_COUNT
:
	C O L U M N S UNDERSCORE C O U N T
;

K_COMMENT
:
	C O M M E N T
;

K_COMMIT
:
	C O M M I T
;

K_COMMITTED
:
	C O M M I T T E D
;

K_COMMONDELTA_COMP
:
	C O M M O N D E L T A UNDERSCORE C O M P
;

K_COMMUNAL
:
	C O M M U N A L
;

K_COMPLEX
:
	C O M P L E X
;

K_CONNECT
:
	C O N N E C T
;

K_CONSTRAINT
:
	C O N S T R A I N T
;

K_CONSTRAINTS
:
	C O N S T R A I N T S
;

K_CONTROL
:
	C O N T R O L
;

K_COPY
:
	C O P Y
;

K_CORRELATION
:
	C O R R E L A T I O N
;

K_CPUAFFINITYMODE
:
	C P U A F F I N I T Y M O D E
;

K_CPUAFFINITYSET
:
	C P U A F F I N I T Y S E T
;

K_CREATE
:
	C R E A T E
;

K_CREATEDB
:
	C R E A T E D B
;

K_CREATEUSER
:
	C R E A T E U S E R
;

K_CROSS
:
	C R O S S
;

K_CSV
:
	C S V
;

K_CUBE
:
	C U B E
;

K_CURRENT
:
	C U R R E N T
;

K_CURRENT_DATABASE
:
	C U R R E N T UNDERSCORE D A T A B A S E
;

K_CURRENT_DATE
:
	C U R R E N T UNDERSCORE D A T E
;

K_CURRENT_SCHEMA
:
	C U R R E N T UNDERSCORE S C H E M A
;

K_CURRENT_TIME
:
	C U R R E N T UNDERSCORE T I M E
;

K_CURRENT_TIMESTAMP
:
	C U R R E N T UNDERSCORE T I M E S T A M P
;

K_CURRENT_USER
:
	C U R R E N T UNDERSCORE U S E R
;

K_CURSOR
:
	C U R S O R
;

K_CUSTOM
:
	C U S T O M
;

K_CUSTOM_PARTITIONS
:
	C U S T O M UNDERSCORE P A R T I T I O N S
;

K_CYCLE
:
	C Y C L E
;

K_DATA
:
	D A T A
;

K_DATABASE
:
	D A T A B A S E
;

K_DATAPATH
:
	D A T A P A T H
;

K_DATEDIFF
:
	D A T E D I F F
;

K_DATETIME
:
	D A T E T I M E
;

K_DAY
:
	D A Y
;

K_DEACTIVATE
:
	D E A C T I V A T E
;

K_DEALLOCATE
:
	D E A L L O C A T E
;

K_DEC
:
	D E C
;

K_DECIMAL
:
	D E C I M A L
;

K_DECLARE
:
	D E C L A R E
;

K_DECODE
:
	D E C O D E
;

K_DEFAULT
:
	D E F A U L T
;

K_DEFAULTS
:
	D E F A U L T S
;

K_DEFERRABLE
:
	D E F E R R A B L E
;

K_DEFERRED
:
	D E F E R R E D
;

K_DEFINE
:
	D E F I N E
;

K_DEFINER
:
	D E F I N E R
;

K_DELETE
:
	D E L E T E
;

K_DELIMITER
:
	D E L I M I T E R
;

K_DELIMITERS
:
	D E L I M I T E R S
;

K_DELTARANGE_COMP
:
	D E L T A R A N G E UNDERSCORE C O M P
;

K_DELTARANGE_COMP_SP
:
	D E L T A R A N G E UNDERSCORE C O M P UNDERSCORE S P
;

K_DELTAVAL
:
	D E L T A V A L
;

K_DEPENDS
:
	D E P E N D S
;

K_DESC
:
	D E S C
;

K_DETERMINES
:
	D E T E R M I N E S
;

K_DIRECT
:
	D I R E C T
;

K_DIRECTCOLS
:
	D I R E C T C O L S
;

K_DIRECTED
:
	D I R E C T E D
;

K_DIRECTGROUPED
:
	D I R E C T G R O U P E D
;

K_DIRECTPROJ
:
	D I R E C T P R O J
;

K_DISABLE
:
	D I S A B L E
;

K_DISABLED
:
	D I S A B L E D
;

K_DISCONNECT
:
	D I S C O N N E C T
;

K_DISTINCT
:
	D I S T I N C T
;

K_DISTVALINDEX
:
	D I S T V A L I N D E X
;

K_DO
:
	D O
;

K_DOMAIN
:
	D O M A I N
;

K_DOUBLE
:
	D O U B L E
;

K_DROP
:
	D R O P
;

K_DURABLE
:
	D U R A B L E
;

K_EACH
:
	E A C H
;

K_ELSE
:
	E L S E
;

K_ENABLE
:
	E N A B L E
;

K_ENABLED
:
	E N A B L E D
;

K_ENCLOSED
:
	E N C L O S E D
;

K_ENCODED
:
	E N C O D E D
;

K_ENCODING
:
	E N C O D I N G
;

K_ENCRYPTED
:
	E N C R Y P T E D
;

K_END
:
	E N D
;

K_ENFORCELENGTH
:
	E N F O R C E L E N G T H
;

K_EPHEMERAL
:
	E P H E M E R A L
;

K_EPOCH
:
	E P O C H
;

K_ERROR
:
	E R R O R
;

K_ESCAPE
:
	E S C A P E
;

K_EVENT
:
	E V E N T
;

K_EVENTS
:
	E V E N T S
;

K_EXCEPT
:
	E X C E P T
;

K_EXCEPTION
:
	E X C E P T I O N
;

K_EXCEPTIONS
:
	E X C E P T I O N S
;

K_EXCLUDE
:
	E X C L U D E
;

K_EXCLUDING
:
	E X C L U D I N G
;

K_EXCLUSIVE
:
	E X C L U S I V E
;

K_EXECUTE
:
	E X E C U T E
;

K_EXECUTIONPARALLELISM
:
	E X E C U T I O N P A R A L L E L I S M
;

K_EXISTS
:
	E X I S T S
;

K_EXPIRE
:
	E X P I R E
;

K_EXPLAIN
:
	E X P L A I N
;

K_EXPORT
:
	E X P O R T
;

K_EXTERNAL
:
	E X T E R N A L
;

K_EXTRACT
:
	E X T R A C T
;

K_FAILED_LOGIN_ATTEMPTS
:
	F A I L E D UNDERSCORE L O G I N UNDERSCORE A T T E M P T S
;

K_FALSE
:
	F A L S E
;

K_FAULT
:
	F A U L T
;

K_FENCED
:
	F E N C E D
;

K_FETCH
:
	F E T C H
;

K_FILESYSTEM
:
	F I L E S Y S T E M
;

K_FILLER
:
	F I L L E R
;

K_FILTER
:
	F I L T E R
;

K_FIRST
:
	F I R S T
;

K_FIXEDWIDTH
:
	F I X E D W I D T H
;

K_FLEX
:
	F L E X
;

K_FLEXIBLE
:
	F L E X I B L E
;

K_FLOAT
:
	F L O A T
;

K_FOLLOWING
:
	F O L L O W I N G
;

K_FOR
:
	F O R
;

K_FORCE
:
	F O R C E
;

K_FOREIGN
:
	F O R E I G N
;

K_FORMAT
:
	F O R M A T
;

K_FORWARD
:
	F O R W A R D
;

K_FREEZE
:
	F R E E Z E
;

K_FROM
:
	F R O M
;

K_FULL
:
	F U L L
;

K_FUNCTION
:
	F U N C T I O N
;

K_FUNCTIONS
:
	F U N C T I O N S
;

K_GCDDELTA
:
	G C D D E L T A
;

K_GET
:
	G E T
;

K_GLOBAL
:
	G L O B A L
;

K_GRACEPERIOD
:
	G R A C E P E R I O D
;

K_GRANT
:
	G R A N T
;

K_GROUP
:
	G R O U P
;

K_GROUPED
:
	G R O U P E D
;

K_GROUPING
:
	G R O U P I N G
;

K_GZIP
:
	G Z I P
;

K_GZIP_COMP
:
	G Z I P UNDERSCORE C O M P
;

K_HANDLER
:
	H A N D L E R
;

K_HAVING
:
	H A V I N G
;

K_HCATALOG
:
	H C A T A L O G
;

K_HCATALOG_CONNECTION_TIMEOUT
:
	H C A T A L O G UNDERSCORE C O N N E C T I O N UNDERSCORE T I M E O U T
;

K_HCATALOG_DB
:
	H C A T A L O G UNDERSCORE D B
;

K_HCATALOG_SCHEMA
:
	H C A T A L O G UNDERSCORE S C H E M A
;

K_HCATALOG_SLOW_TRANSFER_LIMIT
:
	H C A T A L O G UNDERSCORE S L O W UNDERSCORE T R A N S F E R UNDERSCORE L I
	M I T
;

K_HCATALOG_SLOW_TRANSFER_TIME
:
	H C A T A L O G UNDERSCORE S L O W UNDERSCORE T R A N S F E R UNDERSCORE T I
	M E
;

K_HCATALOG_USER
:
	H C A T A L O G UNDERSCORE U S E R
;

K_HIGH
:
	H I G H
;

K_HIVESERVER2_HOSTNAME
:
	H I V E S E R V E R '2' UNDERSCORE H O S T N A M E
;

K_HIVE_PARTITION_COLS
:
	H I V E UNDERSCORE P A R T I T I O N UNDERSCORE C O L S
;

K_HOLD
:
	H O L D
;

K_HOST
:
	H O S T
;

K_HOSTNAME
:
	H O S T N A M E
;

K_HOUR
:
	H O U R
;

K_HOURS
:
	H O U R S
;

K_IDENTIFIED
:
	I D E N T I F I E D
;

K_IDENTITY
:
	I D E N T I T Y
;

K_IDLESESSIONTIMEOUT
:
	I D L E S E S S I O N T I M E O U T
;

K_IF
:
	I F
;

K_IGNORE
:
	I G N O R E
;

K_ILIKE
:
	I L I K E
;

K_ILIKEB
:
	I L I K E B
;

K_IMMEDIATE
:
	I M M E D I A T E
;

K_IMMUTABLE
:
	I M M U T A B L E
;

K_IMPLICIT
:
	I M P L I C I T
;

K_IN
:
	I N
;

K_INCLUDE
:
	I N C L U D E
;

K_INCLUDING
:
	I N C L U D I N G
;

K_INCREMENT
:
	I N C R E M E N T
;

K_INDEX
:
	I N D E X
;

K_INHERITS
:
	I N H E R I T S
;

K_INITIALLY
:
	I N I T I A L L Y
;

K_INNER
:
	I N N E R
;

K_INOUT
:
	I N O U T
;

K_INPUT
:
	I N P U T
;

K_INSENSITIVE
:
	I N S E N S I T I V E
;

K_INSERT
:
	I N S E R T
;

K_INSTEAD
:
	I N S T E A D
;

K_INT
:
	I N T
;

K_INTEGER
:
	I N T E G E R
;

K_INTERFACE
:
	I N T E R F A C E
;

K_INTERPOLATE
:
	I N T E R P O L A T E
;

K_INTERSECT
:
	I N T E R S E C T
;

K_INTERVAL
:
	I N T E R V A L
;

K_INTERVALYM
:
	I N T E R V A L Y M
;

K_INTO
:
	I N T O
;

K_INVOKER
:
	I N V O K E R
;

K_IS
:
	I S
;

K_ISNULL
:
	I S N U L L
;

K_ISOLATION
:
	I S O L A T I O N
;

K_JOIN
:
	J O I N
;

K_JSON
:
	J S O N
;

K_KEY
:
	K E Y
;

K_KSAFE
:
	K S A F E
;

K_LABEL
:
	L A B E L
;

K_LANCOMPILER
:
	L A N C O M P I L E R
;

K_LANGUAGE
:
	L A N G U A G E
;

K_LARGE
:
	L A R G E
;

K_LAST
:
	L A S T
;

K_LATEST
:
	L A T E S T
;

K_LEADING
:
	L E A D I N G
;

K_LEFT
:
	L E F T
;

K_LESS
:
	L E S S
;

K_LEVEL
:
	L E V E L
;

K_LIBRARY
:
	L I B R A R Y
;

K_LIKE
:
	L I K E
;

K_LIKEB
:
	L I K E B
;

K_LIMIT
:
	L I M I T
;

K_LISTEN
:
	L I S T E N
;

K_LOAD
:
	L O A D
;

K_LOCAL
:
	L O C A L
;

K_LOCALTIME
:
	L O C A L T I M E
;

K_LOCALTIMESTAMP
:
	L O C A L T I M E S T A M P
;

K_LOCATION
:
	L O C A T I O N
;

K_LOCK
:
	L O C K
;

K_LONG
:
	L O N G
;

K_LOW
:
	L O W
;

K_LZO
:
	L Z O
;

K_MANAGED
:
	M A N A G E D
;

K_MASK
:
	M A S K
;

K_MATCH
:
	M A T C H
;

K_MATCHED
:
	M A T C H E D
;

K_MATERIALIZE
:
	M A T E R I A L I Z E
;

K_MAXCONCURRENCY
:
	M A X C O N C U R R E N C Y
;

K_MAXCONCURRENCYGRACE
:
	M A X C O N C U R R E N C Y G R A C E
;

K_MAXCONNECTIONS
:
	M A X C O N N E C T I O N S
;

K_MAXMEMORYSIZE
:
	M A X M E M O R Y S I Z E
;

K_MAXPAYLOAD
:
	M A X P A Y L O A D
;

K_MAXQUERYMEMORYSIZE
:
	M A X Q U E R Y M E M O R Y S I Z E
;

K_MAXVALUE
:
	M A X V A L U E
;

K_MEDIUM
:
	M E D I U M
;

K_MEMORYCAP
:
	M E M O R Y C A P
;

K_MEMORYSIZE
:
	M E M O R Y S I Z E
;

K_MERGE
:
	M E R G E
;

K_MERGEOUT
:
	M E R G E O U T
;

K_METHOD
:
	M E T H O D
;

K_MICROSECONDS
:
	M I C R O S E C O N D S
;

K_MILLISECONDS
:
	M I L L I S E C O N D S
;

K_MINUS
:
	M I N U S
;

K_MINUTE
:
	M I N U T E
;

K_MINUTES
:
	M I N U T E S
;

K_MINVALUE
:
	M I N V A L U E
;

K_MODE
:
	M O D E
;

K_MODEL
:
	M O D E L
;

K_MONEY
:
	M O N E Y
;

K_MONTH
:
	M O N T H
;

K_MOVE
:
	M O V E
;

K_MOVEOUT
:
	M O V E O U T
;

K_NAME
:
	N A M E
;

K_NATIONAL
:
	N A T I O N A L
;

K_NATIVE
:
	N A T I V E
;

K_NATURAL
:
	N A T U R A L
;

K_NCHAR
:
	N C H A R
;

K_NETWORK
:
	N E T W O R K
;

K_NEW
:
	N E W
;

K_NEXT
:
	N E X T
;

K_NO
:
	N O
;

K_NOCREATEDB
:
	N O C R E A T E D B
;

K_NOCREATEUSER
:
	N O C R E A T E U S E R
;

K_NODE
:
	N O D E
;

K_NODES
:
	N O D E S
;

K_NONE
:
	N O N E
;

K_NOT
:
	N O T
;

K_NOTHING
:
	N O T H I N G
;

K_NOTIFIER
:
	N O T I F I E R
;

K_NOTIFY
:
	N O T I F Y
;

K_NOTNULL
:
	N O T N U L L
;

K_NOWAIT
:
	N O W A I T
;

K_NULL
:
	N U L L
;

K_NULLAWARE
:
	N U L L A W A R E
;

K_NULLCOLS
:
	N U L L C O L S
;

K_NULLS
:
	N U L L S
;

K_NULLSEQUAL
:
	N U L L S E Q U A L
;

K_NUMBER
:
	N U M B E R
;

K_NUMERIC
:
	N U M E R I C
;

K_OBJECT
:
	O B J E C T
;

K_OCTETS
:
	O C T E T S
;

K_OF
:
	O F
;

K_OFF
:
	O F F
;

K_OFFSET
:
	O F F S E T
;

K_OIDS
:
	O I D S
;

K_OLD
:
	O L D
;

K_ON
:
	O N
;

K_ONLY
:
	O N L Y
;

K_OPERATOR
:
	O P E R A T O R
;

K_OPT
:
	O P T
;

K_OPTIMIZER
:
	O P T I M I Z E R
;

K_OPTION
:
	O P T I O N
;

K_OPTVER
:
	O P T V E R
;

K_OR
:
	O R
;

K_ORC
:
	O R C
;

K_ORDER
:
	O R D E R
;

K_OTHERS
:
	O T H E R S
;

K_OUT
:
	O U T
;

K_OUTER
:
	O U T E R
;

K_OVER
:
	O V E R
;

K_OVERLAPS
:
	O V E R L A P S
;

K_OVERLAY
:
	O V E R L A Y
;

K_OWNER
:
	O W N E R
;

K_PARAMETER
:
	P A R A M E T E R
;

K_PARAMETERS
:
	P A R A M E T E R S
;

K_PARQUET
:
	P A R Q U E T
;

K_PARSER
:
	P A R S E R
;

K_PARTIAL
:
	P A R T I A L
;

K_PARTITION
:
	P A R T I T I O N
;

K_PARTITIONING
:
	P A R T I T I O N I N G
;

K_PASSWORD
:
	P A S S W O R D
;

K_PASSWORD_GRACE_TIME
:
	P A S S W O R D UNDERSCORE G R A C E UNDERSCORE T I M E
;

K_PASSWORD_LIFE_TIME
:
	P A S S W O R D UNDERSCORE L I F E UNDERSCORE T I M E
;

K_PASSWORD_LOCK_TIME
:
	P A S S W O R D UNDERSCORE L O C K UNDERSCORE T I M E
;

K_PASSWORD_MAX_LENGTH
:
	P A S S W O R D UNDERSCORE M A X UNDERSCORE L E N G T H
;

K_PASSWORD_MIN_DIGITS
:
	P A S S W O R D UNDERSCORE M I N UNDERSCORE D I G I T S
;

K_PASSWORD_MIN_LENGTH
:
	P A S S W O R D UNDERSCORE M I N UNDERSCORE L E N G T H
;

K_PASSWORD_MIN_LETTERS
:
	P A S S W O R D UNDERSCORE M I N UNDERSCORE L E T T E R S
;

K_PASSWORD_MIN_LOWERCASE_LETTERS
:
	P A S S W O R D UNDERSCORE M I N UNDERSCORE L O W E R C A S E UNDERSCORE L E
	T T E R S
;

K_PASSWORD_MIN_SYMBOLS
:
	P A S S W O R D UNDERSCORE M I N UNDERSCORE S Y M B O L S
;

K_PASSWORD_MIN_UPPERCASE_LETTERS
:
	P A S S W O R D UNDERSCORE M I N UNDERSCORE U P P E R C A S E UNDERSCORE L E
	T T E R S
;

K_PASSWORD_REUSE_MAX
:
	P A S S W O R D UNDERSCORE R E U S E UNDERSCORE M A X
;

K_PASSWORD_REUSE_TIME
:
	P A S S W O R D UNDERSCORE R E U S E UNDERSCORE T I M E
;

K_PATTERN
:
	P A T T E R N
;

K_PERCENT
:
	P E R C E N T
;

K_PERMANENT
:
	P E R M A N E N T
;

K_PINNED
:
	P I N N E D
;

K_PLACING
:
	P L A C I N G
;

K_PLANNEDCONCURRENCY
:
	P L A N N E D C O N C U R R E N C Y
;

K_POLICY
:
	P O L I C Y
;

K_POOL
:
	P O O L
;

K_PORT
:
	P O R T
;

K_POSITION
:
	P O S I T I O N
;

K_PRECEDING
:
	P R E C E D I N G
;

K_PRECISION
:
	P R E C I S I O N
;

K_PREPARE
:
	P R E P A R E
;

K_PREPASS
:
	P R E P A S S
;

K_PRESERVE
:
	P R E S E R V E
;

K_PREVIOUS
:
	P R E V I O U S
;

K_PRIMARY
:
	P R I M A R Y
;

K_PRIOR
:
	P R I O R
;

K_PRIORITY
:
	P R I O R I T Y
;

K_PRIVILEGES
:
	P R I V I L E G E S
;

K_PROCEDURAL
:
	P R O C E D U R A L
;

K_PROCEDURE
:
	P R O C E D U R E
;

K_PROFILE
:
	P R O F I L E
;

K_PROJECTION
:
	P R O J E C T I O N
;

K_PROJECTIONS
:
	P R O J E C T I O N S
;

K_PSDATE
:
	P S D A T E
;

K_QUERY
:
	Q U E R Y
;

K_QUEUETIMEOUT
:
	Q U E U E T I M E O U T
;

K_QUOTE
:
	Q U O T E
;

K_RANGE
:
	R A N G E
;

K_RAW
:
	R A W
;

K_READ
:
	R E A D
;

K_REAL
:
	R E A L
;

K_RECHECK
:
	R E C H E C K
;

K_RECORD
:
	R E C O R D
;

K_RECOVER
:
	R E C O V E R
;

K_RECURSIVE
:
	R E C U R S I V E
;

K_REFERENCES
:
	R E F E R E N C E S
;

K_REFRESH
:
	R E F R E S H
;

K_REINDEX
:
	R E I N D E X
;

K_REJECTED
:
	R E J E C T E D
;

K_REJECTMAX
:
	R E J E C T M A X
;

K_RELATIVE
:
	R E L A T I V E
;

K_RELEASE
:
	R E L E A S E
;

K_REMOVE
:
	R E M O V E
;

K_RENAME
:
	R E N A M E
;

K_REORGANIZE
:
	R E O R G A N I Z E
;

K_REPEATABLE
:
	R E P E A T A B L E
;

K_REPLACE
:
	R E P L A C E
;

K_RESET
:
	R E S E T
;

K_RESOURCE
:
	R E S O U R C E
;

K_RESTART
:
	R E S T A R T
;

K_RESTRICT
:
	R E S T R I C T
;

K_RESULTS
:
	R E S U L T S
;

K_RETURN
:
	R E T U R N
;

K_RETURNREJECTED
:
	R E T U R N R E J E C T E D
;

K_REVOKE
:
	R E V O K E
;

K_RIGHT
:
	R I G H T
;

K_RLE
:
	R L E
;

K_ROLE
:
	R O L E
;

K_ROLES
:
	R O L E S
;

K_ROLLBACK
:
	R O L L B A C K
;

K_ROLLUP
:
	R O L L U P
;

K_ROW
:
	R O W
;

K_ROWS
:
	R O W S
;

K_RULE
:
	R U L E
;

K_RUNTIMECAP
:
	R U N T I M E C A P
;

K_RUNTIMEPRIORITY
:
	R U N T I M E P R I O R I T Y
;

K_RUNTIMEPRIORITYTHRESHOLD
:
	R U N T I M E P R I O R I T Y T H R E S H O L D
;

K_SAVE
:
	S A V E
;

K_SAVEPOINT
:
	S A V E P O I N T
;

K_SCHEMA
:
	S C H E M A
;

K_SCROLL
:
	S C R O L L
;

K_SEARCH_PATH
:
	S E A R C H UNDERSCORE P A T H
;

K_SECOND
:
	S E C O N D
;

K_SECONDS
:
	S E C O N D S
;

K_SECURITY
:
	S E C U R I T Y
;

K_SECURITY_ALGORITHM
:
	S E C U R I T Y UNDERSCORE A L G O R I T H M
;

K_SEGMENTED
:
	S E G M E N T E D
;

K_SELECT
:
	S E L E C T
;

K_SEMI
:
	S E M I
;

K_SEMIALL
:
	S E M I A L L
;

K_SEQUENCE
:
	S E Q U E N C E
;

K_SEQUENCES
:
	S E Q U E N C E S
;

K_SERIALIZABLE
:
	S E R I A L I Z A B L E
;

K_SESSION
:
	S E S S I O N
;

K_SESSION_USER
:
	S E S S I O N UNDERSCORE U S E R
;

K_SET
:
	S E T
;

K_SETOF
:
	S E T O F
;

K_SETS
:
	S E T S 
;

K_SHARE
:
	S H A R E
;

K_SHARED
:
	S H A R E D
;

K_SHOW
:
	S H O W
;

K_SIMILAR
:
	S I M I L A R
;

K_SIMPLE
:
	S I M P L E
;

K_SINGLEINITIATOR
:
	S I N G L E I N I T I A T O R
;

K_SITE
:
	S I T E
;

K_SITES
:
	S I T E S
;

K_SKIP
:
	S K I P
;

K_SMALLDATETIME
:
	S M A L L D A T E T I M E
;

K_SMALLINT
:
	S M A L L I N T
;

K_SOME
:
	S O M E
;

K_SOURCE
:
	S O U R C E
;

K_SPLIT
:
	S P L I T
;

K_SSL_CONFIG
:
	S S L UNDERSCORE C O N F I G
;

K_STABLE
:
	S T A B L E
;

K_STANDBY
:
	S T A N D B Y
;

K_START
:
	S T A R T
;

K_STATEMENT
:
	S T A T E M E N T
;

K_STATISTICS
:
	S T A T I S T I C S
;

K_STDIN
:
	S T D I N
;

K_STDOUT
:
	S T D O U T
;

K_STEMMER
:
	S T E M M E R
;

K_STORAGE
:
	S T O R A G E
;

K_STREAM
:
	S T R E A M
;

K_STRENGTH
:
	S T R E N G T H
;

K_STRICT
:
	S T R I C T
;

K_SUBNET
:
	S U B N E T
;

K_SUBSTRING
:
	S U B S T R I N G
;

K_SYSDATE
:
	S Y S D A T E
;

K_SYSID
:
	S Y S I D
;

K_SYSTEM
:
	S Y S T E M
;

K_TABLE
:
	T A B L E
;

K_TABLES
:
	T A B L E S
;

K_TABLESAMPLE
:
	T A B L E S A M P L E
;

K_TABLESPACE
:
	T A B L E S P A C E
;

K_TEMP
:
	T E M P
;

K_TEMPLATE
:
	T E M P L A T E
;

K_TEMPORARY
:
	T E M P O R A R Y
;

K_TEMPSPACECAP
:
	T E M P S P A C E C A P
;

K_TERMINATOR
:
	T E R M I N A T O R
;

K_TEXT
:
	T E X T
;

K_THAN
:
	T H A N
;

K_THEN
:
	T H E N
;

K_TIES
:
	T I E S
;

K_TIME
:
	T I M E
;

K_TIMESERIES
:
	T I M E S E R I E S
;

K_TIMESTAMP
:
	T I M E S T A M P
;

K_TIMESTAMPADD
:
	T I M E S T A M P A D D
;

K_TIMESTAMPDIFF
:
	T I M E S T A M P D I F F
;

K_TIMESTAMPTZ
:
	T I M E S T A M P T Z
;

K_TIMETZ
:
	T I M E T Z
;

K_TIMEZONE
:
	T I M E Z O N E
;

K_TINYINT
:
	T I N Y I N T
;

K_TLS
:
	T L S
;

K_TO
:
	T O
;

K_TOAST
:
	T O A S T
;

K_TOKENIZER
:
	T O K E N I Z E R
;

K_TOLERANCE
:
	T O L E R A N C E
;

K_TRAILING
:
	T R A I L I N G
;

K_TRANSACTION
:
	T R A N S A C T I O N
;

K_TRANSFORM
:
	T R A N S F O R M
;

K_TREAT
:
	T R E A T
;

K_TRICKLE
:
	T R I C K L E
;

K_TRIGGER
:
	T R I G G E R
;

K_TRIM
:
	T R I M
;

K_TRUE
:
	T R U E
;

K_TRUNCATE
:
	T R U N C A T E
;

K_TRUSTED
:
	T R U S T E D
;

K_TUNING
:
	T U N I N G
;

K_TYPE
:
	T Y P E
;

K_UDPARAMETERS
:
	U D P A R A M E T E R S
;

K_UDPARAMETER
:
	U D P A R A M E T E R
;

K_UNBOUNDED
:
	U N B O U N D E D
;

K_UNCOMMITTED
:
	U N C O M M I T T E D
;

K_UNCOMPRESSED
:
	U N C O M P R E S S E D
;

K_UNI
:
	U N I
;

K_UNINDEXED
:
	U N I N D E X E D
;

K_UNION
:
	U N I O N
;

K_UNIQUE
:
	U N I Q U E
;

K_UNKNOWN
:
	U N K N O W N
;

K_UNLIMITED
:
	U N L I M I T E D
;

K_UNLISTEN
:
	U N L I S T E N
;

K_UNLOCK
:
	U N L O C K
;

K_UNPACKER
:
	U N P A C K E R
;

K_UNSEGMENTED
:
	U N S E G M E N T E D
;

K_UPDATE
:
	U P D A T E
;

K_USAGE
:
	U S A G E
;

K_USER
:
	U S E R
;

K_USING
:
	U S I N G
;

K_UUID
:
	U U I D
;

K_VACUUM
:
	V A C U U M
;

K_VALIDATE
:
	V A L I D A T E
;

K_VALIDATOR
:
	V A L I D A T O R
;

K_VALINDEX
:
	V A L I N D E X
;

K_VALUE
:
	V A L U E
;

K_VALUES
:
	V A L U E S
;

K_VARBINARY
:
	V A R B I N A R Y
;

K_VARCHAR
:
	V A R C H A R
;

K_VARCHAR2
:
	V A R C H A R '2'
;

K_VARYING
:
	V A R Y I N G
;

K_VERBOSE
:
	V E R B O S E
;

K_VERTICA
:
	V E R T I C A
;

K_VIEW
:
	V I E W
;

K_VOLATILE
:
	V O L A T I L E
;

K_WAIT
:
	W A I T
;

K_WEBHDFS_ADDRESS
:
	W E B H D F S UNDERSCORE A D D R E S S
;

K_WEBSERVICE_HOSTNAME
:
	W E B S E R V I C E UNDERSCORE H O S T N A M E
;

K_WEBSERVICE_PORT
:
	W E B S E R V I C E UNDERSCORE P O R T
;

K_WHEN
:
	W H E N
;

K_WHERE
:
	W H E R E
;

K_WINDOW
:
	W I N D O W
;

K_WITH
:
	W I T H
;

K_WITHIN
:
	W I T H I N
;

K_WITHOUT
:
	W I T H O U T
;

K_WORK
:
	W O R K
;

K_WRITE
:
	W R I T E
;

K_YEAR
:
	Y E A R
;

K_ZONE
:
	Z O N E
;

// aggregate functions 

K_APPROXIMATE_COUNT_DISTINCT: A P P R O X I M A T E  UNDERSCORE C O U N T  UNDERSCORE D I S T I N C T ;
K_APPROXIMATE_COUNT_DISTINCT_SYNOPSIS: A P P R O X I M A T E  UNDERSCORE C O U N T  UNDERSCORE D I S T I N C T  UNDERSCORE S Y N O P S I S ;
K_APPROXIMATE_COUNT_DISTINCT_OF_SYNOPSIS: A P P R O X I M A T E  UNDERSCORE C O U N T  UNDERSCORE D I S T I N C T  UNDERSCORE O F  UNDERSCORE S Y N O P S I S ;
K_APPROXIMATE_MEDIAN: A P P R O X I M A T E  UNDERSCORE M E D I A N ;
K_APPROXIMATE_PERCENTILE: A P P R O X I M A T E  UNDERSCORE P E R C E N T I L E ;
K_AVG: A V G ;
K_BIT_AND: B I T  UNDERSCORE A N D ;
K_BIT_OR: B I T  UNDERSCORE O R ;
K_BIT_XOR: B I T  UNDERSCORE X O R ;
K_BOOL_AND: B O O L  UNDERSCORE A N D ;
K_BOOL_OR: B O O L  UNDERSCORE O R ;
K_BOOL_XOR: B O O L  UNDERSCORE X O R ;
K_CORR: C O R R ;
K_COUNT: C O U N T ;
K_COVAR_POP: C O V A R  UNDERSCORE P O P ;
K_COVAR_SAMP: C O V A R  UNDERSCORE S A M P ;
K_GROUP_ID: G R O U P  UNDERSCORE I D ;
K_GROUPING_ID: G R O U P I N G  UNDERSCORE I D ;
K_LISTAGG: L I S T A G G ;
K_MAX: M A X ;
K_MIN: M I N ;
K_REGR_AVGX: R E G R  UNDERSCORE A V G X ;
K_REGR_AVGY: R E G R  UNDERSCORE A V G Y ;
K_REGR_COUNT: R E G R  UNDERSCORE C O U N T ;
K_REGR_INTERCEPT: R E G R  UNDERSCORE I N T E R C E P T ;
K_REGR_R2: R E G R  UNDERSCORE R '2';
K_REGR_SLOPE: R E G R  UNDERSCORE S L O P E ;
K_REGR_SXX: R E G R  UNDERSCORE S X X ;
K_REGR_SXY: R E G R  UNDERSCORE S X Y ;
K_REGR_SYY: R E G R  UNDERSCORE S Y Y ;
K_STDDEV: S T D D E V ;
K_STDDEV_POP: S T D D E V  UNDERSCORE P O P ;
K_STDDEV_SAMP: S T D D E V  UNDERSCORE S A M P ;
K_SUM: S U M ;
K_SUM_FLOAT: S U M  UNDERSCORE F L O A T ;
K_VAR_POP: V A R  UNDERSCORE P O P ;
K_VAR_SAMP: V A R  UNDERSCORE S A M P ;
K_VARIANCE: V A R I A N C E ;

// additional

K_ESCAPE_STRING_WARNING
:
	E S C A P E UNDERSCORE S T R I N G UNDERSCORE W A R N I N G
;

K_STANDARD_CONFORMING_STRINGS
:
	S T A N D A R D UNDERSCORE C O N F O R M I N G UNDERSCORE S T R I N G S
;

K_AUTOCOMMIT
:
	A U T O C O M M I T
;

K_LOCALE
:
	L O C A L E
;

K_MULTIPLEACTIVERESULTSETS
:
	M U L T I P L E A C T I V E R E S U L T S E T S
;

K_RESOURCE_POOL
:
	R E S O U R C E UNDERSCORE P O O L
;

K_INTERVALSTYLE
:
	I N T E R V A L S T Y L E
;

K_PLAIN
:
	P L A I N
;

K_UNITS
:
	U N I T S
;
K_DATESTYLE:

D A T E S T Y L E;
K_ISO:
I S O;
K_MDY:
M D Y;
K_POSTGRES:
P O S T G R E S
;
K_SQL:
S Q L;
K_GERMAN:
G E R M A N;
K_DMY :
D M Y;
K_TLSMODE:
T L S M O D E;
 K_PREFER: P R E F E R;
K_INT8:
I N T '8'
;
K_FLOAT8:
F L O A T '8'
;
K_GEOMETRY:
G E O M E T R Y;

K_GEOGRAPHY:
G E O G R A P H Y;
K_DATE:
D A T E;
// symbols

COMMA
:
	','
;

COLON
:
	':'
;

COLON_COLON
:
	'::'
;

DOLLAR
:
	'$'
;

DOLLAR_DOLLAR
:
	'$$'
;

STAR
:
	'*'
;

OPEN_PAREN
:
	'('
;

CLOSE_PAREN
:
	')'
;

OPEN_BRACKET
:
	'['
;

CLOSE_BRACKET
:
	']'
;

DOT
:
	'.'
;

SEMI
:
	';'
;

UNDERSCORE
:
	'_'
;
// operator tokens

AMP
:
	'&'
;

AMP_AMP
:
	'&&'
;

AMP_LT
:
	'&<'
;

AT_AT
:
	'@@'
;

AT_GT
:
	'@>'
;

AT_SIGN
:
	'@'
;

BANG
:
	'!'
;

BANG_BANG
:
	'!!'
;

BANG_EQUAL
:
	'!='
;

CARET
:
	'^'
;

EQUAL
:
	'='
;

EQUAL_GT
:
	'=>'
;
EQUAL2:
'<=>'
;
GT
:
	'>'
;

GTE
:
	'>='
;

GT_GT
:
	'>>'
;

HASH
:
	'#'
;

HASH_EQ
:
	'#='
;

HASH_GT
:
	'#>'
;

HASH_GT_GT
:
	'#>>'
;

HASH_HASH
:
	'##'
;

HYPHEN_GT
:
	'->'
;

HYPHEN_GT_GT
:
	'->>'
;

HYPHEN_PIPE_HYPHEN
:
	'-|-'
;

LT
:
	'<'
;

LTE
:
	'<='
;

LT_AT
:
	'<@'
;

LT_CARET
:
	'<^'
;

LT_GT
:
	'<>'
;

LT_HYPHEN_GT
:
	'<->'
;

LT_LT
:
	'<<'
;

LT_LT_EQ
:
	'<<='
;

LT_QMARK_GT
:
	'<?>'
;

MINUS
:
	'-'
;

PERCENT
:
	'%'
;

PIPE
:
	'|'
;

PIPE_PIPE
:
	'||'
;

PIPE_PIPE_SLASH
:
	'||/'
;

PIPE_SLASH
:
	'|/'
;

PLUS
:
	'+'
;

QMARK
:
	'?'
;

QMARK_AMP
:
	'?&'
;

QMARK_HASH
:
	'?#'
;

QMARK_HYPHEN
:
	'?-'
;

QMARK_PIPE
:
	'?|'
;

SLASH
:
	'/'
;

TIL
:
	'~'
;

TIL_EQ
:
	'~='
;

TIL_GTE_TIL
:
	'~>=~'
;

TIL_GT_TIL
:
	'~>~'
;

TIL_LTE_TIL
:
	'~<=~'
;

TIL_LT_TIL
:
	'~<~'
;

TIL_STAR
:
	'~*'
;

TIL_TIL
:
	'~~'
;

//other

IPV4_ADDR
:
	[']? IPV4_OCTECT DOT IPV4_OCTECT DOT IPV4_OCTECT DOT IPV4_OCTECT [']?
;

IPV6_ADDR
:
	[']? IPV6_OCTECT [:] IPV6_OCTECT [:] IPV6_OCTECT [:] IPV6_OCTECT [:]
	IPV6_OCTECT [:] IPV6_OCTECT [:] IPV6_OCTECT [:] IPV6_OCTECT [']?
;

// types

SPACE
:
	[ \t\r\n]+ -> skip
;

// comments

COMMENT
:
	'/*'
	(
		~'+'
	)
	(
		COMMENT
		| .
	)*? '*/' -> channel ( HIDDEN )
;

LINE_COMMENT_LITERAL
:
	'--' ~[\r\n]* -> channel ( HIDDEN )
;

// Identifiers

DOUBLE_QUOTE_ID
:
	'"' ~'"'+ '"'
;

SINGLE_QUOTE
:
	'\''
;

SQUARE_BRACKET_ID
:
	'[' ~']'+ ']'
;
OPEN_HINT:'/*+';
CLOSE_HINT:'*/';

K_ALLNODES: A L L N O D E S; 
K_DISTRIB: D I S T R I B;
K_EARLY_MATERIALIZATION : E A R L Y UNDERSCORE M A T E R I A L I Z A T I O N ;
K_ENABLE_WITH_CLAUSE_MATERIALIZATION: E N A B L E UNDERSCORE W I T H UNDERSCORE C L A U S E UNDERSCORE M A T E R I A L I Z A T I O N;
K_GBYTYPE: G B Y T Y P E;
K_IGNORECONST: I G N O R E C O N S T;
K_JTYPE: J T Y P E;
K_PROJS: P R O J S;
K_SKIP_PROJS: S K I P UNDERSCORE P R O J S;
K_SYN_JOIN: S Y N UNDERSCORE J O I N;
K_SYNTACTIC_JOIN: S Y N T A C T I C UNDERSCORE J O I N;
K_UTYPE: U T Y P E;
K_VERBATIM: V E R B A T I M;
K_PIPE: P I P E;
K_HASH:  H A S H;
LOCAL_ID
:
	'@'
	(
		[A-Z_$@#0-9]
		| FullWidthLetter
	)+
;

DECIMAL
:
	DEC_DIGIT+
;

WORD
:
	(
		[A-Za-z_#$@0-9]
		| FullWidthLetter
	)+
;

QUOTED_URL
:
	'\''
	(
		[A-Z] [A-Z]+ [:]
	) '//'
	(
		(
			[A-Z]+ [.]
			| [A-Z]+
		)
		| IPV4_ADDR
	) [:] DECIMAL '\''
;

QUOTED_HOST_AND_PORT
:
	'\''
	(
		(
			[A-Z]+ [.]
			| [A-Z]+
		)
		| IPV4_ADDR
	)
	(
		[:] DECIMAL
	) '\''
;

STRING
:
	'\''
	(
		~'\''
		| '\'\''
	)* '\''
;

BINARY
:
	'0' 'X' HEX_DIGIT*
;

FLOAT
:
	DEC_DOT_DEC
;

REAL
:
	(
		DECIMAL
		| DEC_DOT_DEC
	)
	(
		'E' [+-]? DEC_DIGIT+
	)
;
//WORD    : (.)+?;

fragment
LETTER
:
	[A-Z_]
;

fragment
IPV6_OCTECT
:
	HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
;

IPV4_OCTECT
:
	[0-9]? [0-9]? [0-9]
;

fragment
DEC_DOT_DEC
:
	(
		DEC_DIGIT+ '.' DEC_DIGIT+
		| DEC_DIGIT+ '.'
		| '.' DEC_DIGIT+
	)
;

fragment
HEX_DIGIT
:
	[0-9A-Fa-f]
;

fragment
DEC_DIGIT
:
	[0-9]
;

// Fragments

fragment
A
:
	(
		'A'
		| 'a'
	)
;

fragment
B
:
	(
		'B'
		| 'b'
	)
;

fragment
C
:
	(
		'C'
		| 'c'
	)
;

fragment
D
:
	(
		'D'
		| 'd'
	)
;

fragment
E
:
	(
		'E'
		| 'e'
	)
;

fragment
F
:
	(
		'F'
		| 'f'
	)
;

fragment
G
:
	(
		'G'
		| 'g'
	)
;

fragment
H
:
	(
		'H'
		| 'h'
	)
;

fragment
I
:
	(
		'I'
		| 'i'
	)
;

fragment
J
:
	(
		'J'
		| 'j'
	)
;

fragment
K
:
	(
		'K'
		| 'k'
	)
;

fragment
L
:
	(
		'L'
		| 'l'
	)
;

fragment
M
:
	(
		'M'
		| 'm'
	)
;

fragment
N
:
	(
		'N'
		| 'n'
	)
;

fragment
O
:
	(
		'O'
		| 'o'
	)
;

fragment
P
:
	(
		'P'
		| 'p'
	)
;

fragment
Q
:
	(
		'Q'
		| 'q'
	)
;

fragment
R
:
	(
		'R'
		| 'r'
	)
;

fragment
S
:
	(
		'S'
		| 's'
	)
;

fragment
T
:
	(
		'T'
		| 't'
	)
;

fragment
U
:
	(
		'U'
		| 'u'
	)
;

fragment
V
:
	(
		'V'
		| 'v'
	)
;

fragment
W
:
	(
		'W'
		| 'w'
	)
;

fragment
X
:
	(
		'X'
		| 'x'
	)
;

fragment
Y
:
	(
		'Y'
		| 'y'
	)
;

fragment
Z
:
	(
		'Z'
		| 'z'
	)
;

fragment
FullWidthLetter
:
	'\u00c0' .. '\u00d6'
	| '\u00d8' .. '\u00f6'
	| '\u00f8' .. '\u00ff'
	| '\u0100' .. '\u1fff'
	| '\u2c00' .. '\u2fff'
	| '\u3040' .. '\u318f'
	| '\u3300' .. '\u337f'
	| '\u3400' .. '\u3fff'
	| '\u4e00' .. '\u9fff'
	| '\ua000' .. '\ud7ff'
	| '\uf900' .. '\ufaff'
	| '\uff00' .. '\ufff0'
	// | '\u10000'..'\u1F9FF'  //not support four bytes chars
	// | '\u20000'..'\u2FA1F'

;