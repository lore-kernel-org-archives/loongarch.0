Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD4225EF9C
	for <loongarch@lists.linux.dev>; Thu, 15 Jan 2026 06:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459014; cv=none; b=llwqWG17nJs6AxWBm26EiXxZg9ET11RQKYvYa4OerQ9jHJiljb2pSrpsN9J4t2F0taydsw1Y8QPGS3eml4iOgyD3dJV2O1v1psTvrAK9rs+yHxY9/YmkYLSdqDNgobj1+vO6yZGHeMDNi9KQnBrgKDdQnyaZdYGhtEiwL+tXHoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459014; c=relaxed/simple;
	bh=w2ye8ewOpcP/PecDlQ5rGJOlR1v3Ejj5LFgqwLaGt4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iek8K4ddHi3kxy4zsjwKrQ4eZcrzf907GpFsS8U7G5LP13lCDu+GMlZnw/RGZ8LYwJ3unvz+yWFhQ1lr8L2pUMtIWSDK1oLpNUm96athm/2oUqJWThWg8S1mRGzQIbS2bEvrTgAGRcMhhr2kBCoB3a/rpzkVGhYZuf+QnoJm6yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8DxAfEAi2hpTxMJAA--.29791S3;
	Thu, 15 Jan 2026 14:36:48 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJDxxsD5imhp7+YeAA--.3541S2;
	Thu, 15 Jan 2026 14:36:47 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Remove redundant code in head.S
Date: Thu, 15 Jan 2026 14:36:33 +0800
Message-ID: <20260115063633.1388470-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxxsD5imhp7+YeAA--.3541S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XFW3GFy8Kw43Ar4kJr43urX_yoWDArc_JF
	W7Kw48Ww4kAanrCrZ0qr93Gr1UZw409F90y3W0qFWDt3sxZF4Yqr4Iyw1rZF90gFWDGrsx
	ArW3KFZxCr1jyosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU

SETUP_MODES already setup the initial values of CSR.CRMD, CSR.PRMD and
CSR.EUEN, so the redundant open code can be removed.

Fixes: 7b2afeafaf9c2d5 ("LoongArch: Adjust boot & setup for 32BIT/64BIT")
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/head.S | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index 7f288e89573b..4eed7bc312a8 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -126,14 +126,6 @@ SYM_CODE_START(smpboot_entry)
 	LONG_LI		t1, CSR_STFILL
 	csrxchg		t0, t1, LOONGARCH_CSR_IMPCTL1
 #endif
-	/* Enable PG */
-	li.w		t0, 0xb0		# PLV=0, IE=0, PG=1
-	csrwr		t0, LOONGARCH_CSR_CRMD
-	li.w		t0, 0x04		# PLV=0, PIE=1, PWE=0
-	csrwr		t0, LOONGARCH_CSR_PRMD
-	li.w		t0, 0x00		# FPE=0, SXE=0, ASXE=0, BTE=0
-	csrwr		t0, LOONGARCH_CSR_EUEN
-
 	la.pcrel	t0, cpuboot_data
 	ld.d		sp, t0, CPU_BOOT_STACK
 	ld.d		tp, t0, CPU_BOOT_TINFO
-- 
2.47.3

