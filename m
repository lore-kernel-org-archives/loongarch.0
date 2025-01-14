Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD5223244B;
	Tue, 14 Jan 2025 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736861454; cv=none; b=q0vD9sKTIaXrOBPdrFu8xBAgSapbUIH+6QUy4Rt+DDt9SbQfmiokdQ/2SkPkhZviPuNm5pBMrVpY7hzeWKynXFL8YhtZa749OaGNzoYTUSKYzLAhZOVT5Aql0Mww9UUhuhu5ZTwGFHMbk3xMPWK7v46MHakS3ocdSYAqKFOI4AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736861454; c=relaxed/simple;
	bh=7hnfsE41/2Gp2qzS6i+3qD6GwwaLceZuAZXi6PsflqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/BC/7r518rP0JK4hHsKjJ0ZizjeQv+URv3hG+TuhplN7WrXQedyQl5HAoayoYTTabiGDMSa6n9EzXldcHwv7BGFOfrdfPnYbDMmDOKmIKa1hMpIYLz7D6vTGw0KhZde9hNjeteDZ6Zp17qM+m4lQoAekX2slW4PvlOhJUjydfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxaeAJZ4ZnAT1jAA--.42768S3;
	Tue, 14 Jan 2025 21:30:49 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxfccGZ4ZnEiYiAA--.3726S2;
	Tue, 14 Jan 2025 21:30:46 +0800 (CST)
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
Subject: [PATCH v4 3/3] drm/amd/display: Harden callers of division functions
Date: Tue, 14 Jan 2025 21:30:35 +0800
Message-ID: <20250114133035.20178-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250114132856.19463-1-yangtiezhu@loongson.cn>
References: <20250114132856.19463-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxfccGZ4ZnEiYiAA--.3726S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWry8uF1ktw1UJFWUCFWUJrc_yoW5GF4fpa
	13GFyUXryDZFZ2yFZ7C3W7WFZxAa93JF4v9F43Cws5u347Zan8urZ3J3Z5Gr429rWIyF4a
	vFs8GrWjqF1vyrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8qXdUUUUU=

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

The current ASSERT() and SPL_ASSERT() do not do anything to prevent
the divide by zero and the rest of the code does not either, this
is the root cause.

The callers of division functions should be hardened against dividing
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
index 88d3f9d7dd55..f78c6702bc42 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
@@ -51,7 +51,7 @@ static inline unsigned long long complete_integer_division_u64(
 {
 	unsigned long long result;
 
-	ASSERT(divisor);
+	ASSERT_BUG(divisor);
 
 	result = div64_u64_rem(dividend, divisor, remainder);
 
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
index 131f1e3949d3..b3e6840e4715 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
@@ -29,7 +29,7 @@ static inline unsigned long long spl_complete_integer_division_u64(
 {
 	unsigned long long result;
 
-	SPL_ASSERT(divisor);
+	SPL_ASSERT_BUG(divisor);
 
 	result = spl_div64_u64_rem(dividend, divisor, remainder);
 
-- 
2.42.0

