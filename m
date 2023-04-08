Received: from mail-m118111.qiye.163.com (mail-m118111.qiye.163.com [115.236.118.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB6C2F7
	for <loongarch@lists.linux.dev>; Sat,  8 Apr 2023 12:42:50 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [121.32.254.147])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 049785802B3;
	Sat,  8 Apr 2023 20:42:29 +0800 (CST)
From: Donglin Peng <pengdonglin@sangfor.com.cn>
To: mhiramat@kernel.org,
	rostedt@goodmis.org,
	linux@armlinux.org.uk,
	mark.rutland@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	rmk+kernel@armlinux.org.uk,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	bp@alien8.de,
	hpa@zytor.com,
	chenhuacai@kernel.org,
	zhangqing@loongson.cn,
	kernel@xen0n.name,
	mingo@redhat.com,
	peterz@infradead.org,
	xiehuan09@gmail.com,
	dinghui@sangfor.com.cn,
	huangcun@sangfor.com.cn,
	dolinux.peng@gmail.com
Cc: linux-trace-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Donglin Peng <pengdonglin@sangfor.com.cn>
Subject: [PATCH v11 2/8] tracing: Add documentation for funcgraph-retval and funcgraph-retval-hex
Date: Sat,  8 Apr 2023 05:42:16 -0700
Message-Id: <2b5635f05146161b54c9ea6307e25efe5ccebdad.1680954589.git.pengdonglin@sangfor.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
References: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHR5IVkhISh9KQ0saQhpCS1UTARMWGhIXJBQOD1
	lXWRgSC1lBWUpJSlVISVVJTk9VSk9MWVdZFhoPEhUdFFlBWU9LSFVKSEpCSE9VSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NE06Djo*Cj0PGjcOMxwBVg4p
	Q0oKC05VSlVKTUNLQk5MTE5KTUxJVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSklKVUhJVUlOT1VKT0xZV1kIAVlBQkpLSTcG
X-HM-Tid: 0a8760e3bf4c2eb7kusn049785802b3
X-HM-MType: 1

Add documentation for the two newly introduced options for the
function_graph tracer. The funcgraph-retval option is used to
control whether or not to display the return value, while the
funcgraph-retval-hex option is used to control the display
format of the return value.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
---
v11:
 - Add a limitation discovered by Mark.

v9:
 - Update limitation description

v7:
 - Rename trace option 'graph_retval_hex' to 'funcgraph-retval-hex'
 - Update documentation description

v6:
 - Modify the limitations for funcgraph-retval
 - Optimize the English expression

v5:
 - Describe the limitations of funcgraph-retval
---
 Documentation/trace/ftrace.rst | 126 +++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index b927fb2b94dc..bd3e2b96f3f3 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -1328,6 +1328,19 @@ Options for function_graph tracer:
 	only a closing curly bracket "}" is displayed for
 	the return of a function.
 
+  funcgraph-retval
+	When set, the return value of each traced function
+	will be printed after an equal sign "=". By default
+	this is off.
+
+  funcgraph-retval-hex
+	When set, the return value will always be printed
+	in hexadecimal format. If the option is not set and
+	the return value is an error code, it will be printed
+	in signed decimal format; otherwise it will also be
+	printed in hexadecimal format. By default, this option
+	is off.
+
   sleep-time
 	When running function graph tracer, to include
 	the time a task schedules out in its function.
@@ -2673,6 +2686,119 @@ It is default disabled.
     0)   1.757 us    |        } /* kmem_cache_free() */
     0)   2.861 us    |      } /* putname() */
 
+The return value of each traced function can be displayed after
+an equal sign "=". When encountering system call failures, it
+can be verfy helpful to quickly locate the function that first
+returns an error code.
+
+	- hide: echo nofuncgraph-retval > trace_options
+	- show: echo funcgraph-retval > trace_options
+
+  Example with funcgraph-retval::
+
+    1)               |    cgroup_migrate() {
+    1)   0.651 us    |      cgroup_migrate_add_task(); /* = 0xffff93fcfd346c00 */
+    1)               |      cgroup_migrate_execute() {
+    1)               |        cpu_cgroup_can_attach() {
+    1)               |          cgroup_taskset_first() {
+    1)   0.732 us    |            cgroup_taskset_next(); /* = 0xffff93fc8fb20000 */
+    1)   1.232 us    |          } /* cgroup_taskset_first = 0xffff93fc8fb20000 */
+    1)   0.380 us    |          sched_rt_can_attach(); /* = 0x0 */
+    1)   2.335 us    |        } /* cpu_cgroup_can_attach = -22 */
+    1)   4.369 us    |      } /* cgroup_migrate_execute = -22 */
+    1)   7.143 us    |    } /* cgroup_migrate = -22 */
+
+The above example shows that the function cpu_cgroup_can_attach
+returned the error code -22 firstly, then we can read the code
+of this function to get the root cause.
+
+When the option funcgraph-retval-hex is not set, the return value can
+be displayed in a smart way. Specifically, if it is an error code,
+it will be printed in signed decimal format, otherwise it will
+printed in hexadecimal format.
+
+	- smart: echo nofuncgraph-retval-hex > trace_options
+	- hexadecimal: echo funcgraph-retval-hex > trace_options
+
+  Example with funcgraph-retval-hex::
+
+    1)               |      cgroup_migrate() {
+    1)   0.651 us    |        cgroup_migrate_add_task(); /* = 0xffff93fcfd346c00 */
+    1)               |        cgroup_migrate_execute() {
+    1)               |          cpu_cgroup_can_attach() {
+    1)               |            cgroup_taskset_first() {
+    1)   0.732 us    |              cgroup_taskset_next(); /* = 0xffff93fc8fb20000 */
+    1)   1.232 us    |            } /* cgroup_taskset_first = 0xffff93fc8fb20000 */
+    1)   0.380 us    |            sched_rt_can_attach(); /* = 0x0 */
+    1)   2.335 us    |          } /* cpu_cgroup_can_attach = 0xffffffea */
+    1)   4.369 us    |        } /* cgroup_migrate_execute = 0xffffffea */
+    1)   7.143 us    |      } /* cgroup_migrate = 0xffffffea */
+
+At present, there are some limitations when using the funcgraph-retval
+option, and these limitations will be eliminated in the future:
+
+- Even if the function return type is void, a return value will still
+  be printed, and you can just ignore it.
+
+- Even if return values are stored in multiple registers, only the
+  value contained in the first register will be recorded and printed.
+  To illustrate, in the x86 architecture, eax and edx are used to store
+  a 64-bit return value, with the lower 32 bits saved in eax and the
+  upper 32 bits saved in edx. However, only the value stored in eax
+  will be recorded and printed.
+
+- In certain procedure call standards, such as arm64's AAPCS64, when a
+  type is smaller than a GPR, it is the responsibility of the consumer
+  to perform the narrowing, and the upper bits may contain UNKNOWN values.
+  Therefore, it is advisable to check the code for such cases. For instance,
+  when using a u8 in a 64-bit GPR, bits [63:8] may contain arbitrary values,
+  especially when larger types are truncated, whether explicitly or implicitly.
+  Here are some specific cases to illustrate this point:
+
+  **Case One**::
+
+  The function narrow_to_u8 is defined as follows::
+
+	u8 narrow_to_u8(u64 val)
+	{
+		// implicitly truncated
+		return val;
+	}
+
+  It may be compiled to::
+
+	narrow_to_u8:
+		< ... ftrace instrumentation ... >
+		RET
+
+  If you pass 0x123456789abcdef to this function and want to narrow it,
+  it may be recorded as 0x123456789abcdef instead of 0xef.
+
+  **Case Two**::
+
+  The function error_if_not_4g_aligned is defined as follows::
+
+	int error_if_not_4g_aligned(u64 val)
+	{
+		if (val & GENMASK(31, 0))
+			return -EINVAL;
+
+		return 0;
+	}
+
+  It could be compiled to::
+
+	error_if_not_4g_aligned:
+		CBNZ    w0, .Lnot_aligned
+		RET			// bits [31:0] are zero, bits
+					// [63:32] are UNKNOWN
+	.Lnot_aligned:
+		MOV    x0, #-EINVAL
+		RET
+
+  When passing 0x2_0000_0000 to it, the return value may be recorded as
+  0x2_0000_0000 instead of 0.
+
 You can put some comments on specific functions by using
 trace_printk() For example, if you want to put a comment inside
 the __might_sleep() function, you just have to include
-- 
2.25.1

