Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E4023CD;
	Sun,  6 Aug 2023 10:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1691318184; bh=63Vj0WhE2taVV4Mgftn24397d24b8LwFSAcdGh/Tq2A=;
	h=From:To:Cc:Subject:Date:From;
	b=cVCQqZ22yRnPkiiMQqOPA3Bwbc4XpTdqP3rNvFckYb7TqUBBSlLFI99pIJXtvrTS5
	 xczYZjc382vW5ngo3YxwkcTb1clR+6kdcSjpG8+WeyafSl3Wqo2RJZzwpqalrvGc7C
	 M7u0oBLi0oZ1pW380i49hO8BdJGq/1gkO98xKoQQ=
Received: from ld50.lan (unknown [101.88.28.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 1B0956014B;
	Sun,  6 Aug 2023 18:36:23 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>,
	loongarch@lists.linux.dev,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v3] LoongArch: Replace -ffreestanding with finer-grained -fno-builtin's
Date: Sun,  6 Aug 2023 18:36:20 +0800
Message-Id: <20230806103620.3118683-1-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

As explained by Nick in the original issue: the kernel usually does a
good job of providing library helpers that have similar semantics as
their ordinary userspace libc equivalents, but -ffreestanding disables
such libcall optimization and other related features in the compiler,
which can lead to unexpected things such as CONFIG_FORTIFY_SOURCE not
working (!).

However, due to the desire for better control over unaligned accesses
with respect to CONFIG_ARCH_STRICT_ALIGN, and also for avoiding the
GCC bug https://gcc.gnu.org/PR109465, we do want to still disable
optimizations for the memory libcalls (memcpy, memmove and memset for
now). Use finer-grained -fno-builtin-* toggles to achieve this without
losing source fortification and other libcall optimizations.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1897
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: WANG Xuerui <git@xen0n.name>
---

Changes in v3 (no functional changes):

- Move explanatory words mentioning -ffreestanding from the comments into
  commit message.

Changes in v2:

- Keep the memory operation builtins disabled, add comments, and tweak the
  commit message along the way.

 arch/loongarch/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index b1e5db51b61c..3a0a3b209fc1 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -83,7 +83,7 @@ KBUILD_CFLAGS_KERNEL		+= -fPIE
 LDFLAGS_vmlinux			+= -static -pie --no-dynamic-linker -z notext
 endif
 
-cflags-y += -ffreestanding
+cflags-y += -fno-builtin-memcpy -fno-builtin-memmove -fno-builtin-memset
 cflags-y += $(call cc-option, -mno-check-zero-division)
 
 load-y		= 0x9000000000200000
-- 
2.40.0

