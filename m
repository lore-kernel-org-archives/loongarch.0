Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743FDA50
	for <loongarch@lists.linux.dev>; Tue, 28 Feb 2023 08:03:20 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8DxJYxDtf1jtmUGAA--.6508S3;
	Tue, 28 Feb 2023 16:03:15 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxB707tf1jb3tAAA--.49681S3;
	Tue, 28 Feb 2023 16:03:12 +0800 (CST)
From: Jinyang He <hejinyang@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Xi Ruoyao <xry111@xry111.site>,
	Youling Tang <tangyouling@loongson.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] LoongArch: Rename handle_syscall to handle_sys
Date: Tue, 28 Feb 2023 16:02:52 +0800
Message-Id: <20230228080257.28807-2-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230228080257.28807-1-hejinyang@loongson.cn>
References: <20230228080257.28807-1-hejinyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxB707tf1jb3tAAA--.49681S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7WF13Kw43Kw17GF1rCw15urg_yoW8Ar1Dp3
	45Ar4kZrWkKFnxZasxC3WUurW8AasrWw129a1UKFWrCFnxXFnY9ry0va93XF1agw4xWFW0
	vFn5J392qay5GwUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
	4UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=

The original handle_sys() is a trampline for handler_syscall. Drop it
and rename handle_syscall to handle_sys for invoking it directly.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/loongarch/kernel/entry.S | 13 +++++++------
 arch/loongarch/kernel/genex.S |  5 -----
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.S
index d737e3cf42d3..d6e9572eb279 100644
--- a/arch/loongarch/kernel/entry.S
+++ b/arch/loongarch/kernel/entry.S
@@ -18,9 +18,9 @@
 	.text
 	.cfi_sections	.debug_frame
 	.align	5
-SYM_FUNC_START(handle_syscall)
+SYM_FUNC_START(handle_sys)
 	csrrd		t0, PERCPU_BASE_KS
-	la.pcrel	t1, kernelsp
+	la_abs		t1, kernelsp
 	add.d		t1, t1, t0
 	move		t2, sp
 	ld.d		sp, t1, 0
@@ -62,12 +62,13 @@ SYM_FUNC_START(handle_syscall)
 	li.d		tp, ~_THREAD_MASK
 	and		tp, tp, sp
 
-	move		a0, sp
-	bl		do_syscall
+	move	a0, sp
+	la_abs	ra, do_syscall
+	jirl	ra, ra, 0
 
 	RESTORE_ALL_AND_RET
-SYM_FUNC_END(handle_syscall)
-_ASM_NOKPROBE(handle_syscall)
+SYM_FUNC_END(handle_sys)
+_ASM_NOKPROBE(handle_sys)
 
 SYM_CODE_START(ret_from_fork)
 	bl		schedule_tail		# a0 = struct task_struct *prev
diff --git a/arch/loongarch/kernel/genex.S b/arch/loongarch/kernel/genex.S
index 44ff1ff64260..1af169ca3734 100644
--- a/arch/loongarch/kernel/genex.S
+++ b/arch/loongarch/kernel/genex.S
@@ -91,8 +91,3 @@ SYM_FUNC_END(except_vec_cex)
 	BUILD_HANDLER ri ri none
 	BUILD_HANDLER watch watch none
 	BUILD_HANDLER reserved reserved none	/* others */
-
-SYM_FUNC_START(handle_sys)
-	la_abs	t0, handle_syscall
-	jr	t0
-SYM_FUNC_END(handle_sys)
-- 
2.34.3

