Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2F013BC18
	for <loongarch@lists.linux.dev>; Sat,  7 Dec 2024 01:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733536774; cv=none; b=kn/PWjdcZsi8yCv795kEHSSA4UCdfCh3k7eC4tGiGEeJBOusAg/4Beqv7iUYdWs8H+0cJJOMlMP2gvZ3Omjz4AsH/VaUrflzb2t+0z8KhDm5M8RemUoVEueL/S4DWaL6W3WbmT2Rh1/Zss0j0712ZRbZNsraLrri2fixCiGZqyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733536774; c=relaxed/simple;
	bh=MhDtD1hnbhebvcmqXJ5exN8uWQg9/37rRWH+w7S3d+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhRaivRm0ngnM7CK/SumpWSB+7gltoT7jwsOYtN47EJ4GaEKKIi1N0Pbhj+RBslUkuZFyLkmB+mbTMoiFbD4EeWYpNM5/3m7AcKu91fm5wVe3bOvFygsOp694dEoQF3F1O87vc4y7LKjuKUh/3eVAbD3aietwIjrZNxIJv1e+Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxLOIBrFNnRq1SAA--.28820S3;
	Sat, 07 Dec 2024 09:59:29 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx_uD1q1Nn3Wd5AA--.42544S12;
	Sat, 07 Dec 2024 09:59:28 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/10] drm/amd/display: Mark dc_fixpt_from_fraction() noinline
Date: Sat,  7 Dec 2024 09:59:15 +0800
Message-ID: <20241207015915.1159-11-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241207015915.1159-1-yangtiezhu@loongson.cn>
References: <20241207015915.1159-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx_uD1q1Nn3Wd5AA--.42544S12
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF17KFWruF4DAw1DtrWDGFX_yoW8Gr1DpF
	43JFy5Wa1kJF1xKa98Ja43uFW3Ca95XrW8Wr1UArs5Aa4UZ3WvgFZxKw1DGFWakF4Yyr4S
	vFWDKay7KFn2yrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUsZqXUUUUU

When compiling with Clang on LoongArch, there exists the following objtool
warning in drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.o:

  dc_fixpt_recip() falls through to next function dc_fixpt_sinc()

This is because dc_fixpt_from_fraction() is inlined in dc_fixpt_recip()
by Clang, given dc_fixpt_from_fraction() is not a simple function, just
mark it noinline to avoid the above issue.

Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
index 88d3f9d7dd55..b40c6a21460d 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
@@ -68,7 +68,7 @@ static inline unsigned long long complete_integer_division_u64(
 #define GET_FRACTIONAL_PART(x) \
 	(FRACTIONAL_PART_MASK & (x))
 
-struct fixed31_32 dc_fixpt_from_fraction(long long numerator, long long denominator)
+noinline struct fixed31_32 dc_fixpt_from_fraction(long long numerator, long long denominator)
 {
 	struct fixed31_32 res;
 
-- 
2.42.0

