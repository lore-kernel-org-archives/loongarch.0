Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAAD2BAF9
	for <loongarch@lists.linux.dev>; Sat,  8 Mar 2025 05:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412303; cv=none; b=YVQf2Ye9CdGVUgLvBWtZ06YBoLXxOtBf+8cQqJ++q0AL0rvIR+ysmiiUQQj1SUztxJ6CkVhVf0XtqXucN85dKrl6jvhLNwMBPTENSiQVHuSgeDHlbdhWdSa3pL0X7L1zE5KKN+F4zfXqP31BTI1trAZC3yfqxvc187cH7UXbsOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412303; c=relaxed/simple;
	bh=YFAZgufb3emHD29pGSeY13qd+z0iS1KWRUTYdjfaGDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NQFPO4v1nUvusI9Ql5LGnOuim04hb9GkF/tdIjv1hxMTvo/9FWwnusbt0lh0YDhPZPNttDtRK+5/ldceVm+PD8YBc742U79Sd6aoV8AOar3hjqpakSeG6EnlsHl8htQRkcWMjPeZYjtBPBFZXPmcO9jUQ+oY/BHmOpYVU38BWNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.156])
	by gateway (Coremail) with SMTP id _____8BxlmnD18tnQL+OAA--.46996S3;
	Sat, 08 Mar 2025 13:38:11 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.156])
	by front1 (Coremail) with SMTP id qMiowMBxWsS918tn2rg9AA--.14474S2;
	Sat, 08 Mar 2025 13:38:09 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 6.12/6.13] loongarch: Use ASM_REACHABLE
Date: Sat,  8 Mar 2025 13:37:53 +0800
Message-ID: <20250308053753.3632741-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxWsS918tn2rg9AA--.14474S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uF1UCr4kuFW5KFWDJFykCrX_yoW8Zw18pa
	n7AFn8KFs5GryktwnFyr1F9F12qr4fCw47Ww18Wry0vayUZwnYqrsYqrsxZFyrGa92gryU
	XFWfWwnaqFy5G3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

From: Peter Zijlstra <peterz@infradead.org>

commit 624bde3465f660e54a7cd4c1efc3e536349fead5 upstream.

annotate_reachable() is unreliable since the compiler is free to place
random code inbetween two consecutive asm() statements.

This removes the last and only annotate_reachable() user.

Backport to solve a build error since relevant commits have already been
backported.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
Link: https://lore.kernel.org/r/20241128094312.133437051@infradead.org
Closes: https://lore.kernel.org/loongarch/20250307214943.372210-1-ojeda@kernel.org/
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/bug.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index 08388876ade4..561ac1bf79e2 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -4,6 +4,7 @@
 
 #include <asm/break.h>
 #include <linux/stringify.h>
+#include <linux/objtool.h>
 
 #ifndef CONFIG_DEBUG_BUGVERBOSE
 #define _BUGVERBOSE_LOCATION(file, line)
@@ -33,25 +34,25 @@
 
 #define ASM_BUG_FLAGS(flags)					\
 	__BUG_ENTRY(flags)					\
-	break		BRK_BUG
+	break		BRK_BUG;
 
 #define ASM_BUG()	ASM_BUG_FLAGS(0)
 
-#define __BUG_FLAGS(flags)					\
-	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags)));
+#define __BUG_FLAGS(flags, extra)					\
+	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags))		\
+			     extra);
 
 #define __WARN_FLAGS(flags)					\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags));			\
-	annotate_reachable();					\
+	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ASM_REACHABLE);	\
 	instrumentation_end();					\
 } while (0)
 
 #define BUG()							\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(0);						\
+	__BUG_FLAGS(0, "");					\
 	unreachable();						\
 } while (0)
 
-- 
2.47.1

