Received: from mail-m118111.qiye.163.com (mail-m118111.qiye.163.com [115.236.118.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08324185D
	for <loongarch@lists.linux.dev>; Sat,  8 Apr 2023 12:42:51 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [121.32.254.147])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 0EC145801A9;
	Sat,  8 Apr 2023 20:42:40 +0800 (CST)
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
Subject: [PATCH v11 8/8] selftests/ftrace: Add funcgraph-retval test case
Date: Sat,  8 Apr 2023 05:42:22 -0700
Message-Id: <9fedbd25e63f012cade5dad13be21225fec2fb5d.1680954589.git.pengdonglin@sangfor.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSB1LVk4fSR9NSB4dQ0lJTVUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpJSlVISVVJTk9VSk9MWVdZFhoPEhUdFFlBWU9LSFVKSktPSEhVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Myo6Egw6OD0cSzcWFRwsVgtP
	VjcaFBVVSlVKTUNLQk5MTE1KTkJPVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSklKVUhJVUlOT1VKT0xZV1kIAVlBT0hNSzcG
X-HM-Tid: 0a8760e3e6582eb7kusn0ec145801a9
X-HM-MType: 1

Add a test case for the funcgraph-retval and funcgraph-retval-hex
trace options.

Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
---
v11:
 - Fix selftest issues

v10:
 - Fix issues in selftest

v8:
 - Fix issues in selftest
---
 .../ftrace/test.d/ftrace/fgraph-retval.tc     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
new file mode 100644
index 000000000000..e34c0bdef3ed
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
@@ -0,0 +1,44 @@
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
+# get self PID, can not use $$, because it is PPID
+read PID _ < /proc/self/stat
+
+[ -f set_ftrace_filter ] && echo proc_reg_write > set_ftrace_filter
+[ -f set_ftrace_pid ] && echo ${PID} > set_ftrace_pid
+echo function_graph > current_tracer
+echo 1 > options/funcgraph-retval
+
+set +e
+enable_tracing
+echo > /proc/interrupts
+disable_tracing
+set -e
+
+: "Test printing the error code in signed decimal format"
+echo 0 > options/funcgraph-retval-hex
+count=`cat trace | grep 'proc_reg_write' | grep '= -5' | wc -l`
+if [ $count -eq 0 ]; then
+    fail "Return value can not be printed in signed decimal format"
+fi
+
+: "Test printing the error code in hexadecimal format"
+echo 1 > options/funcgraph-retval-hex
+count=`cat trace | grep 'proc_reg_write' | grep 'fffffffb' | wc -l`
+if [ $count -eq 0 ]; then
+    fail "Return value can not be printed in hexadecimal format"
+fi
+
+exit 0
-- 
2.25.1

