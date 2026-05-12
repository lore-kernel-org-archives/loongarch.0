Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC5448A2BD
	for <loongarch@lists.linux.dev>; Tue, 12 May 2026 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574046; cv=none; b=e92ZpHaxuhUnXqftNf58Ujv6J6dE5QwRjszto3q59OnVNQSLeiyR4CgsBUGLlvfuRag2o8XXsUIbs2meQPyQk1ef3HJfemQG+4Y/0zzEyaBlsJwSq4jfiyLzJlcGM+tFKFcx2fsheKWgEr7hxM60xAzFZZVpJ3lieqNfA65ti0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574046; c=relaxed/simple;
	bh=Q00x6WZjMklqfpcFl2VKjBA7b7e9J3MZVkUeirnFg7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5iF9+btRzJNEWMAPic2f/iFbDDDTYD7LFyK+hHKDoITN8zpdRB096vMje0d75z1Hqsy6o+BsJ2/32KthPFT0U09WEn6ahmxQF+4Aln5oLctq2uXR4q9e8F1EHTRggVd2shUD/uBTHpXy7MbjxETq23mVwlVK3dNKqB/6d05Ypc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxVejR4gJqZgsJAA--.21753S3;
	Tue, 12 May 2026 16:20:33 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxGMHO4gJqAwKAAA--.32306S3;
	Tue, 12 May 2026 16:20:32 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] LoongArch: ftrace: Fix stale per-CPU kprobe state after task migration
Date: Tue, 12 May 2026 16:20:26 +0800
Message-ID: <20260512082029.2131-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260512082029.2131-1-yangtiezhu@loongson.cn>
References: <20260512082029.2131-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxGMHO4gJqAwKAAA--.32306S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWFWftFWfKrWUXFWDuFW5XFc_yoW5AF47pF
	Zakws0gr4kJa4Sya9I9w4rXrnYkrZ7ArW7GanrKryrtan8tw12vr97KayDXF1kGryktFy3
	Zr1qy39rua9rZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==

When probing kernel functions via ftrace, a scheduling event occurring
inside the kprobe handler can lead to task migration. If the executing
task is migrated to another CPU after setting per-CPU "current_kprobe"
but before clearing it, the original CPU is left with a stale state.

This stale state causes the original CPU to remain permanently "busy"
from the kprobe perspective, as its per-CPU "current_kprobe" is never
cleared thereafter. As a result, subsequent kprobes triggered on that
CPU are incorrectly treated as nested probes and skipped (increasing
nmissed count), leading to functional failures on the affected CPU.

Fix this by adding a self-reset mechanism in kprobe_ftrace_handler().
When a kprobe is triggered while the "current_kprobe" is already set,
verify if it is a stale state by checking:

(1) In task context (not a legitimate interrupt nest).
(2) A different kprobe (not a recursive trigger on the same probe).
(3) In an active or stepping state.

If these conditions are met, it indicates that the previous kprobe
execution was scheduled and migrated. Reset the per-CPU state to
recover the CPU's kprobe functionality, allowing the current probe
to be processed normally.

This acts as a defensive mechanism to recover the CPU's kprobe state
machine from inconsistent states caused by unexpected task migrations
during kprobe execution.

Fixes: 09e679c28a4d ("LoongArch: Add kprobes on ftrace support")
Reported-by: Hui Li <lihui@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/ftrace_dyn.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
index d5d81d74034c..03d303d67f18 100644
--- a/arch/loongarch/kernel/ftrace_dyn.c
+++ b/arch/loongarch/kernel/ftrace_dyn.c
@@ -310,6 +310,29 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		goto out;
 
 	kcb = get_kprobe_ctlblk();
+
+	if (kprobe_running()) {
+		/*
+		 * If a previous kprobe handler was interrupted by a scheduling event
+		 * and the task migrated to another CPU, the "current_kprobe" state
+		 * might be left stale on this CPU.
+		 *
+		 * Reset the stale state here to allow the current probe to proceed
+		 * normally instead of being falsely treated as a nested probe if:
+		 *
+		 * (1) In task context (not a legitimate interrupt nest).
+		 * (2) A different kprobe (not a recursive trigger on the same probe).
+		 * (3) In an active or stepping state.
+		 *
+		 * This acts as a defensive mechanism to recover the CPU's kprobe state
+		 * machine from inconsistent states caused by unexpected task migrations.
+		 */
+		if (in_task() && kprobe_running() != p &&
+		    (kcb->kprobe_status == KPROBE_HIT_ACTIVE ||
+		     kcb->kprobe_status == KPROBE_HIT_SSDONE))
+			reset_current_kprobe();
+	}
+
 	if (kprobe_running()) {
 		kprobes_inc_nmissed_count(p);
 	} else {
-- 
2.42.0

