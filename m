Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26233A5E87
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 08:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450023; cv=none; b=kHLwRm7ZMabvuolUuIMRtg+0CRiFxwj5S8u3De00HIVUy/ldEDbce0JOshG8AKmOkCDjpB9ZetjHIFMMgv21+xwjG/3B4FnaMQn7JVWTEY2/ShH/LaBJKfIiKsIlccxtk8ZCuLyiYzODK6PAvrHz3XjPVnk2l/2CqygXEr9ykkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450023; c=relaxed/simple;
	bh=7YF+lDBamvqbz3kcDUw12iz+lbUM18kDStsGLO7TGko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kkMz/cKzTnv74ofpmEz8jcpILVN/vkzKWjCr1wmt2pfY30cB8i4aSlTDyZJq1cbEmHpCg+s6nye5+0N7NvdQi5Mi7yHURo4sMBeRs4CUkk/6j/UKevLV+cDLUCKNtRrT5RZpcufTbv5qHtV2d8gYcb22DpFaTapUPk7PYPNyX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.8])
	by gateway (Coremail) with SMTP id _____8CxRegivPFpQxAFAA--.11129S3;
	Wed, 29 Apr 2026 16:06:58 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.8])
	by front1 (Coremail) with SMTP id qMiowJBxxuIcvPFp3yx3AA--.53647S2;
	Wed, 29 Apr 2026 16:06:58 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH] LoongArch: Fix SYM_SIGFUNC_START definition for 32BIT
Date: Wed, 29 Apr 2026 16:06:44 +0800
Message-ID: <20260429080644.2425166-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxxuIcvPFp3yx3AA--.53647S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtF47Jw1kuFy8tw1kWFWrXrc_yoWfuwb_X3
	WxJw4ku3ykXFW7CwnIvFyrA3WYv3WrAFnIkr1kXr17Zas0vw15Gr1kAw13ArWjk39rGF4f
	ZFW8t3s8Ary2yosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2nYFDUUUU

The SYM_SIGFUNC_START definition should match sigcontext that the length
of GPRs are 8 bytes for both 32BIT and 64BIT. So replace SZREG with 8 to
fix it.

Cc: stable@vger.kernel.org
Fixes: e4878c37f6679fde ("LoongArch: vDSO: Emit GNU_EH_FRAME correctly")
Suggested-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/linkage.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/linkage.h b/arch/loongarch/include/asm/linkage.h
index a1bd6a3ee03a..ae937d1708b2 100644
--- a/arch/loongarch/include/asm/linkage.h
+++ b/arch/loongarch/include/asm/linkage.h
@@ -69,7 +69,7 @@
 		  9,  10, 11, 12, 13, 14, 15, 16,	\
 		  17, 18, 19, 20, 21, 22, 23, 24,	\
 		  25, 26, 27, 28, 29, 30, 31;		\
-	.cfi_offset \num, SC_REGS + \num * SZREG;	\
+	.cfi_offset \num, SC_REGS + \num * 8;		\
 	.endr;						\
 							\
 	nop;						\
-- 
2.52.0

