Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E87A8C13
	for <loongarch@lists.linux.dev>; Fri, 27 Oct 2023 06:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnwLGlID"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-27d104fa285so1419233a91.2
        for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 23:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698386473; x=1698991273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dhv57qGO2ds9mbz1kzxH2y7YI2Zg20QWv6WH4DiyAo4=;
        b=WnwLGlIDsx1d6LUqKU3MQvsFm0+WBnOjMNv7I3oMsgwftXQZRBF1k+0LhZiHijv0bV
         Q2aoH8v/vL7veKAmT6nN1y9tcWl3RpToiDRC4e8TM88gXA4GjKJUBQrpNiCPUFV+gvur
         IiMZ2GegE/itNbcPSOHF/OPn/s1YiJGp/ey5316WUNy4sd5zyvUyjTgRlPout4XSq9/8
         Yad+fU+o1J3inAnR67G0KA0DXDHvh+l/F5wLFUMJzXxQHu80ZNWW90Cx8FjwGy9hduux
         x47kiEQKk0lKAXRCCteonxRMckFvGMOP6IGs1weNeX4dBivXnerLQqtamUUXdWJ7ifAj
         OrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698386473; x=1698991273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dhv57qGO2ds9mbz1kzxH2y7YI2Zg20QWv6WH4DiyAo4=;
        b=VMJ9ERpQuLzEJMVHvB3DNvhQJO3K7NIVMvDbPyDha0PYvJRWeAAa3baP7q8wPF4TKu
         DJ2LwQ8/O7m1klRTBYaqQkF2YTqS5uNbATU1xtnwJFL/u6Q2uPkKh91wVPWWs/DQqFsc
         gspwolE9DTMNRwcmi35G5XgVKayrkm6HWcVy2hhaOFpsBeTpUkxDPKzsh8/ma2IW0/g3
         BXvkrE3kPXmkzcHn+ayGuMKFa+VUN6xyoRAXDrM4gzbY5a10pbc2v+v4hSWczjMxIF76
         hpzKGUKg4z/RHP5pXvKV30SS1oh1jifO9bxdxGxjZuvrPIUjbPrthg2Ed8GDvhjQ/SQ0
         xsog==
X-Gm-Message-State: AOJu0YwE3rMWbIaqRSzfMDMey4uNQFCybpjrSYqa6qEsdZLbQE3cBGUk
	JePk0ZXUiV9n1QKi/CFxzE1z8pHfWWDKEw==
X-Google-Smtp-Source: AGHT+IE2jl0HioVsQXNEfZxRACFosanEuhKFHfIooEHzU9KdPnTtunsaur1cC+gCgV8FkLRBioC3ig==
X-Received: by 2002:a17:90a:1996:b0:27d:2054:9641 with SMTP id 22-20020a17090a199600b0027d20549641mr1710760pji.36.1698386473513;
        Thu, 26 Oct 2023 23:01:13 -0700 (PDT)
Received: from ubuntu.. ([43.132.98.47])
        by smtp.googlemail.com with ESMTPSA id z2-20020a17090a1fc200b00277337818afsm1113667pjz.0.2023.10.26.23.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 23:01:13 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	yangtiezhu@loongson.cn,
	hengqi.chen@gmail.com
Subject: [PATCH bpf-next 2/8] LoongArch: BPF: Support sign-extension load instructions
Date: Thu, 26 Oct 2023 18:43:31 +0000
Message-Id: <20231026184337.563801-3-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026184337.563801-1-hengqi.chen@gmail.com>
References: <20231026184337.563801-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for sign-extension load instructions.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 49 ++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index db9342b2d0e6..0c2bbca527ef 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -411,7 +411,11 @@ static int add_exception_handler(const struct bpf_insn *insn,
 	off_t offset;
 	struct exception_table_entry *ex;
 
-	if (!ctx->image || !ctx->prog->aux->extable || BPF_MODE(insn->code) != BPF_PROBE_MEM)
+	if (!ctx->image || !ctx->prog->aux->extable)
+		return 0;
+
+	if (BPF_MODE(insn->code) != BPF_PROBE_MEM &&
+	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX)
 		return 0;
 
 	if (WARN_ON_ONCE(ctx->num_exentries >= ctx->prog->aux->num_exentries))
@@ -450,7 +454,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 {
 	u8 tm = -1;
 	u64 func_addr;
-	bool func_addr_fixed;
+	bool func_addr_fixed, sign_extend;
 	int i = insn - ctx->prog->insnsi;
 	int ret, jmp_offset;
 	const u8 code = insn->code;
@@ -879,31 +883,56 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	case BPF_LDX | BPF_PROBE_MEM | BPF_W:
 	case BPF_LDX | BPF_PROBE_MEM | BPF_H:
 	case BPF_LDX | BPF_PROBE_MEM | BPF_B:
+	/* dst_reg = (s64)*(signed size *)(src_reg + off) */
+	case BPF_LDX | BPF_MEMSX | BPF_B:
+	case BPF_LDX | BPF_MEMSX | BPF_H:
+	case BPF_LDX | BPF_MEMSX | BPF_W:
+	case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
+	case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
+	case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
+		sign_extend = BPF_MODE(insn->code) == BPF_MEMSX ||
+			      BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
 		switch (BPF_SIZE(code)) {
 		case BPF_B:
 			if (is_signed_imm12(off)) {
-				emit_insn(ctx, ldbu, dst, src, off);
+				if (sign_extend)
+					emit_insn(ctx, ldb, dst, src, off);
+				else
+					emit_insn(ctx, ldbu, dst, src, off);
 			} else {
 				move_imm(ctx, t1, off, is32);
-				emit_insn(ctx, ldxbu, dst, src, t1);
+				if (sign_extend)
+					emit_insn(ctx, ldxb, dst, src, t1);
+				else
+					emit_insn(ctx, ldxbu, dst, src, t1);
 			}
 			break;
 		case BPF_H:
 			if (is_signed_imm12(off)) {
-				emit_insn(ctx, ldhu, dst, src, off);
+				if (sign_extend)
+					emit_insn(ctx, ldh, dst, src, off);
+				else
+					emit_insn(ctx, ldhu, dst, src, off);
 			} else {
 				move_imm(ctx, t1, off, is32);
-				emit_insn(ctx, ldxhu, dst, src, t1);
+				if (sign_extend)
+					emit_insn(ctx, ldxh, dst, src, t1);
+				else
+					emit_insn(ctx, ldxhu, dst, src, t1);
 			}
 			break;
 		case BPF_W:
 			if (is_signed_imm12(off)) {
-				emit_insn(ctx, ldwu, dst, src, off);
-			} else if (is_signed_imm14(off)) {
-				emit_insn(ctx, ldptrw, dst, src, off);
+				if (sign_extend)
+					emit_insn(ctx, ldw, dst, src, off);
+				else
+					emit_insn(ctx, ldwu, dst, src, off);
 			} else {
 				move_imm(ctx, t1, off, is32);
-				emit_insn(ctx, ldxwu, dst, src, t1);
+				if (sign_extend)
+					emit_insn(ctx, ldxw, dst, src, t1);
+				else
+					emit_insn(ctx, ldxwu, dst, src, t1);
 			}
 			break;
 		case BPF_DW:
-- 
2.34.1

