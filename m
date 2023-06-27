Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3919D171C5;
	Tue, 27 Jun 2023 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1687870893; bh=Ooj9bvYQGjGgA7KkojQxY/KTQ6hTo/rmmadUHjRE+uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AmLbxfGZ3u2GhlsdZnn1SM+SQrqkxIB2z42P1lhAE+b2yQrHF1d362KAlDBiTMAF3
	 d/wUQhDCG9pm+NTdaRBkPv8golHXpFdIG17uSmYig/F8RBpJhDtIfLTMOGANskVhOM
	 U3rcyxkUjplvEwp5hrnVWBPjWRVP/eIEz4I2YEg4=
Received: from ld50.lan (unknown [101.88.25.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3C8E96017D;
	Tue, 27 Jun 2023 21:01:33 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>,
	Nathan Chancellor <nathan@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>,
	loongarch@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 1/2] LoongArch: vDSO: Use CLANG_FLAGS instead of filtering out '--target='
Date: Tue, 27 Jun 2023 21:01:21 +0800
Message-Id: <20230627130122.1491765-2-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230627130122.1491765-1-kernel@xen0n.name>
References: <20230627130122.1491765-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

This is a port of commit 76d7fff22be3e ("MIPS: VDSO: Use CLANG_FLAGS
instead of filtering out '--target='") to arch/loongarch, for fixing
cross-compilation with Clang.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Link: https://github.com/ClangBuiltLinux/linux/issues/1787#issuecomment-1608306002
Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/vdso/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index 3f9df4d9930f..a50308b6fc25 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -12,12 +12,9 @@ ccflags-vdso := \
 	$(filter -E%,$(KBUILD_CFLAGS)) \
 	$(filter -march=%,$(KBUILD_CFLAGS)) \
 	$(filter -m%-float,$(KBUILD_CFLAGS)) \
+	$(CLANG_FLAGS) \
 	-D__VDSO__
 
-ifeq ($(cc-name),clang)
-ccflags-vdso += $(filter --target=%,$(KBUILD_CFLAGS))
-endif
-
 cflags-vdso := $(ccflags-vdso) \
 	-isystem $(shell $(CC) -print-file-name=include) \
 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
-- 
2.40.0

