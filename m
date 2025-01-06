Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966AD1D6DDD;
	Mon,  6 Jan 2025 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154086; cv=none; b=Vfy8aGbvmiilA2FTPmHANL0f0yTlYBpCAZtKwYIJM0a91KJuPHVHIB63cTjIKRUL5TnNWYoHhT65NenNqysUvg6g9L6PGxVNL0+36VcGOpB23g9rVoggtNmGfCkrMtZy5wyzAUfqTsblvaLAxrAj/eJnCA8q7PWcG/h4eSJhkS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154086; c=relaxed/simple;
	bh=MLXEyCIiMDWktlr2iqhQjbEZtBYosjMmeoiMpQX1mH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTQGO9US5pCeTTn/5xfzJCO84lPPpra4KgYCTs5k0XmKh6ymbKwxIiS4HB0irLSe2wstKTXYyirz+TOTHI7SMMJUC3mSu5gWJSV3ItqivdGGMqqkloKqjESlRuK6zPUTqSqbZcorPf0QGfpWRznBXSkdj8Y/nEnq1j53e34OLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxIK_fm3tnw45eAA--.30545S3;
	Mon, 06 Jan 2025 17:01:19 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDx_8fTm3tn2UgWAA--.31746S2;
	Mon, 06 Jan 2025 17:01:07 +0800 (CST)
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
Subject: [PATCH v2 2/5] drm/amd/display: Replace SPL_ASSERT() with SPL_ASSERT_WARN()
Date: Mon,  6 Jan 2025 17:01:06 +0800
Message-ID: <20250106090106.4683-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMDx_8fTm3tn2UgWAA--.31746S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWfGrW8KFyxZrWfZFyfuF43CFX_yoWkAr4xpa
	1fJry8ZF4jqayvqFZrW34UuF93Ja4rtrW2q3Z3W3ykWa4xCw15Ja9rtrs3Ar4UCr9xAa47
	AFyFgrWUKayktwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EPfPUUUUU==

SPL_ASSERT() is actually SPL_ASSERT_WARN() according to the macro
definition in drivers/gpu/drm/amd/display/dc/spl/spl_debug.h, just
replace the macro name SPL_ASSERT() with explicit SPL_ASSERT_WARN()
to avoid ambiguous.

Here is the one-line script:

  sed -i "s/\<SPL_ASSERT\>/SPL_ASSERT_WARN/g" `grep SPL_ASSERT -rwl drivers/gpu/drm/amd/display`

This is in preparation to add SPL_ASSERT_BUG() in later patch to harden
the callers of division functions, no functional change intended.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c   | 12 +++----
 .../gpu/drm/amd/display/dc/spl/spl_debug.h    |  6 ++--
 .../drm/amd/display/dc/spl/spl_fixpt31_32.c   | 32 +++++++++----------
 .../drm/amd/display/dc/spl/spl_fixpt31_32.h   | 12 +++----
 4 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
index 73a65913cb12..664343102f46 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
@@ -146,7 +146,7 @@ static struct spl_rect calculate_mpc_slice_in_timing_active(
 	mpc_rec.x = plane_clip_rec->x + mpc_rec.width * mpc_slice_idx;
 	mpc_rec.height = plane_clip_rec->height;
 	mpc_rec.y = plane_clip_rec->y;
-	SPL_ASSERT(mpc_slice_count == 1 ||
+	SPL_ASSERT_WARN(mpc_slice_count == 1 ||
 			spl_in->basic_out.view_format != SPL_VIEW_3D_SIDE_BY_SIDE ||
 			mpc_rec.width % 2 == 0);
 
@@ -159,7 +159,7 @@ static struct spl_rect calculate_mpc_slice_in_timing_active(
 	}
 
 	if (spl_in->basic_out.view_format == SPL_VIEW_3D_TOP_AND_BOTTOM) {
-		SPL_ASSERT(mpc_rec.height % 2 == 0);
+		SPL_ASSERT_WARN(mpc_rec.height % 2 == 0);
 		mpc_rec.height /= 2;
 	}
 	return mpc_rec;
@@ -666,7 +666,7 @@ static void spl_calculate_inits_and_viewports(struct spl_in *spl_in,
 	}
 	spl_scratch->scl_data.viewport.x += src.x;
 	spl_scratch->scl_data.viewport.y += src.y;
-	SPL_ASSERT(src.x % vpc_div == 0 && src.y % vpc_div == 0);
+	SPL_ASSERT_WARN(src.x % vpc_div == 0 && src.y % vpc_div == 0);
 	spl_scratch->scl_data.viewport_c.x += src.x / vpc_div;
 	spl_scratch->scl_data.viewport_c.y += src.y / vpc_div;
 }
@@ -679,7 +679,7 @@ static void spl_handle_3d_recout(struct spl_in *spl_in, struct spl_rect *recout)
 	 * This may break with rotation, good thing we aren't mixing hw rotation and 3d
 	 */
 	if (spl_in->basic_in.mpc_combine_v) {
-		SPL_ASSERT(spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_0 ||
+		SPL_ASSERT_WARN(spl_in->basic_in.rotation == SPL_ROTATION_ANGLE_0 ||
 			(spl_in->basic_out.view_format != SPL_VIEW_3D_TOP_AND_BOTTOM &&
 					spl_in->basic_out.view_format != SPL_VIEW_3D_SIDE_BY_SIDE));
 		if (spl_in->basic_out.view_format == SPL_VIEW_3D_TOP_AND_BOTTOM)
@@ -1052,7 +1052,7 @@ static bool spl_get_optimal_number_of_taps(
 				*enable_easf_v = true;
 				*enable_easf_h = true;
 			}
-			SPL_ASSERT((spl_scratch->scl_data.taps.v_taps > 1) &&
+			SPL_ASSERT_WARN((spl_scratch->scl_data.taps.v_taps > 1) &&
 				(spl_scratch->scl_data.taps.v_taps_c > 1));
 		} else { /* RGB */
 			if (spl_scratch->scl_data.taps.h_taps <= 3) {
@@ -1065,7 +1065,7 @@ static bool spl_get_optimal_number_of_taps(
 				*enable_easf_v = true;
 				*enable_easf_h = true;
 			}
-			SPL_ASSERT(spl_scratch->scl_data.taps.v_taps > 1);
+			SPL_ASSERT_WARN(spl_scratch->scl_data.taps.v_taps > 1);
 		}
 	} else {
 		*enable_easf_v = false;
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h b/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
index a6f6132df241..f01c932d550d 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_debug.h
@@ -20,11 +20,11 @@
 #endif /* CONFIG_HAVE_KGDB || CONFIG_KGDB */
 
 #if defined(CONFIG_DEBUG_KERNEL_DC)
-#define SPL_ASSERT(expr) SPL_ASSERT_CRITICAL(expr)
+#define SPL_ASSERT_WARN(expr) SPL_ASSERT_CRITICAL(expr)
 #else
-#define SPL_ASSERT(expr) WARN_ON(!(expr))
+#define SPL_ASSERT_WARN(expr) WARN_ON(!(expr))
 #endif /* CONFIG_DEBUG_KERNEL_DC */
 
-#define SPL_BREAK_TO_DEBUGGER() SPL_ASSERT(0)
+#define SPL_BREAK_TO_DEBUGGER() SPL_ASSERT_WARN(0)
 
 #endif  // SPL_DEBUG_H
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
index 131f1e3949d3..07a5c09b250e 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
@@ -29,7 +29,7 @@ static inline unsigned long long spl_complete_integer_division_u64(
 {
 	unsigned long long result;
 
-	SPL_ASSERT(divisor);
+	SPL_ASSERT_WARN(divisor);
 
 	result = spl_div64_u64_rem(dividend, divisor, remainder);
 
@@ -63,7 +63,7 @@ struct spl_fixed31_32 spl_fixpt_from_fraction(long long numerator, long long den
 	unsigned long long res_value = spl_complete_integer_division_u64(
 		arg1_value, arg2_value, &remainder);
 
-	SPL_ASSERT(res_value <= (unsigned long long)LONG_MAX);
+	SPL_ASSERT_WARN(res_value <= (unsigned long long)LONG_MAX);
 
 	/* determine fractional part */
 	{
@@ -85,7 +85,7 @@ struct spl_fixed31_32 spl_fixpt_from_fraction(long long numerator, long long den
 	{
 		unsigned long long summand = (remainder << 1) >= arg2_value;
 
-		SPL_ASSERT(res_value <= (unsigned long long)LLONG_MAX - summand);
+		SPL_ASSERT_WARN(res_value <= (unsigned long long)LLONG_MAX - summand);
 
 		res_value += summand;
 	}
@@ -118,19 +118,19 @@ struct spl_fixed31_32 spl_fixpt_mul(struct spl_fixed31_32 arg1, struct spl_fixed
 
 	res.value = arg1_int * arg2_int;
 
-	SPL_ASSERT(res.value <= (long long)LONG_MAX);
+	SPL_ASSERT_WARN(res.value <= (long long)LONG_MAX);
 
 	res.value <<= FIXED31_32_BITS_PER_FRACTIONAL_PART;
 
 	tmp = arg1_int * arg2_fra;
 
-	SPL_ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	SPL_ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
 	tmp = arg2_int * arg1_fra;
 
-	SPL_ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	SPL_ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
@@ -139,7 +139,7 @@ struct spl_fixed31_32 spl_fixpt_mul(struct spl_fixed31_32 arg1, struct spl_fixed
 	tmp = (tmp >> FIXED31_32_BITS_PER_FRACTIONAL_PART) +
 		(tmp >= (unsigned long long)spl_fixpt_half.value);
 
-	SPL_ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	SPL_ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
@@ -163,17 +163,17 @@ struct spl_fixed31_32 spl_fixpt_sqr(struct spl_fixed31_32 arg)
 
 	res.value = arg_int * arg_int;
 
-	SPL_ASSERT(res.value <= (long long)LONG_MAX);
+	SPL_ASSERT_WARN(res.value <= (long long)LONG_MAX);
 
 	res.value <<= FIXED31_32_BITS_PER_FRACTIONAL_PART;
 
 	tmp = arg_int * arg_fra;
 
-	SPL_ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	SPL_ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
-	SPL_ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	SPL_ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
@@ -182,7 +182,7 @@ struct spl_fixed31_32 spl_fixpt_sqr(struct spl_fixed31_32 arg)
 	tmp = (tmp >> FIXED31_32_BITS_PER_FRACTIONAL_PART) +
 		(tmp >= (unsigned long long)spl_fixpt_half.value);
 
-	SPL_ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	SPL_ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
@@ -196,7 +196,7 @@ struct spl_fixed31_32 spl_fixpt_recip(struct spl_fixed31_32 arg)
 	 * Good idea to use Newton's method
 	 */
 
-	SPL_ASSERT(arg.value);
+	SPL_ASSERT_WARN(arg.value);
 
 	return spl_fixpt_from_fraction(
 		spl_fixpt_one.value,
@@ -295,7 +295,7 @@ static struct spl_fixed31_32 spl_fixed31_32_exp_from_taylor_series(struct spl_fi
 		n + 1);
 	/* TODO find correct res */
 
-	SPL_ASSERT(spl_fixpt_lt(arg, spl_fixpt_one));
+	SPL_ASSERT_WARN(spl_fixpt_lt(arg, spl_fixpt_one));
 
 	do
 		res = spl_fixpt_add(
@@ -337,9 +337,9 @@ struct spl_fixed31_32 spl_fixpt_exp(struct spl_fixed31_32 arg)
 				spl_fixpt_ln2,
 				m));
 
-		SPL_ASSERT(m != 0);
+		SPL_ASSERT_WARN(m != 0);
 
-		SPL_ASSERT(spl_fixpt_lt(
+		SPL_ASSERT_WARN(spl_fixpt_lt(
 			spl_fixpt_abs(r),
 			spl_fixpt_one));
 
@@ -364,7 +364,7 @@ struct spl_fixed31_32 spl_fixpt_log(struct spl_fixed31_32 arg)
 
 	struct spl_fixed31_32 error;
 
-	SPL_ASSERT(arg.value > 0);
+	SPL_ASSERT_WARN(arg.value > 0);
 	/* TODO if arg is negative, return NaN */
 	/* TODO if arg is zero, return -INF */
 
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
index ed2647f9a099..b285f4397f07 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
@@ -191,7 +191,7 @@ static inline struct spl_fixed31_32 spl_fixpt_clamp(
  */
 static inline struct spl_fixed31_32 spl_fixpt_shl(struct spl_fixed31_32 arg, unsigned char shift)
 {
-	SPL_ASSERT(((arg.value >= 0) && (arg.value <= LLONG_MAX >> shift)) ||
+	SPL_ASSERT_WARN(((arg.value >= 0) && (arg.value <= LLONG_MAX >> shift)) ||
 		((arg.value < 0) && (arg.value >= ~(LLONG_MAX >> shift))));
 
 	arg.value = arg.value << shift;
@@ -228,7 +228,7 @@ static inline struct spl_fixed31_32 spl_fixpt_add(struct spl_fixed31_32 arg1, st
 {
 	struct spl_fixed31_32 res;
 
-	SPL_ASSERT(((arg1.value >= 0) && (LLONG_MAX - arg1.value >= arg2.value)) ||
+	SPL_ASSERT_WARN(((arg1.value >= 0) && (LLONG_MAX - arg1.value >= arg2.value)) ||
 		((arg1.value < 0) && (LLONG_MIN - arg1.value <= arg2.value)));
 
 	res.value = arg1.value + arg2.value;
@@ -253,7 +253,7 @@ static inline struct spl_fixed31_32 spl_fixpt_sub(struct spl_fixed31_32 arg1, st
 {
 	struct spl_fixed31_32 res;
 
-	SPL_ASSERT(((arg2.value >= 0) && (LLONG_MIN + arg2.value <= arg1.value)) ||
+	SPL_ASSERT_WARN(((arg2.value >= 0) && (LLONG_MIN + arg2.value <= arg1.value)) ||
 		((arg2.value < 0) && (LLONG_MAX + arg2.value >= arg1.value)));
 
 	res.value = arg1.value - arg2.value;
@@ -445,7 +445,7 @@ static inline int spl_fixpt_round(struct spl_fixed31_32 arg)
 
 	const long long summand = spl_fixpt_half.value;
 
-	SPL_ASSERT(LLONG_MAX - (long long)arg_value >= summand);
+	SPL_ASSERT_WARN(LLONG_MAX - (long long)arg_value >= summand);
 
 	arg_value += summand;
 
@@ -466,7 +466,7 @@ static inline int spl_fixpt_ceil(struct spl_fixed31_32 arg)
 	const long long summand = spl_fixpt_one.value -
 		spl_fixpt_epsilon.value;
 
-	SPL_ASSERT(LLONG_MAX - (long long)arg_value >= summand);
+	SPL_ASSERT_WARN(LLONG_MAX - (long long)arg_value >= summand);
 
 	arg_value += summand;
 
@@ -501,7 +501,7 @@ static inline struct spl_fixed31_32 spl_fixpt_truncate(struct spl_fixed31_32 arg
 	bool negative = arg.value < 0;
 
 	if (frac_bits >= FIXED31_32_BITS_PER_FRACTIONAL_PART) {
-		SPL_ASSERT(frac_bits == FIXED31_32_BITS_PER_FRACTIONAL_PART);
+		SPL_ASSERT_WARN(frac_bits == FIXED31_32_BITS_PER_FRACTIONAL_PART);
 		return arg;
 	}
 
-- 
2.42.0

