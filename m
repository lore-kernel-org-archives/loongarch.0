Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1499110EA
	for <loongarch@lists.linux.dev>; Tue, 18 Jul 2023 06:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D226C433C9;
	Tue, 18 Jul 2023 06:48:40 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Cleanup __builtin_constant_p() checking for cpu_has_*
Date: Tue, 18 Jul 2023 14:48:19 +0800
Message-Id: <20230718064819.2549052-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In current configuration, cpu_has_lsx and cpu_has_lasx are impossible
constants. So cleanup the __builtin_constant_p() checking to reduce the
complexity.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/fpu.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
index e4193d637f66..f02f4a0d0d64 100644
--- a/arch/loongarch/include/asm/fpu.h
+++ b/arch/loongarch/include/asm/fpu.h
@@ -218,12 +218,7 @@ static inline void restore_lsx(struct task_struct *t)
 
 static inline void init_lsx_upper(void)
 {
-	/*
-	 * Check cpu_has_lsx only if it's a constant. This will allow the
-	 * compiler to optimise out code for CPUs without LSX without adding
-	 * an extra redundant check for CPUs with LSX.
-	 */
-	if (__builtin_constant_p(cpu_has_lsx) && !cpu_has_lsx)
+	if (!cpu_has_lsx)
 		return;
 
 	_init_lsx_upper();
@@ -294,7 +289,7 @@ static inline void restore_lasx_upper(struct task_struct *t) {}
 
 static inline int thread_lsx_context_live(void)
 {
-	if (__builtin_constant_p(cpu_has_lsx) && !cpu_has_lsx)
+	if (!cpu_has_lsx)
 		return 0;
 
 	return test_thread_flag(TIF_LSX_CTX_LIVE);
@@ -302,7 +297,7 @@ static inline int thread_lsx_context_live(void)
 
 static inline int thread_lasx_context_live(void)
 {
-	if (__builtin_constant_p(cpu_has_lasx) && !cpu_has_lasx)
+	if (!cpu_has_lasx)
 		return 0;
 
 	return test_thread_flag(TIF_LASX_CTX_LIVE);
-- 
2.39.3

