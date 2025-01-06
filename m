Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388041CCEC8;
	Mon,  6 Jan 2025 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154223; cv=none; b=W2PyRTuPEcndDSFtIAN3jq/w81u8N3/q6kufqB2m5JvoziEiYZ62xKV6qkqdGrptgr4C9GuUh+9Kecb48sARRl7UCybbOB12y0RP7XkUfaxx7ZSGOfz5eUymfnqefinsM7fGgVSbeuBkt2L5xUD6P2zzof8RvCNu1D0CxlH5Vts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154223; c=relaxed/simple;
	bh=czDXDckOhjYSeUz7BxZNyQe6fIlehB3/zBBQFkZywZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFdg5aVC0k9o7lOgOGSIh7DoYKouO8CDVz1lpYqKLgapktwPRfEKUzDgZT3DJ/dL6XISnDdCjV5ZgLm5Krz6eqSsFTRvC+WAKJ5HMCfExe6jVVJd5q1S7QIEqcKe9poux6RLcRe4KretXB/JJW+WYRnftU6AdAtIUsa+vTR4LPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxMK9pnHtnMI9eAA--.30676S3;
	Mon, 06 Jan 2025 17:03:38 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxYMZonHtnskkWAA--.31771S2;
	Mon, 06 Jan 2025 17:03:36 +0800 (CST)
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
Subject: [PATCH v2 4/5] drm/amd/display: Add SPL_ASSERT_BUG() macro definition
Date: Mon,  6 Jan 2025 17:03:35 +0800
Message-ID: <20250106090335.5751-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250106085755.3268-1-yangtiezhu@loongson.cn>
References: <20250106085755.3268-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxYMZonHtnskkWAA--.31771S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CryfurW8CF1xWFy5GFy3trc_yoW8Gw1rpw
	1kWF98uwn8Ja12g3sxJ3W8CFW3A397JF47X3sI9390va48ua1xZr9rJr4rJrWxWFWSya4r
	Jrn8WrW2gFs2yrbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4ZqXDUUUU

In order to keep the current ability for the aim of debugging and avoid
printing the warning message twice, add SPL_ASSERT_BUG() macro definition
to harden the callers of division functions.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h b/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
index f01c932d550d..8220c5800692 100644
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
 #define SPL_ASSERT_WARN(expr) SPL_ASSERT_CRITICAL(expr)
+#define SPL_ASSERT_BUG(expr) SPL_ASSERT_EMERGENCY(expr)
 #else
 #define SPL_ASSERT_WARN(expr) WARN_ON(!(expr))
+#define SPL_ASSERT_BUG(expr) BUG_ON(!(expr))
 #endif /* CONFIG_DEBUG_KERNEL_DC */
 
 #define SPL_BREAK_TO_DEBUGGER() SPL_ASSERT_WARN(0)
-- 
2.42.0

