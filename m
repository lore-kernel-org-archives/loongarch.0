Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7319E1A9F90
	for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632517; cv=none; b=BS+DgltQaqmC+8URFx/TYhj68WfqCw6xxH1fskTY3iXMdR5OVAF9K1eJcFV1re8LDdi4PzuwsFu9uETU2U2u90cxvk+9Ttjr+MQAghUAqdgjijBm5RmitdkvjJFUoXApzUCWgn+xIXjUgaBAPKzwKvNUix98o6gcdymYSXQZLZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632517; c=relaxed/simple;
	bh=u2Zu3SbYsOko4xCdftQZw0rrh7SK+R8rMwwDRCnoEso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GA1QyJdqXLlWONjdKW2QethViMMPwrNC8XQAi8V+LfDaAZlSxXyb+nLrzqvJNh/Yez0gqjD9biFiCSspc1GgySKjZnBlTvgjeuWIbYi+6CHebvFh63lsnAieZ77azhVu2JRxqtnt7Zkn6ug4dk7LqqfBdLQs7u9pbZ/sVoaIlY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8DxvdI5mtJo2KkNAA--.29008S3;
	Tue, 23 Sep 2025 21:01:45 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowJDxK8EtmtJoyiGoAA--.9124S2;
	Tue, 23 Sep 2025 21:01:45 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Nathan Chancellor <nathan@kernel.org>,
	WANG Rui <wangrui@loongson.cn>
Subject: [PATCH] LoongArch: Fix build error for LTO with LLVM-18
Date: Tue, 23 Sep 2025 21:01:22 +0800
Message-ID: <20250923130122.2321771-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxK8EtmtJoyiGoAA--.9124S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CryUGFW5KFyUKFyxWr4xZrc_yoW8Xr15p3
	9xCF90qrs5Gr4kK3s3JrWagrn5trsFya12gF1Sk3W8AFs5Xw4UXw18XF9rWFy8uws8JryI
	qryrK345JFZ5G3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

Commit b15212824a01 ("LoongArch: Make LTO case independent in Makefile")
moves "KBUILD_LDFLAGS += -mllvm --loongarch-annotate-tablejump" out of
CONFIG_CC_HAS_ANNOTATE_TABLEJUMP, which breaks the build for LLVM-18, as
'--loongarch-annotate-tablejump' is unimplemented there:

ld.lld: error: -mllvm: ld.lld: Unknown command line argument '--loongarch-annotate-tablejump'.

Call ld-option to detect '--loongarch-annotate-tablejump' before use, so
as to fix the build error.

Fixes: b15212824a01 ("LoongArch: Make LTO case independent in Makefile")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: WANG Rui <wangrui@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index ae419e32f22e..fcfa793f9bb0 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -115,7 +115,7 @@ ifdef CONFIG_LTO_CLANG
 # The annotate-tablejump option can not be passed to LLVM backend when LTO is enabled.
 # Ensure it is aware of linker with LTO, '--loongarch-annotate-tablejump' also needs to
 # be passed via '-mllvm' to ld.lld.
-KBUILD_LDFLAGS			+= -mllvm --loongarch-annotate-tablejump
+KBUILD_LDFLAGS			+= $(call ld-option,-mllvm --loongarch-annotate-tablejump)
 endif
 endif
 
-- 
2.47.3

