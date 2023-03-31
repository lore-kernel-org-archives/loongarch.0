Received: from mail-m118111.qiye.163.com (mail-m118111.qiye.163.com [115.236.118.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE2290D
	for <loongarch@lists.linux.dev>; Fri, 31 Mar 2023 12:48:29 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 4BB2A580485;
	Fri, 31 Mar 2023 20:48:15 +0800 (CST)
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
Subject: [PATCH v10 8/8] selftests/ftrace: Add funcgraph-retval test case
Date: Fri, 31 Mar 2023 05:47:44 -0700
Message-Id: <ba23c2429f1ef798946ce65e21c7a7a2bff0019e.1680265828.git.pengdonglin@sangfor.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1680265828.git.pengdonglin@sangfor.com.cn>
References: <cover.1680265828.git.pengdonglin@sangfor.com.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0NOVh5DS0gfQxodQh9KTlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS0hKTFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NxQ6MDo6MT0WIU0SHTo6IT0N
	IilPClZVSlVKTUNLSU1NQ0JNQkhNVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFPSE5DNwY+
X-HM-Tid: 0a8737b624292eb7kusn4bb2a580485
X-HM-MType: 1

Add a test case for the funcgraph-retval and funcgraph-retval-hex
trace options.

Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
---
v10:
 - Fix issues in selftest

v8:
 - Fix issues in selftest
---
 .../ftrace/test.d/ftrace/fgraph-retval.tc     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
new file mode 100644
index 000000000000..5819aa2dd6ad
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
@@ -0,0 +1,43 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: ftrace - function graph print function return value
+# requires: options/funcgraph-retval options/funcgraph-retval-hex function_graph:tracer
+
+# Make sure that funcgraph-retval works
+
+fail() { # msg
+    echo $1
+    exit_fail
+}
+
+disable_tracing
+clear_trace
+
+read PID _ < /proc/self/stat
+[ -f set_ftrace_pid ] && echo ${PID} > set_ftrace_pid
+[ -f set_ftrace_filter ] && echo proc_reg_write > set_ftrace_filter
+[ -f set_graph_function ] && echo proc_reg_write > set_graph_function
+echo function_graph > current_tracer
+echo funcgraph-retval > trace_options
+
+set +e
+enable_tracing
+echo > /proc/interrupts
+disable_tracing
+set -e
+
+: "Test printing the error code in signed decimal format"
+echo nofuncgraph-retval-hex > trace_options
+count=`cat trace | grep 'proc_reg_write' | grep '= -5' | wc -l`
+if [ $count -eq 0 ]; then
+    fail "Return value can not be printed in signed decimal format"
+fi
+
+: "Test printing the error code in hexadecimal format"
+echo funcgraph-retval-hex > trace_options
+count=`cat trace | grep 'proc_reg_write' | grep 'fffffffb' | wc -l`
+if [ $count -eq 0 ]; then
+    fail "Return value can not be printed in hexadecimal format"
+fi
+
+exit 0
-- 
2.25.1

