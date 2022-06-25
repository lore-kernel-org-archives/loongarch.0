Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F5717C8
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 09:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC88C341C7;
	Sat, 25 Jun 2022 09:00:59 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Fix the _stext symbol address
Date: Sat, 25 Jun 2022 17:01:50 +0800
Message-Id: <20220625090150.3171909-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_stext means the start of .text section (see __is_kernel_text()), but we
put its definition in .ref.text by mistake. Fix it by defining it at the
head of head.S.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/head.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index e596dfcd924b..d8c625b89c7d 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -12,10 +12,10 @@
 #include <asm/loongarch.h>
 #include <asm/stackframe.h>
 
-	__REF
-
 SYM_ENTRY(_stext, SYM_L_GLOBAL, SYM_A_NONE)
 
+	__REF
+
 SYM_CODE_START(kernel_entry)			# kernel entry point
 
 	/* Config direct window and set PG */
-- 
2.27.0

