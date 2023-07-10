Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E491FB4
	for <loongarch@lists.linux.dev>; Mon, 10 Jul 2023 04:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9FFC433C9;
	Mon, 10 Jul 2023 04:29:49 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Fix module relocation error with binutils 2.41
Date: Mon, 10 Jul 2023 12:29:23 +0800
Message-Id: <20230710042924.2518198-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Binutils 2.41 enable linker relaxation by default, but kernel module
loader doesn't support that, so disable it. Otherwise we get such an
error when loading modules: "Unknown relocation type 102".

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 09ba338a64de..7466d3b15db8 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -68,6 +68,8 @@ LDFLAGS_vmlinux			+= -static -n -nostdlib
 ifdef CONFIG_AS_HAS_EXPLICIT_RELOCS
 cflags-y			+= $(call cc-option,-mexplicit-relocs)
 KBUILD_CFLAGS_KERNEL		+= $(call cc-option,-mdirect-extern-access)
+KBUILD_AFLAGS_MODULE		+= $(call cc-option,-mno-relax) $(call cc-option,-Wa$(comma)-mno-relax)
+KBUILD_CFLAGS_MODULE		+= $(call cc-option,-mno-relax) $(call cc-option,-Wa$(comma)-mno-relax)
 else
 cflags-y			+= $(call cc-option,-mno-explicit-relocs)
 KBUILD_AFLAGS_KERNEL		+= -Wa,-mla-global-with-pcrel
-- 
2.39.3

