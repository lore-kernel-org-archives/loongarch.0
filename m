Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378E12309AF;
	Tue, 14 Jan 2025 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736835387; cv=none; b=W+rlmD+R2wlhEnkgL138p+fpA7MSfuuB2y0GZRzeL+BjKm2qIdYsbJEF/94XZZvb6U+SezHie6yIssHYeQjpB8w04TEe+GdEklEBV2SXHpgB9WKupPygwsbUB9SJMvD4B1QAZ0v9kz30j0mot1swHhtYJ09NmErKuF7lP0+isO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736835387; c=relaxed/simple;
	bh=AVyPdY9rXDEVlHzGIMPuTNfU4B0wipjRbt9rspINQNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqH7ZM+UbsSwgcVMx3Kjn7Uh2lyXdG9EW8F/ooCCbJo5DFX4GkYU6Zs4ezLg94cqnrgnAPPND/1RaPFxdjdvTWMK0ihg2IVmtHDrH4Q+lOOl0gVz6m4vRjgYi7zsw8kWIj/3J34ul+h40WLjygw+FDtKTxxSButpdXVTyqHy7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxuuA2AYZnCgtjAA--.64635S3;
	Tue, 14 Jan 2025 14:16:22 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxjcUyAYZn66EhAA--.1451S2;
	Tue, 14 Jan 2025 14:16:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/amd/display: Add SPL_ASSERT_BUG() macro definition
Date: Tue, 14 Jan 2025 14:16:17 +0800
Message-ID: <20250114061617.31328-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250114061507.30765-1-yangtiezhu@loongson.cn>
References: <20250114061507.30765-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxjcUyAYZn66EhAA--.1451S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CryfurW8CF1xWrW3Zr1fuFX_yoW8GFyDpw
	1kWrn8uwn8Ja17K343J3W8CFW3Z397JF47X3sIv390va48uan7Zry3Jr4rtrWxWFWSya4r
	Jrn8WrW2qFsFyrbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4ZqXDUUUU

In order to keep the current ability for the aim of debugging and avoid
printing the warning message twice, add SPL_ASSERT_BUG() macro definition
to harden the callers of division functions.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h b/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
index a6f6132df241..5677dd6d5408 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
@@ -11,18 +11,27 @@
 		kgdb_breakpoint(); \
 	} \
 } while (0)
+#define SPL_ASSERT_EMERGENCY(expr) do {	\
+	kgdb_breakpoint(); \
+	BUG_ON(!(expr)); \
+} while (0)
 #else
 #define SPL_ASSERT_CRITICAL(expr) do {	\
 	if (WARN_ON(!(expr))) { \
 		; \
 	} \
 } while (0)
+#define SPL_ASSERT_EMERGENCY(expr) do {	\
+	BUG_ON(!(expr)); \
+} while (0)
 #endif /* CONFIG_HAVE_KGDB || CONFIG_KGDB */
 
 #if defined(CONFIG_DEBUG_KERNEL_DC)
 #define SPL_ASSERT(expr) SPL_ASSERT_CRITICAL(expr)
+#define SPL_ASSERT_BUG(expr) SPL_ASSERT_EMERGENCY(expr)
 #else
 #define SPL_ASSERT(expr) WARN_ON(!(expr))
+#define SPL_ASSERT_BUG(expr) BUG_ON(!(expr))
 #endif /* CONFIG_DEBUG_KERNEL_DC */
 
 #define SPL_BREAK_TO_DEBUGGER() SPL_ASSERT(0)
-- 
2.42.0

