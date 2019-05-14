parser grammar VSqlParser;

@header {
  package org.antlr4.vsql;
}

options {
	tokenVocab = VSqlLexer;
}

root
:
	(
		statement
	)* EOF?
;

statement
:
	(
		alter_access_policy_statement
		| alter_authentication_statement
		| alter_database_drop_statement
		| alter_fault_group_statement
		| alter_function_statement
		| alter_hcatalog_schema_statement
		| alter_library_statement
		| alter_model_statement
		| alter_network_interface_statement
		| alter_node_statement
		| alter_notfifier_statement
		| alter_projection_statement
		| alter_profile_statement
		| alter_profile_rename_statement
		| alter_resource_pool_statement // to do update params

		| alter_role_rename_statement
		| alter_schema_statement
		| alter_sequence_statement
		| alter_session_statement
		| alter_subnet_statement
		| alter_table_rename_statement
		| alter_table_general_statment //todo

		| alter_user_statement //todo

		| alter_view_statement //todo

		| begin_transaction_statement
		| comment_on_statement
		| commit_statement
		| connect_statement
		| copy_statement
		| copy_local_statement
		| copy_from_vertica_statement
		| create_access_policy_statement
		| create_authentication_statement
		| create_branch_statement
		| create_external_table_as_copy_statement
		| create_fault_group_statement
		| create_flex_table_statement
		| create_flex_external_table_as_copy_statement
		| create_function_statements_statement
		| create_hcatalog_schema_statement
		| create_library_statement
		| create_load_balance_group_statement
		| create_local_temporary_view_statement
		| create_location_statement
		| create_network_address_statement
		| create_network_interface_statement
		| create_notifier_statement
		| create_procedure_statement
		| create_profile_statement
		| create_projection_statement
		| create_projection_live_aggregate_projections_statement
		| create_projection_udtfs_statement
		| create_resource_pool_statement
		| create_role_statement
		| create_routing_rule_statement
		| create_schema_statement
		| create_sequence_statement
		| create_subnet_statement
		| create_table_statement
		| create_temporary_table_statement
		| create_text_index_statement
		| create_user_statement
		| create_view_statement
		| delete_statement
		| directed_query_statements_statement
		| disconnect_statement
		| drop_access_policy_statement
		| drop_aggregate_function_statement
		| drop_authentication_statement
		| drop_branch_statement
		| drop_fault_group_statement
		| drop_function_statement
		| drop_model_statement
		| drop_library_statement
		| drop_load_balance_group_statement
		| drop_network_address_statement
		| drop_network_interface_statement
		| drop_notifier_statement
		| drop_procedure_statement
		| drop_profile_statement
		| drop_projection_statement
		| drop_resource_pool_statement
		| drop_role_statement
		| drop_routing_rule_statement
		| drop_schema_statement
		| drop_sequence_statement
		| drop_subnet_statement
		| drop_table_statement
		| drop_text_index_statement
		| drop_transform_function_statement
		| drop_user_statement
		| drop_view_statement
		| end_statement
		| explain_statement
		| export_to_parquet_statement
		| export_to_vertica_statement
		| grant_statements_statement
		| insert_statement
		| merge_statement
		| profile_statement
		| release_savepoint_statement
		| revoke_statements_statement
		| rollback_statement
		| rollback_to_savepoint_statement
		| savepoint_statement
		| select_statement
		| set_datestyle_statement
		| set_escape_string_warning_statement
		| set_intervalstyle_statement
		| set_locale_statement
		| set_role_statement
		| set_search_path_statement
		| set_session_autocommit_statement
		| set_session_characteristics_as_transaction_statement
		| set_session_graceperiod_statement
		| set_session_idlesessiontimeout_statement
		| set_session_memorycap_statement
		| set_session_multipleactiveresultsets_statement
		| set_session_resource_pool_statement
		| set_session_runtimecap_statement
		| set_session_tempspacecap_statement
		| set_standard_conforming_strings_statement
		| set_time_zone_statement
		| show_statement
		| show_current_statement
		| show_database_statement
		| show_node_statement
		| show_session_statement
		| start_transaction_statement
		| truncate_table_statement
		| update_statement
	) SEMI?
;

dml_statement
:
	select_statement
	| insert_statement
	| update_statement
;

ddl_statement
:
;

dcl_statement
:
;

tcl_statement
:
;

other_statement
:
;

alter_access_policy_statement
:
	K_ALTER K_ACCESS K_POLICY K_ON
	(
		schema DOT
	)? tablename
	(
		K_FOR K_COLUMN
		(
			columnname w_expressions?
		)
		| K_FOR K_ROWS K_WHERE w_expressions
	)
	(
		K_ENABLE
		| K_DISABLE
		|
		(
			K_COPY K_TO K_TABLE tablename
		)
	)
;

alter_authentication_statement
:
	K_ALTER K_AUTHENTICATION auth_method_name //var char

	(
		(
			K_ENABLE
			| K_DISABLE
		)
		|
		(
			K_LOCAL
			|
			(
				K_HOST
				(
					K_TLS
					| K_NO K_TLS
				) host_ip_address
			)
		)
		|
		(
			K_RENAME K_TO newName
		)
		|
		(
			K_METHOD value
		)
		|
		(
			K_SET keyValuePairs
		)
		|
		(
			K_PRIORITY value //int

		)
	)
;

alter_database_drop_statement
:
	K_ALTER K_DATABASE name
	(
		(
			K_DROP K_ALL K_FAULT K_GROUP
		)
		|
		(
			K_EXPORT K_ON
			(
				name
				| K_DEFAULT
			)
		)
		|
		(
			K_RESET K_STANDBY
		)
		|
		(
			K_SET
			(
				K_PARAMETER
			)? keyValuePairs
		)
		|
		(
			K_CLEAR
			(
				K_PARAMETER
			)? names
		)
	)
;

alter_fault_group_statement
:
	K_ALTER K_FAULT K_GROUP name
	(
		(
			K_ADD K_NODE name
		)
		|
		(
			K_DROP K_NODE name
		)
		|
		(
			K_ADD K_FAULT K_GROUP name
		)
		|
		(
			K_DROP K_FAULT K_GROUP name
		)
		|
		(
			K_RENAME K_TO newName
		)
	)
;

alter_function_statement
:
	K_ALTER K_FUNCTION
	(
		dbname DOT
	)?
	(
		schema DOT
	)? function OPEN_PAREN arg_list? CLOSE_PAREN
	(
		(
			K_OWNER K_TO owner
		)
		|
		(
			K_RENAME K_TO newName
		)
		|
		(
			K_SET K_SCHEMA schema
		)
		|
		(
			K_SET K_FENCED bool_expression
		)
	)
;

alter_hcatalog_schema_statement
:
	K_ALTER K_HCATALOG K_SCHEMA schema K_SET keyValuePairs
;

alter_library_statement
:
	K_ALTER K_LIBRARY
	(
		dbname DOT
	)?
	(
		schema DOT
	)? name
	(
		K_DEPENDS name
		(
			K_LANGUAGE name
		)?
	)? K_AS value
;

alter_model_statement
:
	K_ALTER K_MODEL
	(
		dbname DOT
	)?
	(
		schema DOT
	)? name
	(
		(
			K_OWNER K_TO owner
		)
		|
		(
			K_RENAME K_TO newName
		)
		|
		(
			K_SET K_SCHEMA schema
		)
	)
;

alter_network_interface_statement
:
	K_ALTER K_NETWORK K_INTERFACE name K_RENAME K_TO newName
;

alter_node_statement
:
	K_ALTER K_NODE name
	(
		(
			K_EXPORT K_ON
			(
				name
				| K_DEFAULT
			)
		)
		|
		(
			K_IS
		) name
		| K_REPLACE
		(
			K_WITH name
		)
		| K_RESET
		| K_SET
		(
			K_PARAMETER
		)? keyValuePairs
		| K_CLEAR
		(
			K_PARAMETER
		)? names
	)
;

alter_notfifier_statement
:
	K_ALTER K_NOTIFIER name notifierParams
;

alter_projection_statement
:
	K_ALTER K_PROJECTION
	(
		dbname DOT
	)?
	(
		schema DOT
	)? name K_RENAME K_TO newName
;

alter_profile_statement
:
	K_ALTER K_PROFILE
	(
		name
		| K_DEFAULT
	) K_LIMIT password_parameter value
;

alter_profile_rename_statement
:
	K_ALTER K_PROFILE name K_RENAME K_TO newName
;

alter_resource_pool_statement
:
	K_ALTER K_RESOURCE K_POOL name value
;

alter_role_rename_statement
:
	K_ALTER K_ROLE name K_RENAME K_TO newName
;

alter_schema_statement
:
	K_ALTER K_SCHEMA
	(
		(
			(
				dbname DOT
			)?
			(
				schema
			)
			(
				(
					K_DEFAULT
					(
						K_INCLUDE
						| K_EXCLUDE
					) K_SCHEMA K_PRIVILEGES
				)
				|
				(
					K_OWNER K_TO owner
					(
						K_CASCADE
					)?
				)
			)
		)
		|
		(
			(
				dbname DOT
			)? schemas
			(
				K_RENAME K_TO schemas
			)
		)
	)
;

alter_sequence_statement
:
	K_ALTER K_SEQUENCE
	(
		(
			(
				dbname DOT
			)?
			(
				schema DOT
			)? sequence
			(
				K_INCREMENT K_BY DECIMAL
			)?
			(
				(
					K_MINVALUE DECIMAL
				)
				|
				(
					K_NO K_MINVALUE
				)
			)?
			(
				(
					K_MAXVALUE DECIMAL
				)
				|
				(
					K_NO K_MAXVALUE
				)
			)?
			(
				K_RESTART K_WITH DECIMAL
			)?
			(
				(
					K_CACHE DECIMAL
				)
				|
				(
					K_NO K_CACHE
				)
				(
					K_CYCLE
					| K_NO K_CYCLE
				)
			)?
		)
		|
		(
			(
				schema DOT
			)? sequence
			(
				(
					K_RENAME K_TO newName
				)
				|
				(
					K_SET K_SCHEMA schema
				)
				|
				(
					K_OWNER K_TO owner
				)
			)
		)
	)
;

alter_session_statement
:
	K_ALTER K_SESSION
	(
		(
			K_SET K_PARAMETER? keyValuePairs
		)
		|
		(
			K_CLEAR K_PARAMETER? names?
		)
		|
		(
			K_SET K_UDPARAMETER
			(
				K_FOR libName
			)? keyValuePairs
		)
		|
		(
			K_CLEAR K_UDPARAMETER
			(
				K_FOR libName
			)? names?
		)
	)
;

alter_subnet_statement
:
	K_ALTER K_SUBNET name K_RENAME K_TO newName
;

alter_table_rename_statement
:
	K_ALTER K_TABLE
	(
		dbname DOT
	)?
	(
		schema DOT
	)? tables K_RENAME K_TO newNames
;

alter_table_general_statment
:
	todo_statement
;

alter_user_statement
:
	todo_statement
;

alter_view_statement
:
	todo_statement
;

todo_statement
:
	WORD
;

begin_transaction_statement
:
	K_BEGIN
	(
		K_WORK
		| K_TRANSACTION
	) K_ISOLATION K_LEVEL isolationLevel transactionMode
;

comment_on_statement
:
	comment_on_column_statement
;

comment_on_column_statement
:
	K_COMMENT K_ON K_COLUMN
	(
		dbname DOT
	)?
	(
		schema DOT
	)? projection DOT columnname K_IS
	(
		value
		| K_NULL
	)
;

commit_statement
:
	K_COMMIT
	(
		K_WORK
		| K_TRANSACTION
	)?
;

connect_statement
:
	todo_statement
;

copy_statement
:
	todo_statement
;

copy_local_statement
:
	todo_statement
;

copy_from_vertica_statement
:
	todo_statement
;

create_access_policy_statement
:
	todo_statement
;

create_authentication_statement
:
	todo_statement
;

create_branch_statement
:
	todo_statement
;

create_external_table_as_copy_statement
:
	todo_statement
;

create_fault_group_statement
:
	todo_statement
;

create_flex_table_statement
:
	todo_statement
;

create_flex_external_table_as_copy_statement
:
	todo_statement
;

create_function_statements_statement
:
	todo_statement
;

create_hcatalog_schema_statement
:
	todo_statement
;

create_library_statement
:
	todo_statement
;

create_load_balance_group_statement
:
	todo_statement
;

create_local_temporary_view_statement
:
	todo_statement
;

create_location_statement
:
	todo_statement
;

create_network_address_statement
:
	todo_statement
;

create_network_interface_statement
:
	todo_statement
;

create_notifier_statement
:
	todo_statement
;

create_procedure_statement
:
	todo_statement
;

create_profile_statement
:
	todo_statement
;

create_projection_statement
:
	todo_statement
;

create_projection_live_aggregate_projections_statement
:
	todo_statement
;

create_projection_udtfs_statement
:
	todo_statement
;

create_resource_pool_statement
:
	todo_statement
;

create_role_statement
:
	todo_statement
;

create_routing_rule_statement
:
	todo_statement
;

create_schema_statement
:
	todo_statement
;

create_sequence_statement
:
	todo_statement
;

create_subnet_statement
:
	todo_statement
;

create_table_statement
:
	todo_statement
;

create_temporary_table_statement
:
	todo_statement
;

create_text_index_statement
:
	todo_statement
;

create_user_statement
:
	todo_statement
;

create_view_statement
:
	todo_statement
;

delete_statement
:
	todo_statement
;

directed_query_statements_statement
:
	todo_statement
;

disconnect_statement
:
	K_DISCONNECT dbname
;

drop_access_policy_statement
:
	todo_statement
;

drop_aggregate_function_statement
:
	todo_statement
;

drop_authentication_statement
:
	todo_statement
;

drop_branch_statement
:
	todo_statement
;

drop_fault_group_statement
:
	todo_statement
;

drop_function_statement
:
	todo_statement
;

drop_model_statement
:
	todo_statement
;

drop_library_statement
:
	todo_statement
;

drop_load_balance_group_statement
:
	todo_statement
;

drop_network_address_statement
:
	todo_statement
;

drop_network_interface_statement
:
	todo_statement
;

drop_notifier_statement
:
	todo_statement
;

drop_procedure_statement
:
	todo_statement
;

drop_profile_statement
:
	K_DROP K_PROFILE
	(
		K_IF K_EXISTS
	)? names
	(
		K_CASCADE
	)?
;

drop_projection_statement
:
	K_DROP K_PROJECTION
	(
		K_IF K_EXISTS
	)?
	(
		dbname DOT
	)?
	(
		schema DOT
	)? names
	(
		K_CASCADE
		| K_RESTRICT
	)?
;

drop_resource_pool_statement
:
	K_DROP K_RESOURCE K_POOL name
;

drop_role_statement
:
	K_DROP K_ROLE
	(
		K_IF K_EXISTS
	)? names K_CASCADE?
;

drop_routing_rule_statement
:
	todo_statement
;

drop_schema_statement
:
	K_DROP K_SCHEMA
	(
		K_IF K_EXISTS
	)?
	(
		dbname DOT
	)? names K_CASCADE?
;

drop_sequence_statement
:
	K_DROP K_SEQUENCE
	(
		K_IF K_EXISTS
	)?
	(
		dbname DOT
	)?
	(
		schema DOT
	)? names
	(
		K_CASCADE
		| K_RESTRICT
	)?
;

drop_subnet_statement
:
	K_DROP K_SUBNET
	(
		K_IF K_EXISTS
	)?
	(
		dbname DOT
	)?
	(
		schema DOT
	)? names K_CASCADE?
;

drop_table_statement
:
	K_DROP K_TABLE
	(
		K_IF K_EXISTS
	)?
	(
		dbname DOT
	)?
	(
		schema DOT
	)? tables K_CASCADE?
;

drop_text_index_statement
:
	todo_statement
;

drop_transform_function_statement
:
	todo_statement
;

drop_user_statement
:
	todo_statement
;

drop_view_statement
:
	todo_statement
;

end_statement
:
	todo_statement
;

explain_statement
:
	todo_statement
;

export_to_parquet_statement
:
	todo_statement
;

export_to_vertica_statement
:
	todo_statement
;

grant_statements_statement
:
	todo_statement
;

insert_statement
:
	todo_statement
;

merge_statement
:
	todo_statement
;

profile_statement
:
	todo_statement
;

release_savepoint_statement
:
	todo_statement
;

revoke_statements_statement
:
	todo_statement
;

rollback_statement
:
	todo_statement
;

rollback_to_savepoint_statement
:
	todo_statement
;

savepoint_statement
:
	todo_statement
;

select_clause
:
	K_SELECT hints?
	(
		K_ALL
		| K_DISTINCT
	)? elements
;

select_query
:
	select_clause into_clause? from_clause? where_clause? timeseries_clause?
	groupBy_clause? having_clause? match_clause?
	(
		K_UNION
		(
			K_ALL
			| K_DISTINCT
		)?
	)? except_clause? intersect_clause? orderby_clause?
	(
		K_LIMIT
		(
			DECIMAL
			| K_ALL
		)
	)?
	(
		K_OFFSET DECIMAL
	)
	(
		K_FOR K_UPDATE
		(
			K_OF tableReference
			(
				COMMA tableReference
			)*
		)?
	)?
;

intersect_clause
:
	K_INTERSECT select_query
;

except_clause
:
	K_EXCEPT select_query
;

elements
:
	element
	(
		COMMA element
	)*
;

element
:
	(
		exp
		| OPEN_PAREN select_query CLOSE_PAREN
	) alias?
;

hints
:
	OPEN_HINT hint
	(
		COMMA hint
	)* CLOSE_HINT
;

hint
:
	gbHint
;

gbHint
:
	K_GBYTYPE
	(
		K_HASH
		| K_PIPE
	)
;

expressions
:
	exp
	(
		COMMA exp
	)*
;

exp
:
	OPEN_PAREN?
	(
		columnReference
		| func_call
		| caseExp
	) CLOSE_PAREN?
;

predicates
:
	betweenPredicate
	| booleanPredicate
	| columnValuePredicate
	| inPredicate
	| interpolatePredicate
	| likePredicate
	| nullPredicate
;

nullPredicate
:
	(
		columnReference
		| func_call
	) K_IS
	(
		K_NOT
	)? K_NULL
;

likePredicate
:
	columnReference K_NOT?
	(
		K_LIKE
		| K_ILIKE
		| K_LIKEB
		| K_ILIKEB
	) STRING
	(
		K_ESCAPE SINGLE_QUOTE
	)
;

joinPredicate
:
	K_ON columnReference comparisonOperator columnReference
	(
		(
			K_AND
			| K_OR
			| K_NOT
		) columnReference comparisonOperator columnReference
	)*
;

interpolatePredicate
:
	columnReference K_PREVIOUS K_VALUE columnReference
;

columnValuePredicate
:
	columnReference comparisonOperator
	(
		columnReference
		| constantExp
	)
;

inPredicate
:
	columnReference
	(
		COMMA columnReference
	)* K_IN K_NOT? inPredicateValues
	(
		COMMA inPredicateValues
	)*
;

inPredicateValues
:
	OPEN_PAREN
	(
		constantExp
		| inPredicateValues
	) CLOSE_PAREN
;

constantExp
:
	DECIMAL
	| STRING
	|
	(
		K_IS K_NOT? K_NULL
	)
;

betweenPredicate
:
	exp K_BETWEEN? exp K_AND exp
;

booleanPredicate
:
	exp K_IS K_NOT?
	(
		bool_expression
		| K_UNKNOWN
	)
;

caseExp
:
	K_CASE K_WHEN exp K_THEN result
	(
		K_WHEN exp K_THEN result
	)*
	(
		K_ELSE result
	)? K_END
;

result
:
	any
;

condition
:
	exp
	| predicates
;

columnReference
:
	(
		(
			(
				(
					dbname DOT
				)?
				(
					schema DOT
				)
			)?
			(
				tablename DOT
			)
		)
	)? columnname
;

alias
:
	(
		K_AS? any
	)
;

func_call
:
	funcName OPEN_PAREN
	(
		STAR
		|
		(
			(
				K_ALL
				| K_DISTINCT
			)? exp_args
		)
	)? CLOSE_PAREN
;

exp_args
:
	(
		(
			OPEN_PAREN exp_args CLOSE_PAREN
		)
		| any
	)
	(
		COMMA
		(
			(
				OPEN_PAREN exp_args CLOSE_PAREN
			)
			| any
		)
	)*
;

funcName
:
	aggregateFunction
	| WORD
;

aggregateFunction
:
	K_ROLLUP
	|
	(
		K_GROUPING K_SETS?
	)
	| K_APPROXIMATE_COUNT_DISTINCT
	| K_APPROXIMATE_COUNT_DISTINCT_SYNOPSIS
	| K_APPROXIMATE_COUNT_DISTINCT_OF_SYNOPSIS
	| K_APPROXIMATE_MEDIAN
	| K_APPROXIMATE_PERCENTILE
	| K_AVG
	| K_BIT_AND
	| K_BIT_OR
	| K_BIT_XOR
	| K_BOOL_AND
	| K_BOOL_OR
	| K_BOOL_XOR
	| K_CORR
	| K_COUNT
	| K_COVAR_POP
	| K_COVAR_SAMP
	| K_GROUP_ID
	| K_GROUPING
	| K_GROUPING_ID
	| K_LISTAGG
	| K_MAX
	| K_MIN
	| K_REGR_AVGX
	| K_REGR_AVGY
	| K_REGR_COUNT
	| K_REGR_INTERCEPT
	| K_REGR_R2
	| K_REGR_SLOPE
	| K_REGR_SXX
	| K_REGR_SXY
	| K_REGR_SYY
	| K_STDDEV
	| K_STDDEV_POP
	| K_STDDEV_SAMP
	| K_SUM
	| K_SUM_FLOAT
	| K_VAR_POP
	| K_VAR_SAMP
	| K_VARIANCE
;

any
:
	K_INT
	| WORD
	| STRING
	| SINGLE_QUOTE
	| STAR
	| DECIMAL
;

from_clause
:
	K_FROM
	(
		dataset
		(
			COMMA? dataset
		)*
	) tableSample?
;

tableSample
:
	K_TABLESAMPLE OPEN_PAREN FLOAT CLOSE_PAREN
;

dataset
:
	(
		tableReference
		| select_clause
		| joinedTable
	) alias?
;

tableReference
:
	(
		(
			dbname DOT
		)?
		(
			schema DOT
		)
	)? tablename
;

joinedTable
:
	tableReference
	(
		K_INNER
		|
		(
			K_LEFT K_OUTER?
		)
		|
		(
			K_RIGHT K_OUTER?
		)
		|
		(
			K_FULL K_OUTER?
		)
		| K_NATURAL
		| K_CROSS
	)? K_JOIN tableSample? joinPredicate?
;

into_clause
:
	(
		K_INTO K_TABLE?
		(
			(
				dbname DOT
			)?
			(
				schema DOT
			)
		)? tablename alias?
	)
	| K_INTO
	(
		K_GLOBAL
		| K_LOCAL
	)?
	(
		K_TEMP
		| K_TEMPORARY
	) K_TABLE?
	(
		(
			dbname DOT
		)?
		(
			schema DOT
		)
	)? tablename
	(
		K_ON K_COMMIT
		(
			K_PRESERVE
			| K_DELETE
		) K_ROWS
	)?
;

timeseries_clause
:
	K_TIMESERIES columnReference K_AS SINGLE_QUOTE over_clause K_ORDER K_BY
	columnReference
	(
		COMMA columnReference
	)*
;

over_clause
:
	K_OVER OPEN_PAREN
	(
		K_PARTITION K_BY columnReference
		(
			COMMA columnReference
		)*
	)? K_ORDER K_BY columnReference CLOSE_PAREN
;

groupBy_clause
:
	K_GROUP K_BY hints? expressions
;

having_clause
:
	K_HAVING condition
	(
		COMMA condition
	)*
;

match_clause
:
	K_MATCH OPEN_PAREN
	(
		K_PARTITION K_BY columnReference
		(
			COMMA columnReference
		)*
	)? K_ORDER K_BY columnReference
	(
		COMMA columnReference
	)* K_DEFINE
	(
		any K_AS
		(
			exp
			| w_expressions
		)
	)
	(
		COMMA
		(
			any K_AS
			(
				exp
				| w_expressions
			)
		)
	)* K_PATTERN any K_AS OPEN_PAREN regex CLOSE_PAREN
	(
		(
			K_ROWS K_MATCH
		)
		(
			(
				K_ALL K_EVENTS
			)
			|
			(
				K_FIRST K_EVENT
			)
		)
	)? CLOSE_PAREN
;

regex
:
	any
;

where_clause
:
	K_WHERE w_expressions
;

orderby_clause
:
	K_ORDER K_BY orderbyItems
;

orderbyItems
:
	orderbyItem
	(
		COMMA orderbyItem
	)*
;

orderbyItem
:
	exp
	(
		K_ASC
		| K_DESC
	)?
;

w_expressions
:
	predicates
	(
		(
			K_AND
			| K_OR
		) predicates
	)*
;

g_expressions
:
	WORD
	(
		COMMA WORD
	)*
;

select_statement
:
	(
		(
			K_AT K_EPOCH
			(
				K_LATEST
				| DECIMAL
			)
		)
		|
		(
			K_AT K_TIME STRING
		)
	)? select_query
;

set_datestyle_statement
:
	todo_statement
;

set_escape_string_warning_statement
:
	K_SET K_ESCAPE_STRING_WARNING K_TO
	(
		K_ON
		| K_OFF
	)
;

set_intervalstyle_statement
:
	K_SET K_INTERVALSTYLE K_TO
	(
		K_PLAIN
		| K_UNITS
	)
;

set_locale_statement
:
	K_SET K_LOCALE K_TO value
;

set_role_statement
:
	K_SET K_ROLE
	(
		names
		| K_NONE
		| K_ALL
		|
		(
			K_ALL K_EXCEPT names
		)
		| K_DEFAULT
	)
;

set_search_path_statement
:
	K_SET K_SEARCH_PATH
	(
		K_TO
		| EQUAL
	)
	(
		schemas
		| K_DEFAULT
	)
;

set_session_autocommit_statement
:
	K_SET K_SESSION K_AUTOCOMMIT K_TO
	(
		K_ON
		| K_OFF
	)
;

set_session_characteristics_as_transaction_statement
:
	K_SET K_SESSION K_CHARACTERISTICS K_AS K_TRANSACTION
	(
		COMMA? isolationLevel
		| COMMA? transactionMode
	)+
;

set_session_graceperiod_statement
:
	K_SET K_SESSION K_GRACEPERIOD
	(
		value
		| K_NONE
		|
		(
			EQUAL K_DEFAULT
		)
	)
;

set_session_idlesessiontimeout_statement
:
	K_SET K_SESSION K_IDLESESSIONTIMEOUT
	(
		value
		| K_NONE
		|
		(
			EQUAL K_DEFAULT
		)
	)
;

set_session_memorycap_statement
:
	K_SET K_SESSION K_MEMORYCAP
	(
		value
		| K_NONE
		|
		(
			EQUAL K_DEFAULT
		)
	)
;

set_session_multipleactiveresultsets_statement
:
	K_SET K_SESSION K_MULTIPLEACTIVERESULTSETS K_TO
	(
		K_ON
		| K_OFF
	)
;

set_session_resource_pool_statement
:
	K_SET K_SESSION K_RESOURCE_POOL EQUAL
	(
		value
		|
		(
			K_DEFAULT
		)
	)
;

set_session_runtimecap_statement
:
	K_SET K_SESSION K_RUNTIMECAP
	(
		value
		| K_NONE
		|
		(
			EQUAL K_DEFAULT
		)
	)
;

set_session_tempspacecap_statement
:
	K_SET K_SESSION K_TEMPSPACECAP
	(
		value
		| K_NONE
	)
;

set_standard_conforming_strings_statement
:
	K_SET K_STANDARD_CONFORMING_STRINGS K_TO
	(
		K_ON
		| K_OFF
	)
;

set_time_zone_statement
:
	K_SET
	(
		(
			K_TIME K_ZONE
		)
		| K_TIMEZONE
	) K_TO K_INTERVAL? value
;

//todo update parameters

show_statement
:
	K_SHOW
	(
		K_ALL
		| name
	)
;

show_current_statement
:
	K_SHOW K_CURRENT
	(
		K_ALL
		| name
	)
;

show_database_statement
:
	K_SHOW K_DATABASE dbname
	(
		K_ALL
		| names
	)
;

show_node_statement
:
	K_SHOW K_NODE name
	(
		K_ALL
		| names
	)
;

show_session_statement
:
	K_SHOW K_SESSION
	(
		K_ALL
		|
		(
			K_UDPARAMETERS K_ALL
		)
		| names
	)
;

start_transaction_statement
:
	K_START K_TRANSACTION K_ISOLATION K_LEVEL isolationLevel transactionMode
;

truncate_table_statement
:
	K_TRUNCATE K_TABLE
	(
		dbname DOT
	)?
	(
		schema DOT
	)? tablename
;

update_statement
:
	todo_statement
;

isolationLevel
:
	(
		K_READ K_COMMITTED
	)
	|
	(
		K_SERIALIZABLE
	)
	|
	(
		K_REPEATABLE K_READ
	)
	|
	(
		K_READ K_UNCOMMITTED
	)
;

transactionMode
:
	K_READ
	(
		K_ONLY
		| K_WRITE
	)?
;

libName
:
	name
;

password_parameter
:
	(
		K_PASSWORD_LIFE_TIME
		| K_PASSWORD_GRACE_TIME
		| K_FAILED_LOGIN_ATTEMPTS
		| K_PASSWORD_LOCK_TIME
		| K_PASSWORD_REUSE_MAX
		| K_PASSWORD_REUSE_TIME
		| K_PASSWORD_MAX_LENGTH
		| K_PASSWORD_MIN_LENGTH
		| K_PASSWORD_MIN_LETTERS
		| K_PASSWORD_MIN_UPPERCASE_LETTERS
		| K_PASSWORD_MIN_LOWERCASE_LETTERS
		| K_PASSWORD_MIN_DIGITS
		| K_PASSWORD_MIN_SYMBOLS
	)
;

notifierParams
:
	notifierParam
	(
		COMMA notifierParam
	)*
;

notifierParam
:
	K_NO K_CHECK K_COMMITTED
	(
		K_ENABLE
		| K_DISABLE
	) K_IDENTIFIED K_BY name K_MAXMEMORYSIZE value K_MAXPAYLOAD value
	K_PARAMETERS name
;

bool_expression
:
	K_TRUE
	| K_FALSE
;

arg_list
:
	arg
	(
		COMMA arg
	)*
;
// todo add other types

arg
:
	K_INT
	| WORD
	| STRING
	| SINGLE_QUOTE
	| STAR
	| DECIMAL
;

auth_method_name
:
	WORD
;

host_ip_address
:
	IPV4_ADDR
	| IPV6_ADDR
;

keyValuePairs
:
	keyValuePair
	(
		COMMA keyValuePair
	)*
;

keyValuePair
:
	name operator any
;

value
:
	WORD
	| STRING
	| DOUBLE_QUOTE_ID
	| DECIMAL
;

names
:
	name
	(
		COMMA name
	)*
;

name
:
	K_HOSTNAME
	| WORD
	| STRING
	| SINGLE_QUOTE
;

newNames
:
	newName
	(
		COMMA newName
	)*
;

newName
:
	K_HOSTNAME
	| WORD
;

operator
:
	comparisonOperator
;

comparisonOperator
:
	EQUAL
	| EQUAL_GT
	| GT
	| LT
	| LTE
	| GTE
	| LT_GT
	| BANG_EQUAL
	| EQUAL2
;

dbname
:
	WORD
	| K_DEFAULT
;

tables
:
	tablename
	(
		COMMA tablename
	)*
;

tablename
:
	WORD
	| STRING
;

schemas
:
	schema
	(
		COMMA schema
	)*
;

schema
:
	WORD
;

columnname
:
	WORD
	| STRING
	| DECIMAL
;

sequence
:
	WORD
;

owner
:
	WORD
;

function
:
	WORD
;

projection
:
	WORD
;
