Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ACB7E
	for <loongarch@lists.linux.dev>; Mon, 10 Oct 2022 11:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4706FC433C1;
	Mon, 10 Oct 2022 11:57:56 +0000 (UTC)
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
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Mark __xchg() and __cmpxchg() as __always_inline
Date: Mon, 10 Oct 2022 19:56:20 +0800
Message-Id: <20221010115620.779812-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING
forcibly") allows compiler to uninline functions marked as 'inline'.
In case of __xchg()/__cmpxchg() this would cause to reference
BUILD_BUG(), which is an error case for catching bugs and will not
happen for correct code, if __xchg()/__cmpxchg() is inlined.

This bug can be produced with CONFIG_DEBUG_SECTION_MISMATCH enabled,
and the solution is similar to below commits:
46f1619500d0225 ("MIPS: include: Mark __xchg as __always_inline"),
88356d09904bc60 ("MIPS: include: Mark __cmpxchg as __always_inline").

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/cmpxchg.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
index ae19e33c7754..ecfa6cf79806 100644
--- a/arch/loongarch/include/asm/cmpxchg.h
+++ b/arch/loongarch/include/asm/cmpxchg.h
@@ -61,8 +61,8 @@ static inline unsigned int __xchg_small(volatile void *ptr, unsigned int val,
 	return (old32 & mask) >> shift;
 }
 
-static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
-				   int size)
+static __always_inline unsigned long
+__xchg(volatile void *ptr, unsigned long x, int size)
 {
 	switch (size) {
 	case 1:
@@ -159,8 +159,8 @@ static inline unsigned int __cmpxchg_small(volatile void *ptr, unsigned int old,
 	return (old32 & mask) >> shift;
 }
 
-static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
-				      unsigned long new, unsigned int size)
+static __always_inline unsigned long
+__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, unsigned int size)
 {
 	switch (size) {
 	case 1:
-- 
2.31.1

