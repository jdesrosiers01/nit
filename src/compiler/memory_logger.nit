# This file is part of NIT ( http://www.nitlanguage.org ).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Extension to inject memory-tracing instrumentation in code generated by `nitc`.
module memory_logger

import abstract_compiler

redef class ToolContext
	# --trace-memory
	var opt_trace_memory = new OptionBool("Enable dynamic measure of memory usage", "--trace-memory")

	init do
		self.option_context.add_option opt_trace_memory
	end
end

redef class AbstractCompiler
	redef fun compile_before_main(v)
	do
		super

		if not modelbuilder.toolcontext.opt_trace_memory.value then return

		header.add_decl("#include <time.h>")
		header.add_decl("extern FILE *mlog;")
		header.add_decl("extern struct timespec mlog_last;")
		header.add_decl("extern struct timespec mlog_time0;")
		v.add_decl("FILE *mlog;")
		v.add_decl("struct timespec mlog_last;")
		v.add_decl("struct timespec mlog_time0;")
	end

	redef fun compile_begin_main(v)
	do
		super

		if not modelbuilder.toolcontext.opt_trace_memory.value then return

		v.add("mlog = fopen(\"memory.log\", \"w\");")
		v.add("clock_gettime(CLOCK_MONOTONIC, &mlog_time0);")
	end
end

redef class AbstractCompilerVisitor
	redef fun nit_alloc(size, tag)
	do
		if not compiler.modelbuilder.toolcontext.opt_trace_memory.value then return super

		# Log time each 10ms (ie 1e7ns)
		var tw = get_name("mtw")
		add_decl("struct timespec {tw};")
		add("clock_gettime(CLOCK_MONOTONIC, &{tw});")
		add("if(mlog_last.tv_sec < {tw}.tv_sec || mlog_last.tv_nsec + 1e7 < {tw}.tv_nsec) \{")
		add("mlog_last = {tw};")
		add("fprintf(mlog, \"# %f\\n\", 1000.0*{tw}.tv_sec + 1e-6*{tw}.tv_nsec - (1000.0*mlog_time0.tv_sec + 1e-6*mlog_time0.tv_nsec));")
		add("\}")

		# Print size and tag the mlog
		var str = "\"+\\t%d\\t%s\\n\", {size}, \"{tag or else "?"}\""
		add("fprintf(mlog, {str});")

		return super
	end
end