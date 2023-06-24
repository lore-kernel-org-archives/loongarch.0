Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2123C3C;
	Sat, 24 Jun 2023 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1687632157; bh=kdNQ2yRcFr3QXcyAJBTxhivt3gO0Oi9ZzFCGa8V1v6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgMY6Ylu1pRlcNNel0Jy0i1lUMQFOXsGwwyT0jGdFr2ySeO3O5tTBG57kruUb4ZTQ
	 RwvaMqXkAJtGy3vrMfV1zV3gC8gLpEo/AX38NrpT5/5C4EqkxBDPUpTyyks6bw8yYu
	 aSh76a9q4XcsHeMpbYDabNEWwK29h4CZ6PFFHniU=
Received: from ld50.lan (unknown [101.88.25.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5D5D9600B5;
	Sun, 25 Jun 2023 02:42:37 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>,
	loongarch@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2 9/9] Makefile: Add loongarch target flag for Clang compilation
Date: Sun, 25 Jun 2023 02:40:55 +0800
Message-Id: <20230624184055.3000636-10-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230624184055.3000636-1-kernel@xen0n.name>
References: <20230624184055.3000636-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

The LoongArch kernel is 64-bit and built with the soft-float ABI,
hence the loongarch64-linux-gnusf target. (The "libc" part doesn't
matter.)

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/Makefile.clang | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 058a4c0f864e..6c23c6af797f 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -4,6 +4,7 @@
 CLANG_TARGET_FLAGS_arm		:= arm-linux-gnueabi
 CLANG_TARGET_FLAGS_arm64	:= aarch64-linux-gnu
 CLANG_TARGET_FLAGS_hexagon	:= hexagon-linux-musl
+CLANG_TARGET_FLAGS_loongarch	:= loongarch64-linux-gnusf
 CLANG_TARGET_FLAGS_m68k		:= m68k-linux-gnu
 CLANG_TARGET_FLAGS_mips		:= mipsel-linux-gnu
 CLANG_TARGET_FLAGS_powerpc	:= powerpc64le-linux-gnu
-- 
2.40.0

