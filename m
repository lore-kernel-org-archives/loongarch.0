Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4510E7E9
	for <loongarch@lists.linux.dev>; Thu,  6 Apr 2023 02:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A1BC433EF;
	Thu,  6 Apr 2023 02:50:58 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org,
	Chong Qiao <qiaochong@loongson.cn>
Subject: [PATCH] LoongArch: module: set section addresses to 0x0
Date: Thu,  6 Apr 2023 10:50:36 +0800
Message-Id: <20230406025036.3022894-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These got*, plt* and .text.ftrace_trampoline sections specified for
LoongArch have non-zero addressses. Non-zero section addresses in a
relocatable ELF would confuse GDB when it tries to compute the section
offsets and it ends up printing wrong symbol addresses. Therefore, set
them to zero, which mirrors the change in commit 5d8591bc0fbaeb6ded
("arm64 module: set plt* section addresses to 0x0").

Cc: stable@vger.kernel.org
Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/module.lds.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/module.lds.h b/arch/loongarch/include/asm/module.lds.h
index 438f09d4ccf4..88554f92e010 100644
--- a/arch/loongarch/include/asm/module.lds.h
+++ b/arch/loongarch/include/asm/module.lds.h
@@ -2,8 +2,8 @@
 /* Copyright (C) 2020-2022 Loongson Technology Corporation Limited */
 SECTIONS {
 	. = ALIGN(4);
-	.got : { BYTE(0) }
-	.plt : { BYTE(0) }
-	.plt.idx : { BYTE(0) }
-	.ftrace_trampoline : { BYTE(0) }
+	.got 0 : { BYTE(0) }
+	.plt 0 : { BYTE(0) }
+	.plt.idx 0 : { BYTE(0) }
+	.ftrace_trampoline 0 : { BYTE(0) }
 }
-- 
2.39.1

