Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E6E1DE4F1
	for <loongarch@lists.linux.dev>; Mon, 28 Apr 2025 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826027; cv=none; b=OnKYnH5XmMmWbHPlmB33EfWyGhOy7rPD2Ys6gmpdW17yih0BfhGYHe7bvMXcUrH5VJ2XwO3wPxLoXLg4sbUgwn4owksSfuVDwe5iOY25pxKzr0v98CDZwFnWpXdfS0WreM8JT4Os4K9BbQVZ7Iuf03ZgyXwQtzx62Awki3N2JU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826027; c=relaxed/simple;
	bh=V5EpiItOzlDSnQKf6oZg8W8MZoLzwDPhROtMAgJ9DEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y+doiM7yA2tZ0n66C2LyVMhk+U3Jeii6nYONMoEXY9u2MqYPSTkfbRAcD3D7Bik8O/vaJR9lMG5b5wHBdRbjbDv2yd00+y6D4aHxTw+czDT6nPunEpjHY5LE9lf0GAP3IEgqjN7G5yhhSKKAIQ34sWuMsZe+SpV6XAvrWkkMBW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.238])
	by gateway (Coremail) with SMTP id _____8CxyuDjMA9obTDIAA--.4282S3;
	Mon, 28 Apr 2025 15:40:19 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.238])
	by front1 (Coremail) with SMTP id qMiowMCxLBvfMA9orvKaAA--.7101S2;
	Mon, 28 Apr 2025 15:40:18 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: Move __arch_cpu_idle() to .cpuidle.text section
Date: Mon, 28 Apr 2025 15:40:02 +0800
Message-ID: <20250428074002.4166499-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxLBvfMA9orvKaAA--.7101S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr1rCry5CF1rWryDZryUCFX_yoW8GF17pF
	WUCwnIgr4DJFyfAayDtw1kur98AwnrG34a9ay5tayfAa1UXF1kXr4vv3yqgFyvg3y8Gr10
	gFWkJ3Z2qFyUA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU

Now arch_cpu_idle() is annotated with __cpuidle which means it is in
the .cpuidle.text section, but __arch_cpu_idle() isn't. Thus, fix the
missing .cpuidle.text section assignment for __arch_cpu_idle() in order
to correct backtracing with nmi_backtrace().

The principle is similar to the commit 97c8580e85cf81c ("MIPS: Annotate
cpu_wait implementations with __cpuidle")

Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/genex.S | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/genex.S b/arch/loongarch/kernel/genex.S
index 4f0912141781..733a7665e434 100644
--- a/arch/loongarch/kernel/genex.S
+++ b/arch/loongarch/kernel/genex.S
@@ -16,6 +16,7 @@
 #include <asm/stackframe.h>
 #include <asm/thread_info.h>
 
+	.section .cpuidle.text, "ax"
 	.align	5
 SYM_FUNC_START(__arch_cpu_idle)
 	/* start of idle interrupt region */
@@ -31,14 +32,16 @@ SYM_FUNC_START(__arch_cpu_idle)
 	 */
 	idle	0
 	/* end of idle interrupt region */
-1:	jr	ra
+idle_exit:
+	jr	ra
 SYM_FUNC_END(__arch_cpu_idle)
+	.previous
 
 SYM_CODE_START(handle_vint)
 	UNWIND_HINT_UNDEFINED
 	BACKUP_T0T1
 	SAVE_ALL
-	la_abs	t1, 1b
+	la_abs	t1, idle_exit
 	LONG_L	t0, sp, PT_ERA
 	/* 3 instructions idle interrupt region */
 	ori	t0, t0, 0b1100
-- 
2.47.1

