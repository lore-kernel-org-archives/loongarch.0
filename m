Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC122388E70
	for <loongarch@lists.linux.dev>; Tue,  7 Apr 2026 06:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775543637; cv=none; b=szCU+g1Q/tsyfi3/BnNQD7hGdeuQDOdvY2t94HS9DdlowIRxzD76zQX2m/xltMn0qmIakuImevkMi90YwD3czNZnuqr9tDWeucFQp6rHvsNHHjhQntXm5n4CqBPoqcQNf31tXxzeMP9m9yoCSjM6E7JXqm4C2wUx8pbL1HLUd2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775543637; c=relaxed/simple;
	bh=9tReZaDhGuR/F4UHgGhNBXzt9nqBPZq4QLYmvpceWL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9ipi7ARJC003GwuHOxvj0o13j2ZoeIrSm3LWRri8Ab42kycHhif4dZI9/xEHnfUgoHzHIie+yltjFvP48fEZ5iQfvdI38lJHJqSW6fOZrJ9dD+oxfPcdjd1y3u1mlMGSvdWFO7a1GYuKAbYAcGVM3vvOoldVmh52rmAawW9/Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx68JQpdRpEqciAA--.30679S3;
	Tue, 07 Apr 2026 14:33:53 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxXcJPpdRphyBnAA--.62639S2;
	Tue, 07 Apr 2026 14:33:51 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] LoongArch: Handle CONFIG_32BIT in syscall_get_arch()
Date: Tue,  7 Apr 2026 14:33:50 +0800
Message-ID: <20260407063350.12479-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxXcJPpdRphyBnAA--.62639S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gr43Ary3CFWkXryUCr43twc_yoWfWwcEvw
	n2yw48urWkXFWfA3Z8X34ftryUGa1rZFn3XFZ29347CasxtryUJ3yjv3srZFWjga1kuFZ8
	Cay0qryfCr15KosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84xRDUUUUU==

If CONFIG_32BIT is set, it should return AUDIT_ARCH_LOONGARCH32 instead of
AUDIT_ARCH_LOONGARCH64 in syscall_get_arch().

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/syscall.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/include/asm/syscall.h
index 81d2733f7b94..8b5f3a1598af 100644
--- a/arch/loongarch/include/asm/syscall.h
+++ b/arch/loongarch/include/asm/syscall.h
@@ -78,7 +78,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
 
 static inline int syscall_get_arch(struct task_struct *task)
 {
+#ifdef CONFIG_64BIT
 	return AUDIT_ARCH_LOONGARCH64;
+#else
+	return AUDIT_ARCH_LOONGARCH32;
+#endif
 }
 
 static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
-- 
2.42.0

