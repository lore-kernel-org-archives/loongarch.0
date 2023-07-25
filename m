Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E0156DD
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 09:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA4AC433C7;
	Tue, 25 Jul 2023 09:55:19 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Only fiddle with CHECKFLAGS if `need-compiler'
Date: Tue, 25 Jul 2023 17:54:51 +0800
Message-Id: <20230725095451.992522-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a port of commit 4fe4a6374c4db9ae2b ("MIPS: Only fiddle with
CHECKFLAGS if `need-compiler'") to LoongArch.

We have originally guarded fiddling with CHECKFLAGS in our arch Makefile
by checking for the CONFIG_LOONGARCH variable, not set for targets such
as `distclean', etc. that neither include `.config' nor use the compiler.

Starting from commit 805b2e1d427aab4 ("kbuild: include Makefile.compiler
only when compiler is needed") we have had a generic `need-compiler'
variable explicitly telling us if the compiler will be used and thus its
capabilities need to be checked and expressed in the form of compilation
flags.  If this variable is not set, then `make' functions such as
`cc-option' are undefined, causing all kinds of weirdness to happen if
we expect specific results to be returned.

It doesn't cause problems on LoongArch now. But as a guard we replace
the check for CONFIG_LOONGARCH with one for `need-compiler' instead, so
as to prevent the compiler from being ever called for CHECKFLAGS when
not needed.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 7811d43ed24a..cb40d36fac20 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -116,7 +116,7 @@ KBUILD_CFLAGS += -isystem $(shell $(CC) -print-file-name=include)
 
 KBUILD_LDFLAGS	+= -m $(ld-emul)
 
-ifdef CONFIG_LOONGARCH
+ifdef need-compiler
 CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
 	grep -E -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
 	sed -e "s/^\#define /-D'/" -e "s/ /'='/" -e "s/$$/'/" -e 's/\$$/&&/g')
-- 
2.39.3

