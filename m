Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EA07C
	for <loongarch@lists.linux.dev>; Sat, 27 Aug 2022 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1661622967;
	bh=Sdq8ZYzZnQy9EkfcHVFGSRWK5K9Fxb6STtdvVoeRLVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bx4hV/1JE610b4hy3t4uBhWviGK5RvpFq0TDgBU1GpYBbKdW47Cr4LLG+GQ0F7gfM
	 5yJrHWLNqmOqaCWcum4AlFmx7+JEH3lNCenibWqDPfP7KNuxNUtXVwb5rwSKfI9DuI
	 +B6CjvkJyISd1UThnrIMUcJbu7gxtFeX01yI4AfA=
Received: from xry111-x57s1.. (unknown [IPv6:240e:358:1157:dc00:dc73:854d:832e:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 6F31166803;
	Sat, 27 Aug 2022 13:56:01 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	WANG Xuerui <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>,
	Youling Tang <tangyouling@loongson.cn>,
	Jinyang He <hejinyang@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH 6/8] LoongArch: Use model("extreme") attribute for per-CPU variables in module if CONFIG_CC_HAS_EXPLICIT_RELOCS
Date: Sun, 28 Aug 2022 01:54:34 +0800
Message-Id: <20220827175436.156464-7-xry111@xry111.site>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220827175436.156464-1-xry111@xry111.site>
References: <20220827175436.156464-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On LoongArch, The "address" of a per-CPU variable symbol is actually an
offset from $r21.  The value is nearing the loading address of main
kernel image, but far from the address of modules.  We need to tell the
compiler that a PC-relative addressing with 32-bit offset is not
sufficient for local per-CPU variables.

After some discussion with GCC maintainers, we implemented this
attribute to indicate that a PC-relative addressing with 64-bit offset
should be used.

This attribute should be available in GCC 13 release.  Some early GCC 13
snapshots may support -mexplicit-relocs but lack this attribute, we
simply reject them.

Link: https://gcc.gnu.org/r13-2199
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/loongarch/include/asm/percpu.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/loongarch/include/asm/percpu.h b/arch/loongarch/include/asm/percpu.h
index 0bd6b0110198..91d4026b074e 100644
--- a/arch/loongarch/include/asm/percpu.h
+++ b/arch/loongarch/include/asm/percpu.h
@@ -8,6 +8,19 @@
 #include <asm/cmpxchg.h>
 #include <asm/loongarch.h>
 
+#if defined(MODULE) && defined(CONFIG_CC_HAS_EXPLICIT_RELOCS)
+# if __has_attribute(model)
+/* The "address" (in fact, offset from $r21) of a per-CPU variable is close
+ * to the load address of main kernel image, but far from where the modules are
+ * loaded.  Tell the compiler this fact.
+ */
+#  define PER_CPU_ATTRIBUTES __attribute__((model("extreme")))
+# else /* __has_attribute(model) */
+/* This should only happen with early GCC 13 snapshots. */
+#  error "Compiler with explicit relocs but no model attribute is not supported"
+# endif /* __has_attribute(model) */
+#endif
+
 /* Use r21 for fast access */
 register unsigned long __my_cpu_offset __asm__("$r21");
 
-- 
2.37.0

