Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A061F12E9
	for <loongarch@lists.linux.dev>; Tue, 21 Jan 2025 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737459847; cv=none; b=gb/On4nG9q5F7gRERxLPTvCEkzOWNMmYg/gExi4cf2VobM77eN2cmi5isyWBy0e+KIlyTeHiNmZe6XhIgt5FvvksoCflzReXklEQRvfUPu/gahLSeQj/EihJqwoWZOXFnoELTlUSd0h9C+SNfuJCjCbmRjfLczG6eUqkCnZ2mgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737459847; c=relaxed/simple;
	bh=dTxayoMWjAIvJimszc1Z1b3z1DCPMwSHuc1jIXbtPrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=COI26Mqg23suFIi++TEDmEzTXew0MVseGnIPp7pjzyr9Djxyg//9G+FSXC6t7J8/F758d/WFHlivfrt9mjalBauOczJjkkc4FI1nLKpQo8VCqkZ/cS8N8inmZIommUkIyHmSJCLvOi7YDDqAJJy/LZMhGyo8r45rjEeyqtmAoLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8AxbeKDiI9n_MBmAA--.9397S3;
	Tue, 21 Jan 2025 19:44:03 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMCxFOSBiI9nT8wpAA--.21516S2;
	Tue, 21 Jan 2025 19:44:03 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Adjust SETUP_SLEEP and SETUP_WAKEUP
Date: Tue, 21 Jan 2025 19:43:54 +0800
Message-ID: <20250121114354.2727748-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxFOSBiI9nT8wpAA--.21516S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFy3uw1xJrWDCFyDtFyDtwc_yoW8Gry3p3
	9Fkr1qqa109rn7Zrn5t34rXrs8trZ5WF1fuanrK348CwsrXF10gr1kGFnrGF17JayfGayI
	vr4rA3W0vFy7C3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=

SETUP_SLEEP should only save the GPR context, which is symmetric to
SETUP_WAKEUP, so move the acpi_saved_sp handling out of SETUP_SLEEP.

Move "addi.d  sp, sp, PT_SIZE" into SETUP_WAKEUP for the same reason.

No functional changes.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/power/suspend_asm.S | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/power/suspend_asm.S b/arch/loongarch/power/suspend_asm.S
index 9fe28d5a0270..df0865df26fa 100644
--- a/arch/loongarch/power/suspend_asm.S
+++ b/arch/loongarch/power/suspend_asm.S
@@ -30,9 +30,6 @@
 	st.d		$r29, sp, PT_R29
 	st.d		$r30, sp, PT_R30
 	st.d		$r31, sp, PT_R31
-
-	la.pcrel	t0, acpi_saved_sp
-	st.d		sp, t0, 0
 .endm
 
 .macro SETUP_WAKEUP
@@ -51,6 +48,7 @@
 	ld.d		$r29, sp, PT_R29
 	ld.d		$r30, sp, PT_R30
 	ld.d		$r31, sp, PT_R31
+	addi.d		sp, sp, PT_SIZE
 .endm
 
 	.text
@@ -59,6 +57,10 @@
 /* Sleep/wakeup code for Loongson-3 */
 SYM_FUNC_START(loongarch_suspend_enter)
 	SETUP_SLEEP
+
+	la.pcrel	t0, acpi_saved_sp
+	st.d		sp, t0, 0
+
 	bl		__flush_cache_all
 
 	/* Pass RA and SP to BIOS */
@@ -82,7 +84,7 @@ SYM_INNER_LABEL(loongarch_wakeup_start, SYM_L_GLOBAL)
 
 	la.pcrel	t0, acpi_saved_sp
 	ld.d		sp, t0, 0
+
 	SETUP_WAKEUP
-	addi.d		sp, sp, PT_SIZE
 	jr		ra
 SYM_FUNC_END(loongarch_suspend_enter)
-- 
2.47.1

