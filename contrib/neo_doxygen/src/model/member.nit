# This file is part of NIT ( http://www.nitlanguage.org ).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Members.
module model::member

import graph
import type_entity

# A member or an inner class.
abstract class MemberOrInner
	super CodeBlock

	# The type of the introducer.
	type INTRODUCER_TYPE: MemberIntroducer

	# The node used to represent the `MProperty` node.
	#
	# Only defined if `self` is at the root of a reimplementation graph, and
	# only once `put_in_graph` is called.
	var introducer: nullable INTRODUCER_TYPE = null

	init do
		super
		self.labels.add("MPropDef")
	end

	# Does this member introduce the property?
	fun is_intro: Bool is abstract

	redef fun put_in_graph do
		super
		self["is_intro"] = is_intro
		if is_intro then
			var visibility = self["visibility"]
			var name = self["name"]

			introducer = create_introducer
			if name isa String then
				introducer.name = name
			end
			if visibility isa String then
				introducer.visibility = visibility
			end
			introducer.put_in_graph
		end
	end

	redef fun put_edges do
		super
		var intro = resolve_introducer

		assert intro != null
		graph.add_edge(self, "DEFINES", intro)
	end

	# Set the visibility.
	fun visibility=(visibility: String) do
		self["visibility"] = visibility
		if introducer != null then
			introducer.as(not null).visibility = visibility
		end
	end

	# Get the visibility.
	#
	# Return `""` by default.
	fun visibility: String do
		var visibility = self["visibility"]
		if visibility isa String then return visibility
		return ""
	end

	redef fun name=(name: String) do
		super
		if introducer != null then
			introducer.as(not null).name = name
		end
	end

	# Create an instance of `MemberIntroducer` that will be linked to `self`.
	protected fun create_introducer: INTRODUCER_TYPE is abstract

	# Find the nearest reimplementation root.
	fun resolve_introducer: nullable INTRODUCER_TYPE is abstract
end

# A member.
abstract class Member
	super MemberOrInner

	# Members that this member redefines/reimplements.
	var reimplemented: SimpleCollection[String] = new Array[String]

	# Set the static type.
	fun static_type=(static_type: nullable TypeEntity) is abstract

	# Get the static type.
	fun static_type: nullable TypeEntity is abstract

	# Append the specified parameter to the signature.
	fun add_parameter(parameter: MemberParameter) do end

	# Append a member that is reimplemeneted by `self`.
	fun reimplement(parent: String) do
		reimplemented.add(parent)
	end

	redef fun is_intro do return reimplemented.length <= 0

	# Is the member abstract?
	fun is_abstract=(is_abstract: Bool) do
		self["is_abstract"] = is_abstract
	end

	# Find the nearest reimplementation root.
	#
	#     var g = new ProjectGraph("foo")
	#     var m1 = new Attribute(g)
	#     var m2 = new Attribute(g)
	#     var m3 = new Attribute(g)
	#     #
	#     m1.model_id = "1"
	#     m1.put_in_graph
	#     m2.reimplement("1")
	#     m2.put_in_graph
	#     assert m1.resolve_introducer == m1.introducer
	#     assert m2.resolve_introducer == m1.introducer
	#     #
	#     m3.model_id = "3"
	#     m3.reimplement("3")
	#     m3.put_in_graph
	#     assert m3.resolve_introducer == null
	redef fun resolve_introducer do
		if introducer == null then
			var member_queue = new List[String]
			var visited = new HashSet[Member]
			var member: Member

			member_queue.add_all(reimplemented)
			while not member_queue.is_empty do
				member = graph.by_id[member_queue.shift].as(Member)
				if visited.has(member) then
					return null
				else if member.is_intro then
					return member.introducer
				else
					visited.add(member)
					member_queue.add_all(member.reimplemented)
				end
			end
			return null
		else
			return introducer
		end
	end
end

# An unrecognized member.
#
# Used to simplify the handling of ignored entities.
class UnknownMember
	super Member

	redef fun put_in_graph do end
	redef fun put_edges do end
end

# A local definition of a method.
class Method
	super Member

	redef type INTRODUCER_TYPE: MethodIntroducer

	# The method’s signature.
	var signature: Signature is noinit, writable

	init do
		super
		self.labels.add("MMethodDef")
		self["is_intern"] = false # TODO
		self["is_extern"] = false # TODO
		signature = new Signature(graph)
		is_abstract = false
	end

	# Set the return type.
	redef fun static_type=(static_type: nullable TypeEntity) do
		signature.return_type = static_type
	end

	# Get the return type.
	redef fun static_type: nullable TypeEntity do return signature.return_type

	redef fun add_parameter(parameter: MemberParameter) do
		signature.parameters.add(parameter)
	end

	redef fun create_introducer do return new MethodIntroducer(graph)

	redef fun put_in_graph do
		super
		signature.put_in_graph
	end

	redef fun put_edges do
		super
		graph.add_edge(self, "SIGNATURE", signature)
	end
end

# A local definition of an attribute.
class Attribute
	super Member

	redef type INTRODUCER_TYPE: AttributeIntroducer

	# The declared type.
	redef var static_type: nullable TypeEntity = null is writable

	init do
		super
		self.labels.add("MAttributeDef")
	end

	redef fun create_introducer do return new AttributeIntroducer(graph)

	redef fun put_in_graph do
		super
		if static_type != null then
			static_type.as(not null).put_in_graph
		end
	end

	redef fun put_edges do
		super
		if static_type != null then
			graph.add_edge(self, "TYPE", static_type.as(not null))
		end
	end
end

# The `MProperty` node of a root of a reimplementation graph.
abstract class MemberIntroducer
	super Entity

	init do
		super
		self.labels.add("MProperty")
		self["visibility"] = "public"
	end

	# Set the visibility.
	fun visibility=(visibility: String) do
		self["visibility"] = visibility
	end

	# Get the visibility.
	#
	# Return `""` by default.
	fun visibility: String do
		var visibility = self["visibility"]
		if visibility isa String then return visibility
		return ""
	end
end

# A `MProperty` node for a method.
class MethodIntroducer
	super MemberIntroducer

	init do
		super
		self.labels.add("MMethod")
		self["is_init"] = false # TODO
	end
end

# A `MProperty` node for an attribute.
class AttributeIntroducer
	super MemberIntroducer

	init do
		super
		self.labels.add("MAttribute")
	end
end

redef class Compound
	# Append the specified member.
	fun declare_member(member: Member) do end
end
