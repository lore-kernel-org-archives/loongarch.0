Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5928B242D97
	for <loongarch@lists.linux.dev>; Sat, 11 Apr 2026 02:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775873146; cv=none; b=tgfkodaU1LRfb5dQF68zIYKoswemmBTVOmXndwCv0cEdwKpQ6mV56H+syw5fwza/F0s2WlfXr5VLkdqpP2zWZ94/B1+5nfuv4yYReeFV4kl61rmGoqlEuz34bTfjuaCQU+5ghePSmgqd0ZMzYGE2xHmYHpxtUh40BGugjjIBMJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775873146; c=relaxed/simple;
	bh=A8T+0KyOzB5wMeVORzGGrHba9n+in8xjS4BOAhubVXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bg9T/5yd5r4fk22kc1nRgYtcmTAJyGy4kYDjCQuGyoWsZ+ts7+fEFSRQdQn3+fKNn6NFtBBlYrKCiH9dPeNmnv4arItvilwsHd6e/PrThIXdbsgCGoqF5LZWMiEPKAsG1MGmy2+rsbMQ7JOydG44h3fsDciFVKwmMJV1L4HtjIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8BxcfBurNlpKzYkAA--.34884S3;
	Sat, 11 Apr 2026 10:05:34 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJDxhcBprNlpZ8FqAA--.37055S2;
	Sat, 11 Apr 2026 10:05:32 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH V2] LoongArch: Show CPU vulnerabilites correctly
Date: Sat, 11 Apr 2026 10:05:22 +0800
Message-ID: <20260411020522.2779250-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxhcBprNlpZ8FqAA--.37055S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr15JF1kZr1DCr1xAF4fZwc_yoW8WrWkpF
	Wqywn5Xr4rCF1DtasFvF129ryDX3WkGw13Wa4akFykAF12vr1DXr1v93yDXF1jvw47KayF
	gF98G3s3KFW7Z3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=

Most LoongArch processors are vulnerable to Spectre-V1 Proof-of-Concept
(PoC). And the generic mechanism, __user pointer sanitization, can be
used as a mitigation. This means to use array_index_nospec() to prevent
out of boundry access in syscall and other critical paths.

Implement the arch-specific cpu_show_spectre_v1() to show CPU Spectre-V1
vulnerabilites correctly.

Cc: stable@vger.kernel.org
Link: https://cc-sw.com/chinese-loongarch-architecture-evaluation-part-3-of-3/
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V2: Fix build warnings.

 arch/loongarch/kernel/cpu-probe.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 8654a1eff834..c8947c798195 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -402,3 +402,9 @@ void cpu_probe(void)
 
 	cpu_report();
 }
+
+ssize_t cpu_show_spectre_v1(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "Mitigation: __user pointer sanitization\n");
+}
-- 
2.52.0

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index c8947c798195..52f36ef19897 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -7,6 +7,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/ptrace.h>
+#include <linux/cpu.h>
 #include <linux/smp.h>
 #include <linux/stddef.h>
 #include <linux/export.h>

