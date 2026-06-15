Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2A63DBD5A
	for <loongarch@lists.linux.dev>; Mon, 15 Jun 2026 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517918; cv=none; b=DpfnRd5AFUlcjaUAoC4U0XYBrl1l31N3ZAGhCtkp8wppQDtIbfD3CJMBnpomoV+jra8RqDyrG4PZ6/h8LIRW6JN/A7eFah04f4/jvVxrHH6a23GBMO9NkXf+pRMFfgbadINRYT251u2UxPDbQ2xogqE3wHqh9jVg4tuo7Y1X4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517918; c=relaxed/simple;
	bh=MKUEgZ9URsba4XBCdSfaDXF8noHN0KMUa7DGr6JfquA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SN5V0t6OWeDXFW/q+G02vZlcvGeJGGa2PadfdiRhD29bDrhk+JW5bhWE4ty3+fzXImrrOiTNPPa9e2WeA8czsvVXibh0IJH603BFKTTL8SR493iB0U6ntl8X40c482i7XdOS0KnP5YcOKbHod/E1n0ycCnPEJ20fO8cUOiSjlcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxsOpYzi9qMU0UAA--.53388S3;
	Mon, 15 Jun 2026 18:05:12 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxzsJTzi9qlgOnAA--.55069S3;
	Mon, 15 Jun 2026 18:05:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org
Subject: [PATCH bpf-next v2 1/4] selftests/bpf: Add get_preempt_count() support for LoongArch
Date: Mon, 15 Jun 2026 18:05:03 +0800
Message-ID: <20260615100506.19558-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260615100506.19558-1-yangtiezhu@loongson.cn>
References: <20260615100506.19558-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxzsJTzi9qlgOnAA--.55069S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZw4xWw1xZFyruryUWr4rWFX_yoW5tr1kpr
	y8Aryjyw45Jay8KF97Jw4kZF1aqwn7Was5Gw1akw4Sk3Wjq3y8XrySgFy3tr4YgryFgrW0
	vrZrK39xuanrAabCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jea0PUUUUU=

There is no LoongArch support for get_preempt_count() currently and its
fallback path always returns 0, just add it so that bpf_in_interrupt(),
bpf_in_nmi(), bpf_in_hardirq(), bpf_in_serving_softirq(), bpf_in_task()
work for LoongArch as well.

Use bpf_core_field_exists() to provide compatibility for both legacy and
future kernels. Additionally, a struct flavor "task_struct___local" is
introduced to bypass static compiler checks when thread_info is missing
from the base task_struct.

For the newer kernels that select CONFIG_THREAD_INFO_IN_TASK, it reads
preempt_count from the thread_info embedded within task_struct. For the
older kernels without selecting CONFIG_THREAD_INFO_IN_TASK, it retrieves
the thread_info pointer from the bottom of the kernel stack (task->stack)
and then reads the preempt_count. This ensures the BPF selftests remain
functional across various LoongArch kernel versions.

With this patch, "./test_progs -t exe_ctx" passes on LoongArch regardless
of whether CONFIG_THREAD_INFO_IN_TASK is set.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 .../testing/selftests/bpf/bpf_experimental.h  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index d1db355e872b..1d0b29a9acb8 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -401,6 +401,12 @@ struct task_struct___preempt_rt {
 extern struct lowcore *bpf_get_lowcore(void) __weak __ksym;
 #endif
 
+#ifdef bpf_target_loongarch
+struct task_struct___local {
+	struct thread_info thread_info;
+} __attribute__((preserve_access_index));
+#endif
+
 static inline int get_preempt_count(void)
 {
 #if defined(bpf_target_x86)
@@ -423,6 +429,18 @@ static inline int get_preempt_count(void)
 	return bpf_get_current_task_btf()->thread_info.preempt_count;
 #elif defined(bpf_target_s390)
 	return bpf_get_lowcore()->preempt_count;
+#elif defined(bpf_target_loongarch)
+	struct task_struct *task = bpf_get_current_task_btf();
+	struct task_struct___local *task_alt = (void *)task;
+
+	if (bpf_core_field_exists(task_alt->thread_info)) {
+		return BPF_CORE_READ(task_alt, thread_info.preempt_count);
+	} else {
+		void *stack = BPF_CORE_READ(task, stack);
+		struct thread_info *ti = (void *)stack;
+
+		return BPF_CORE_READ(ti, preempt_count);
+	}
 #endif
 	return 0;
 }
@@ -433,6 +451,7 @@ static inline int get_preempt_count(void)
  *	* arm64
  *	* powerpc64
  *	* s390x
+ *	* loongarch
  */
 static inline int bpf_in_interrupt(void)
 {
@@ -454,6 +473,7 @@ static inline int bpf_in_interrupt(void)
  *	* arm64
  *	* powerpc64
  *	* s390x
+ *	* loongarch
  */
 static inline int bpf_in_nmi(void)
 {
@@ -466,6 +486,7 @@ static inline int bpf_in_nmi(void)
  *	* arm64
  *	* powerpc64
  *	* s390x
+ *	* loongarch
  */
 static inline int bpf_in_hardirq(void)
 {
@@ -478,6 +499,7 @@ static inline int bpf_in_hardirq(void)
  *	* arm64
  *	* powerpc64
  *	* s390x
+ *	* loongarch
  */
 static inline int bpf_in_serving_softirq(void)
 {
@@ -498,6 +520,7 @@ static inline int bpf_in_serving_softirq(void)
  *	* arm64
  *	* powerpc64
  *	* s390x
+ *	* loongarch
  */
 static inline int bpf_in_task(void)
 {
-- 
2.42.0

