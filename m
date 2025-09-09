Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0E22D3A65
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410034; cv=none; b=SVHNi73/419Da3okgFG1HzXasbUSPVsV300qWcNh1uP5dUkaBi7EdUryN+78ibcGe87z4Dw49xk8XiqI9JhgyzfPQwIsWyvwZ3ExL8q7/A1QUOyn7xyrOfsSn7bOa3HZ03bN+V0wR410CSEII3WdpQkeO5r5Lp7e+pS9gqfr5NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410034; c=relaxed/simple;
	bh=XDP0wG8oJcBD8iSHmUgaU/ixC9iP7cOFsK+EMA7pI/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pr1OFYMaepSzqlsbMVMONqkzlTyiY/MdHKstPjJfDKyDk+8bRFaOOqooeYMcP7mNq//2wXdmftbKt7SlhrtpS4vzePGggFbGc2PJPd63s2figoRybkql/uXdnf1apy2WDB2krWXZ6+1CF/i2ITguEvoQ8nL77OOQe69BJsnfi1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxSNHu8r9onk8IAA--.17836S3;
	Tue, 09 Sep 2025 17:27:10 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxbMHr8r9oeuSJAA--.56108S3;
	Tue, 09 Sep 2025 17:27:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>,
	rust-for-linux@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] LoongArch: Make LTO case independent in Makefile
Date: Tue,  9 Sep 2025 17:27:06 +0800
Message-ID: <20250909092707.3127-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250909092707.3127-1-yangtiezhu@loongson.cn>
References: <20250909092707.3127-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxbMHr8r9oeuSJAA--.56108S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFyDXrW8ur45AF17Jw4fJFc_yoW8XryDpw
	sa9rZYqr4rWr4vgr9rJay5WrnxtFZrtr1xWFWxK3W8AF47Xw17Xr48tFyDXFyDJ3s3JrWI
	qrWfKr9xJF4UC3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcDDGUUUUU

LTO is not only used for Clang, it maybe used for Rust, make LTO case out
of CONFIG_CC_HAS_ANNOTATE_TABLEJUMP in Makefile.

This is preparation for later patch, no function changes.

Suggested-by: WANG Rui <wangrui@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index a3a9759414f4..9d80af7f75c8 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -102,16 +102,16 @@ KBUILD_CFLAGS			+= $(call cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)
 
 ifdef CONFIG_OBJTOOL
 ifdef CONFIG_CC_HAS_ANNOTATE_TABLEJUMP
+KBUILD_CFLAGS			+= -mannotate-tablejump
+else
+KBUILD_CFLAGS			+= -fno-jump-tables # keep compatibility with older compilers
+endif
+ifdef CONFIG_LTO_CLANG
 # The annotate-tablejump option can not be passed to LLVM backend when LTO is enabled.
 # Ensure it is aware of linker with LTO, '--loongarch-annotate-tablejump' also needs to
 # be passed via '-mllvm' to ld.lld.
-KBUILD_CFLAGS			+= -mannotate-tablejump
-ifdef CONFIG_LTO_CLANG
 KBUILD_LDFLAGS			+= -mllvm --loongarch-annotate-tablejump
 endif
-else
-KBUILD_CFLAGS			+= -fno-jump-tables # keep compatibility with older compilers
-endif
 endif
 
 KBUILD_RUSTFLAGS		+= --target=loongarch64-unknown-none-softfloat -Ccode-model=small
-- 
2.42.0

