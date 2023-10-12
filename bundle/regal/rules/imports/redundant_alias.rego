# METADATA
# description: Redundant alias
package regal.rules.imports["redundant-alias"]

import future.keywords.contains
import future.keywords.if
import future.keywords.in

import data.regal.ast
import data.regal.result

report contains violation if {
	some imported in input.imports

	ast.last(imported.path.value).value == imported.alias

	violation := result.fail(rego.metadata.chain(), result.location(imported.path.value[0]))
}
