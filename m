Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B0872633
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 06:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756190358; cv=none; b=ugaEjWRSrXRw+Dvfh67yIMxwnxPRbSC96+E0C806XGpE5hJyyAyRuXv+O4UPRNrKEmJuTOCOTzGp/i0EUUQSHVlz893IuLl+4WQjXNNQhr4VxkRtuALIqjdkDPuGwS4BDWa7bMhxJzhBytH3HwXn4/vAuamru6vVHfSK7mVgcS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756190358; c=relaxed/simple;
	bh=Nyeff2EhlQwRc/1f1YoX6APs/57fqdvKWPi4EOXkD+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UWXGaG8jJ5CBtvUWXJ63Cad4+VKBDsJDr/UrrzSRMHu4qRqwK91Da/ieVIqMV3erH+ffMA2UzXs6kYXAdvP/Z6bAlePsAr7wJae0poE4A3f7+50KiL5FbhLZF06B7N02ZnfpvtrR9hl5DWNY/caB9m+rjo5xCj2DlRHtVZeyJLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx6tGNVq1oo0ADAA--.6215S3;
	Tue, 26 Aug 2025 14:39:10 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxQ+SMVq1oo2dpAA--.401S2;
	Tue, 26 Aug 2025 14:39:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Update help info of config ARCH_STRICT_ALIGN
Date: Tue, 26 Aug 2025 14:39:08 +0800
Message-ID: <20250826063908.6615-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxQ+SMVq1oo2dpAA--.401S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CrWDZryrKFyDtry8Jr43Jwc_yoW8GF13pw
	4YkanrGrW0gr1UCFZ0v3s3WFy5ZasFkF43Ww42y34UCr9xZ343ZrWxtFs3JFW7Cws5G3yr
	WryFk3W2g3WkGacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UUUUU==

Loongson 3A6000 and 3C6000 CPUs also support unaligned memory access, so
the current description is out of date to some extent.

Actually, all of Loongson-3 series processors based on LoongArch support
unaligned memory access, this hardware capability is indicated by the bit
20 of CPUCFG1 register, update the help info to reflect the reality.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index f0abc38c40ac..fcf6575b02f8 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -563,7 +563,8 @@ config ARCH_STRICT_ALIGN
 	  -mstrict-align build parameter to prevent unaligned accesses.
 
 	  CPUs with h/w unaligned access support:
-	  Loongson-2K2000/2K3000/3A5000/3C5000/3D5000.
+	  Loongson-2K2000/2K3000 and all of Loongson-3 series processors
+	  based on LoongArch.
 
 	  CPUs without h/w unaligned access support:
 	  Loongson-2K500/2K1000.
@@ -573,6 +574,9 @@ config ARCH_STRICT_ALIGN
 	  to run kernel only on systems with h/w unaligned access support in
 	  order to optimise for performance.
 
+	  If you want to make sure whether to support unaligned memory access
+	  on your hardware, please read the bit 20 of CPUCFG1 register.
+
 config CPU_HAS_FPU
 	bool
 	default y
-- 
2.42.0

