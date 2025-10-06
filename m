Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFFA1632C8
	for <loongarch@lists.linux.dev>; Mon,  6 Oct 2025 05:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759728822; cv=none; b=jtQhwCKsm+8gJygNiP5Cf6mq098z6ObWumTutUZEe+4iAktIhIIXRewJfgXncXqvgBbWVrdNRGBnm24/CG/bEl0eG5T8SzwZ3fVdlnCR/3RbhWGKI/n2Kk6fw8u5ZQfqaH73NZxcmHH8mhFy+hpBVgN2TaQRD12Oz5NJdAKD82M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759728822; c=relaxed/simple;
	bh=O2It1l6/0qG+KH1vIEDTq8EGJsds1dXzMOV3TiS7zhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNRx+LLVBbVnKRUejM2Fv0v3+eZKnY8Y9vvWxgOsZfu7Vca34lfYjlBkz1t5RhZSin3slPzSGHXzslwjkR7ZDrSvG4qdyExvAQJIV7xeDSba7ufyw0PEJEtsV5IMhjr7b48ZSgM0fkN1Nyf+hbzhT+gLwFsoHCtb0oHoWmGkzf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SY07jJPB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SY07jJPB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27ee41e074dso47781665ad.1
        for <loongarch@lists.linux.dev>; Sun, 05 Oct 2025 22:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759728820; x=1760333620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7dUiT2JEOoznUJWaYP1bpZ6xGr74TqUlCTqIRGaiPo=;
        b=SY07jJPBb/5qlWjx7pRR91/6qMluNFahjNqM9aynF7CkeOJQ0W2lLw2wRMqGEeKiL4
         LJJBmvT+4PtxPTM0wOiR8eJBbY/E1InXOQZoUc1V6ZupHjVxmd/IoIdZbcRpR9VGoihZ
         MK8Pq0AnF+fsHL1kSKDPZdE+HGo+ysuQARjMy5kDLBZBUvJ1IAaBnM1EINQayXhImfJW
         qxaD/d0uuMpMEEB6ZGFCRTHk/kJazhnicDYBH8PCJxBMEu60v2GDGvrVIZkjOBcL6HR7
         PozDr8kSwmPBL9Mvk7QotipGE55A908knDabBXK8sQoNxqlmrA7+EIlg/cD8K6uW4qQV
         eQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759728820; x=1760333620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7dUiT2JEOoznUJWaYP1bpZ6xGr74TqUlCTqIRGaiPo=;
        b=SOqMdfXVcWRCdff2u+yST8O3MpYdQcFdif8RnE9yofdY4XZO2sBy3H2UWD0csxVDA4
         PIcqwmPRvXVusg6nhvlk2jxv73OJuvp4/A//x953E+gqpHHbsrTeCzFm0HlRon0G1BvE
         1k9N4XxHado0Mgt0EyBfFvuTU8qaKCmmevyiY5PoSbira9CgKVfJr38Yt8aJvfsqicGW
         rQDk2fdckfJ15CiTr+HO1t1Q5scnacS18gwSTLI9liiQS5xu9yYkkEvW1vUxTGpX3oY2
         uMMVlurtajIDjaK0eH6boUVzm6HEK3tb2hXVPFq0v8/sRppvPw+gl9OyrzwdslXoCsXo
         iMPQ==
X-Gm-Message-State: AOJu0Yz9NTeZaiEmbZd6ActTt4Vs3DwAcYdpVnypuixg1HdinoXud7w+
	983UFLxB9ZczoJue/ElTM31iH0mPEmD3HKH0Sp4rrYwb+KsT7wWY8Vbv
X-Gm-Gg: ASbGncu7iVoKidtpbH859h2MH+piZM3egxJNFO7AWYc4hh6yNDtYsSYxnb5Rrktai8m
	bG8EaxEM1uYGvYXOxO8VoBBjft94OXawr4j+gDwl023bK5W2tdGbCraLCAt8H6iJ52396Af8Jlp
	H7CdzoFVVCRHcgLLKqXStNZJoUHPtuPHzbw3o+9tndkpS4sO1MzU5hgdtsnEbb5HHN5DadmxZYO
	mqNzvBFiXeFhI9QO3XZsJzaZx1EnbpPvE7WZSKF4L0DxiAThMMht2omlx4SqvzXOAWAR9phHByG
	gLWaKVLTmh/8yUehQFQ+LA6rFFplFcm276SdqTZiJe6MfgjCu95hbTUVBO/Bak8RpkAO7esDIXb
	Mje8CEvG0VmiQUtX2Olff+AFapmtxbaDixKYaaY2V54WjBk76WehgXP4XY1naCpc9xQ==
X-Google-Smtp-Source: AGHT+IHYsocb6phx5YtTltK/zI2wkhWsRaR+9W04133ZUWQOixZ1P9q2uEohRK4/lao6Xtla8KPqfw==
X-Received: by 2002:a17:902:dac7:b0:273:59ef:4c30 with SMTP id d9443c01a7336-28e9a565780mr161785775ad.15.1759728820048;
        Sun, 05 Oct 2025 22:33:40 -0700 (PDT)
Received: from devbox.. ([116.16.231.215])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b88fcsm120187075ad.84.2025.10.05.22.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 22:33:39 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 1/7] LoongArch: BPF: Move sign_extend() upper
Date: Mon,  6 Oct 2025 05:33:17 +0000
Message-ID: <20251006053323.193581-2-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006053323.193581-1-hengqi.chen@gmail.com>
References: <20251006053323.193581-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move sign_extend() upper in bpf_jit.c so that it can be used
in build_insn() without forward declaration. No functional
change intended.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 62 ++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 5a2fc56b1fe0..4e6ef93ab0d3 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -437,6 +437,37 @@ static bool is_signed_bpf_cond(u8 cond)
 	       cond == BPF_JSGE || cond == BPF_JSLE;
 }
 
+/*
+ * Sign-extend the register if necessary
+ */
+static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 size, bool sign)
+{
+	/* The ABI requires unsigned char/short to be zero-extended */
+	if (!sign && (size == 1 || size == 2)) {
+		if (rd != rj)
+			move_reg(ctx, rd, rj);
+		return;
+	}
+
+	switch (size) {
+	case 1:
+		emit_insn(ctx, extwb, rd, rj);
+		break;
+	case 2:
+		emit_insn(ctx, extwh, rd, rj);
+		break;
+	case 4:
+		emit_insn(ctx, addiw, rd, rj, 0);
+		break;
+	case 8:
+		if (rd != rj)
+			move_reg(ctx, rd, rj);
+		break;
+	default:
+		pr_warn("bpf_jit: invalid size %d for sign_extend\n", size);
+	}
+}
+
 #define BPF_FIXUP_REG_MASK	GENMASK(31, 27)
 #define BPF_FIXUP_OFFSET_MASK	GENMASK(26, 0)
 
@@ -1451,37 +1482,6 @@ void arch_free_bpf_trampoline(void *image, unsigned int size)
 	bpf_prog_pack_free(image, size);
 }
 
-/*
- * Sign-extend the register if necessary
- */
-static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 size, bool sign)
-{
-	/* The ABI requires unsigned char/short to be zero-extended */
-	if (!sign && (size == 1 || size == 2)) {
-		if (rd != rj)
-			move_reg(ctx, rd, rj);
-		return;
-	}
-
-	switch (size) {
-	case 1:
-		emit_insn(ctx, extwb, rd, rj);
-		break;
-	case 2:
-		emit_insn(ctx, extwh, rd, rj);
-		break;
-	case 4:
-		emit_insn(ctx, addiw, rd, rj, 0);
-		break;
-	case 8:
-		if (rd != rj)
-			move_reg(ctx, rd, rj);
-		break;
-	default:
-		pr_warn("bpf_jit: invalid size %d for sign_extend\n", size);
-	}
-}
-
 static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 					 const struct btf_func_model *m, struct bpf_tramp_links *tlinks,
 					 void *func_addr, u32 flags)
-- 
2.43.5

