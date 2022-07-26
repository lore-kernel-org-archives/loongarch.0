Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E065815
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 13:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD44C385A2;
	Tue, 26 Jul 2022 13:02:23 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Disable executable stack by default
Date: Tue, 26 Jul 2022 21:02:24 +0800
Message-Id: <20220726130224.3987623-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable executable stack for LoongArch by default, as all modern
architectures do.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/elf.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/include/asm/elf.h b/arch/loongarch/include/asm/elf.h
index f3960b18a90e..5f3ff4781fda 100644
--- a/arch/loongarch/include/asm/elf.h
+++ b/arch/loongarch/include/asm/elf.h
@@ -288,8 +288,6 @@ struct arch_elf_state {
 	.interp_fp_abi = LOONGARCH_ABI_FP_ANY,	\
 }
 
-#define elf_read_implies_exec(ex, exec_stk) (exec_stk == EXSTACK_DEFAULT)
-
 extern int arch_elf_pt_proc(void *ehdr, void *phdr, struct file *elf,
 			    bool is_interp, struct arch_elf_state *state);
 
-- 
2.31.1

