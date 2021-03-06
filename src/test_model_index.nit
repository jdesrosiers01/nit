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

import frontend
import model_index
import console

redef class ToolContext
	var opt_name_prefix = new OptionBool("", "--name-prefix")
	var opt_full_name_prefix = new OptionBool("", "--full-name-prefix")
	var opt_name_similarity = new OptionBool("", "--name-similarity")
	var opt_full_name_similarity = new OptionBool("", "--full-name-similarity")
	var opt_name = new OptionBool("", "--name")
	var opt_full_name = new OptionBool("", "--full-name")

	redef init do
		option_context.add_option(opt_name_prefix, opt_full_name_prefix)
		option_context.add_option(opt_name_similarity, opt_full_name_similarity)
		option_context.add_option(opt_name, opt_full_name)
	end
end

redef class MEntity
	fun color: String do
		if visibility == public_visibility then
			return name.green
		else if visibility == protected_visibility then
			return name.yellow
		else
			return name.red
		end
	end
end

# build toolcontext
var toolcontext = new ToolContext
toolcontext.process_options(args)
var args = toolcontext.option_context.rest

if not args.length == 2 then
	print "usage: test_model_index <nitfile> <search_query>"
	exit 1
end

# build model
var model = new Model
var mbuilder = new ModelBuilder(model, toolcontext)
var mmodules = mbuilder.parse_full([args.first])

# process
if mmodules.is_empty then return
mbuilder.run_phases
toolcontext.run_global_phases(mmodules)
var mainmodule = toolcontext.make_main_module(mmodules)

# Build index
var filters = new ModelFilter(
	private_visibility,
	accept_fictive = false,
	accept_test = false)
var view = new ModelView(model, mainmodule, filters)
var index = new ModelIndex
for mentity in view.mentities do
	if mentity isa MClassDef or mentity isa MPropDef then continue
	index.index(mentity)
end

var q = args[1]

print "# {q}\n"

var res
if toolcontext.opt_name_prefix.value then
	res = index.find_by_name_prefix(q)
else if toolcontext.opt_full_name_prefix.value then
	res = index.find_by_full_name_prefix(q)
else if toolcontext.opt_name_similarity.value then
	res = index.find_by_name_similarity(q)
else if toolcontext.opt_full_name_similarity.value then
	res = index.find_by_full_name_similarity(q)
else if toolcontext.opt_name.value then
	res = index.find_by_name(q)
else if toolcontext.opt_full_name.value then
	res = index.find_by_full_name(q)
else
	res = index.find(q)
end

res = res.sort(new ScoreComparator, new MEntityComparator).
		uniq.
		limit(10).
		sort(new VisibilityComparator, new NameComparator)

for e in res do
	if toolcontext.opt_no_color.value then
		print " * {e.score}: {e.mentity.name} ({e.mentity.full_name})"
	else
		print " * {e.score}: {e.mentity.color} ({e.mentity.full_name})"
	end
end
