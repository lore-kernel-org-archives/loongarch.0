Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208002B9CD;
	Mon,  6 Jan 2025 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154317; cv=none; b=TBvBkGAwoxoNZUeMnrcqSu6XP44ykRu1/zVhiv9V1mV9DG7RMHo3Fl92JwbkoUwhbMcLXpQtcdKI666s26gHEpw8D9KwYlxsncvUMDAtvqKZ8aE39RLVIboB4wRukka6Q6odZ3VTzhaj8zTeXTxq09ANpvYi5F8JrCUXbVI2GtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154317; c=relaxed/simple;
	bh=CN/bCuJBGdtdZ7qw7A4X8HU40Uxp0brMNBWzqYuTsMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzeliBFaC9hOP+4DLOSoL1y92P+cJiUzrpfnjFVDOFpBCneLW4kdtSbB0bYFBbz6OBnK/Dcp8XLjHDR4cq8yYjtIHAdMtIQdwVCD/3Dh7JXv8dMLecKqp8lnPypfNE8RR5MHtHDPtbjSDVDov9Znn2VjAxPyFM8ubp/WkWcAES4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxeeDJnHtndo9eAA--.54621S3;
	Mon, 06 Jan 2025 17:05:13 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxYMbDnHtnT0oWAA--.31780S2;
	Mon, 06 Jan 2025 17:05:07 +0800 (CST)
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
Subject: [PATCH v2 5/5] drm/amd/display: Harden callers of division functions
Date: Mon,  6 Jan 2025 17:05:06 +0800
Message-ID: <20250106090506.6334-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMCxYMbDnHtnT0oWAA--.31780S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWry8uF1ktw1UJFWUCFWUJrc_yoW5GF43pF
	43GFyUXryDZFZ7ta97C3W7WFZxAa93JFW09a13Cws5u347Zan8urZ3Jas5Gr429rZ2yF4a
	vFs8GrW2qF1vyrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVuyxDUUUU

There are objtool warnings compiled with the latest mainline LLVM:

  dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
  spl_fixpt_recip() falls through to next function spl_fixpt_sinc()

Here are the call paths:

  dc_fixpt_recip()
    dc_fixpt_from_fraction()
      complete_integer_division_u64()
        div64_u64_rem()

  spl_fixpt_recip()
    spl_fixpt_from_fraction()
      spl_complete_integer_division_u64()
        spl_div64_u64_rem()

This was introduced by a change in Clang from a few months:

  [SimplifyCFG] Deduce paths unreachable if they cause div/rem UB)
  https://github.com/llvm/llvm-project/commit/37932643abab

Since the ASSERT_WARN() and SPL_ASSERT_WARN() do not do anything to
prevent the divide by zero and the rest of the code does not either,
the callers of division functions should be hardened against dividing
by zero to avoid undefined behavior, so use the new added ASSERT_BUG()
and SPL_ASSERT_BUG() to stop the control flow if the divisior is zero.

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Xi Ruoyao <xry111@xry111.site>
Suggested-by: Rui Wang <wangrui@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Link: https://lore.kernel.org/lkml/20241220223403.GA2605890@ax162/
---
 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c  | 2 +-
 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
index 1e32a9ca7f49..de86eb049302 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
@@ -51,7 +51,7 @@ static inline unsigned long long complete_integer_division_u64(
 {
 	unsigned long long result;
 
-	ASSERT_WARN(divisor);
+	ASSERT_BUG(divisor);
 
 	result = div64_u64_rem(dividend, divisor, remainder);
 
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
index 07a5c09b250e..d04a220fd2fe 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
@@ -29,7 +29,7 @@ static inline unsigned long long spl_complete_integer_division_u64(
 {
 	unsigned long long result;
 
-	SPL_ASSERT_WARN(divisor);
+	SPL_ASSERT_BUG(divisor);
 
 	result = spl_div64_u64_rem(dividend, divisor, remainder);
 
-- 
2.42.0

