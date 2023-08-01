Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1CA1383
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 03:20:13 +0000 (UTC)
X-UUID: 41ffdf2160a04e229baabc2604a40ff5-20230801
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:0ce1f64f-6f9f-47bd-b73a-093f8ba3474a,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.1.28,REQID:0ce1f64f-6f9f-47bd-b73a-093f8ba3474a,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:2dbeab42-d291-4e62-b539-43d7d78362ba,B
	ulkID:230801105842XBL3QNGZ,BulkQuantity:0,Recheck:0,SF:17|19|44|38|24|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 41ffdf2160a04e229baabc2604a40ff5-20230801
X-User: lienze@kylinos.cn
Received: from ubuntu.. [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 138458878; Tue, 01 Aug 2023 10:58:42 +0800
From: Enze Li <lienze@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	glider@google.com,
	elver@google.com,
	akpm@linux-foundation.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Cc: zhangqing@loongson.cn,
	yangtiezhu@loongson.cn,
	dvyukov@google.com,
	Enze Li <lienze@kylinos.cn>,
	Jinyang He <hejinyang@loongson.cn>
Subject: [PATCH 3/4 v3] LoongArch: Get stack without NMI when providing regs parameter
Date: Tue,  1 Aug 2023 10:58:14 +0800
Message-Id: <20230801025815.2436293-4-lienze@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801025815.2436293-1-lienze@kylinos.cn>
References: <20230801025815.2436293-1-lienze@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, arch_stack_walk() can only get the full stack information
including NMI.  This is because the implementation of arch_stack_walk()
is forced to ignore the information passed by the regs parameter and use
the current stack information instead.

For some detection systems like KFENCE, only partial stack information
is needed.  In particular, the stack frame where the interrupt occurred.

To support KFENCE, this patch modifies the implementation of the
arch_stack_walk() function so that if this function is called with the
regs argument passed, it retains all the stack information in regs and
uses it to provide accurate information.

Before the patch applied, I get,
[    1.531195 ] ==================================================================
[    1.531442 ] BUG: KFENCE: out-of-bounds read in stack_trace_save_regs+0x48/0x6c
[    1.531442 ]
[    1.531900 ] Out-of-bounds read at 0xffff800012267fff (1B left of kfence-#12):
[    1.532046 ]  stack_trace_save_regs+0x48/0x6c
[    1.532169 ]  kfence_report_error+0xa4/0x528
[    1.532276 ]  kfence_handle_page_fault+0x124/0x270
[    1.532388 ]  no_context+0x50/0x94
[    1.532453 ]  do_page_fault+0x1a8/0x36c
[    1.532524 ]  tlb_do_page_fault_0+0x118/0x1b4
[    1.532623 ]  test_out_of_bounds_read+0xa0/0x1d8
[    1.532745 ]  kunit_generic_run_threadfn_adapter+0x1c/0x28
[    1.532854 ]  kthread+0x124/0x130
[    1.532922 ]  ret_from_kernel_thread+0xc/0xa4
<snip>

With this patch applied, I get the correct stack information.
[    1.320220 ] ==================================================================
[    1.320401 ] BUG: KFENCE: out-of-bounds read in test_out_of_bounds_read+0xa8/0x1d8
[    1.320401 ]
[    1.320898 ] Out-of-bounds read at 0xffff800012257fff (1B left of kfence-#10):
[    1.321134 ]  test_out_of_bounds_read+0xa8/0x1d8
[    1.321264 ]  kunit_generic_run_threadfn_adapter+0x1c/0x28
[    1.321392 ]  kthread+0x124/0x130
[    1.321459 ]  ret_from_kernel_thread+0xc/0xa4
<snip>

Co-authored-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 arch/loongarch/kernel/stacktrace.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kernel/stacktrace.c b/arch/loongarch/kernel/stacktrace.c
index 2463d2fea21f..92270f14db94 100644
--- a/arch/loongarch/kernel/stacktrace.c
+++ b/arch/loongarch/kernel/stacktrace.c
@@ -18,17 +18,19 @@ void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 	struct pt_regs dummyregs;
 	struct unwind_state state;
 
-	regs = &dummyregs;
+	if (!regs) {
+		regs = &dummyregs;
 
-	if (task == current) {
-		regs->regs[3] = (unsigned long)__builtin_frame_address(0);
-		regs->csr_era = (unsigned long)__builtin_return_address(0);
-	} else {
-		regs->regs[3] = thread_saved_fp(task);
-		regs->csr_era = thread_saved_ra(task);
+		if (task == current) {
+			regs->regs[3] = (unsigned long)__builtin_frame_address(0);
+			regs->csr_era = (unsigned long)__builtin_return_address(0);
+		} else {
+			regs->regs[3] = thread_saved_fp(task);
+			regs->csr_era = thread_saved_ra(task);
+		}
+		regs->regs[1] = 0;
 	}
 
-	regs->regs[1] = 0;
 	for (unwind_start(&state, task, regs);
 	     !unwind_done(&state) && !unwind_error(&state); unwind_next_frame(&state)) {
 		addr = unwind_get_return_address(&state);
-- 
2.34.1

