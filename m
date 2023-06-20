Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2A08829
	for <loongarch@lists.linux.dev>; Tue, 20 Jun 2023 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1687249754;
	bh=ws2mVaKpjnU8ybLqDA7SxP6lWwW5L1Aqe3T5RaUjTYQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Z6JSPufcZ6m8j/Fd9aDDBU0tesdF6Mm7fT44oxzhQLpCljPsXLXxknbKyN7Bw0IdO
	 77YqNlOrewxG+vhAHEVEEEBIPPGUNgxDy4X6WO9hD0wV755EAllpPnJB+0qR29/3Ko
	 I/l1XgCQSbyUvE2MCPBFG6UeXgMN67BAKqkzYYBs=
Received: from stargazer.. (unknown [113.140.11.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 6BA9B66426;
	Tue, 20 Jun 2023 04:29:12 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH] Documentation/features: LoongArch supports ARCH_HAS_ELF_RANDOMIZE
Date: Tue, 20 Jun 2023 16:28:37 +0800
Message-ID: <20230620082837.10006-1-xry111@xry111.site>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LoongArch selects ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT, and the latter
selects ARCH_HAS_ELF_RANDOMIZE.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 Documentation/features/vm/ELF-ASLR/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/vm/ELF-ASLR/arch-support.txt b/Documentation/features/vm/ELF-ASLR/arch-support.txt
index 15164f36f224..21f3bbef5ef0 100644
--- a/Documentation/features/vm/ELF-ASLR/arch-support.txt
+++ b/Documentation/features/vm/ELF-ASLR/arch-support.txt
@@ -13,7 +13,7 @@
     |        csky: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
-    |   loongarch: | TODO |
+    |   loongarch: |  ok  |
     |        m68k: | TODO |
     |  microblaze: | TODO |
     |        mips: |  ok  |
-- 
2.41.0

