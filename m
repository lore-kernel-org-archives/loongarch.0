Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C91645
	for <loongarch@lists.linux.dev>; Tue, 27 Sep 2022 04:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC55DC433D6;
	Tue, 27 Sep 2022 04:58:31 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Align the address of kernel_entry to 4KB
Date: Tue, 27 Sep 2022 12:57:20 +0800
Message-Id: <20220927045720.2767521-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the address of kernel_entry to 4KB, to avoid early tlb miss
exception in case the entry code crosses page boundary.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index 8f89f39fd31b..7e57ae8741b1 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -34,6 +34,8 @@ SYM_DATA(kernel_offset, .long kernel_offset - _text);
 
 	__REF
 
+	.align 12
+
 SYM_CODE_START(kernel_entry)			# kernel entry point
 
 	/* Config direct window and set PG */
-- 
2.31.1

