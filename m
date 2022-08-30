Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2BA7C
	for <loongarch@lists.linux.dev>; Tue, 30 Aug 2022 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1661856582;
	bh=owF+FNmRrMbe7xv+RTni/1sE0a+t4GDngroii48Nl7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OiWgWF3MgWggip5qig6Op1VTJTGCXcxDMKe9WiCTOV7l+lPKcFMiglAeT2CpRBTHb
	 pkZ1rWD4jNIzA7wEI47T0eFvtYabNZRt7KcV9BzWkw5tc6/2C3o7RIloZsq2YRauQ3
	 DskjLaOcNmmSyVa+kmbmjjXYq5OTKXO7xzwCA/MY=
Received: from xry111-x57s1.. (unknown [IPv6:240e:358:11dd:1900:dc73:854d:832e:5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id B343C66016;
	Tue, 30 Aug 2022 06:49:35 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	WANG Xuerui <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>,
	Youling Tang <tangyouling@loongson.cn>,
	Jinyang He <hejinyang@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v7 1/5] LoongArch: Add CONFIG_AS_HAS_EXPLICIT_RELOCS
Date: Tue, 30 Aug 2022 18:48:02 +0800
Message-Id: <20220830104806.128365-2-xry111@xry111.site>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830104806.128365-1-xry111@xry111.site>
References: <20220830104806.128365-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GNU as >= 2.40 and GCC >= 13 will support using explicit relocation
hints in the assembly code, instead of la.* macros.  The usage of
explicit relocation hints can improve code generation so it's enabled
by default by GCC >= 13.

Introduce CONFIG_AS_HAS_EXPLICIT_RELOCS as the switch for
"use explicit relocation hints or not."

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/loongarch/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d3ce96a1a744..0721b4b2207a 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -204,6 +204,9 @@ config SCHED_OMIT_FRAME_POINTER
 	bool
 	default y
 
+config AS_HAS_EXPLICIT_RELOCS
+	def_bool $(as-instr,x:pcalau12i \$t0$(comma)%pc_hi20(x))
+
 menu "Kernel type and options"
 
 source "kernel/Kconfig.hz"
-- 
2.37.0

