Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BDBE571
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763963819; cv=none; b=Ty6VW+hBMMQGcHWAo5yVo3v5LtkSm1Tvilf6XGqSo0L0uuydHa/+FSvsq4ZA7IE+igg+JT3aR+DXnA8O5e3GYOLLzLbcoKv4Boo7GiK3PZSzR2c5ghNjnf98334K1MR5p+hIVLA2o6Pi9eT+WZt2Llbh0d2uDoA+xtPeyT/UZpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763963819; c=relaxed/simple;
	bh=MfYT6JKaUveFbHTtmiXfL7u726jKbxr0eKB5A0vkXHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4h91JyNhVtfKXyDXvAGIJdCH612pUzTKMhEsNLFCkMJShjv4DRcVF4cwo2uNyfmhlgwmw4lKTiaJweE7XtHsjgqcuIad8HjS8NMu87ZtOLqAwSJKbkd4pPCEl52bFpJuZyu99bJgd9hh1mG8zzOzNsE1Pfm1M9l9vnVu4f7dHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVtkemcd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVtkemcd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-298287a26c3so44876085ad.0
        for <loongarch@lists.linux.dev>; Sun, 23 Nov 2025 21:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763963817; x=1764568617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KDzoAg7cw0qJNV2sqkz9SrTN1G38qgGqSuNZe9sX1s=;
        b=HVtkemcdIJJxb9xdHMsB40A3eWUIdBOarxAltjDlbaTHsgTfdR9SnNLYcxEZEpXIx/
         d6cVPYEcO+Gue1XwRipBnhjeoLvitOXZlshCZwrjDhaM76dxNSEvF8L2hjWPYdldX6HE
         OsTHFj8pKIhQb3iHhLEPUebKLmbS9yBLtNf+CXPCrr6/AyWQcwN7qmZCbEiW2Yi+1BgF
         fJnoUXvzMj5ZXY3/e7zfJa3oAE0BB+uNy5Zl8em81sW7hxF9GOMb+yVh4SPwzf6xKPHs
         yBOfTBIQ7SblXSH8yWymah+RJ5Xa9ZlB9muc/DX/nJ7NoJHUAnFiuXf1yvdpscg/3SKi
         CrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763963817; x=1764568617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KDzoAg7cw0qJNV2sqkz9SrTN1G38qgGqSuNZe9sX1s=;
        b=pA7VV4RbgSe0L2dAuavKMrwa2Uxnq3CWnlgDSuZdSh5r7CYOwui+TFfT/WduAWmAcU
         h051YD/k5BHnn7T7s6ES8RUOsSs+ct0S6wpGspi4nCyU+n8OWgSy242UYK9rJmqfdxaP
         Hmpl1jFRy5uaGtCDgD4ZUOpRjFZP6tBS9GrMILRHZpMDXFTByW7lKv1iRC2K9cTFg3cn
         bCSqcrcc3aLBvvwmfrJbuLRDMJ8KxZML6e227NT652LSAH6s/TqXssS5M6Rt+d6ro6GG
         3j7DU2xspLsL+P9T9SP8J/EO/4r2E0Wnxy40tLFVbwCDCOdBi0TNPEg/md6wKvX21rrs
         fqkQ==
X-Gm-Message-State: AOJu0Yw8d1pGnvHQqaX2OplKuW/DDuB0iVVJLuM9pXzkG80l6ZFctXYb
	qh0Yr2YlXS4m8G8DjHAYnDG7tLXt1jg7ipkIrV9X8IW3Ij+HjiZ+9GsF
X-Gm-Gg: ASbGnctotkcgd8u9izYquSoLW3qJQ9MUqYMsL9XZqdyrlkqFra1M4/Qd6Ylghz9hTNu
	Wi53ikmW+9XGb1BJtj0ipiVgE6s9s53awA80aikYDiKNIhcwcGaDOdEvmtf8VhWBjVB/WjckCT9
	nyD6gSv+RxKLK+5n5G7fcse5Uri4mO4fGAgUiERn0628j25lbhaqM8s+QOi04Dde+XYW34SC7vF
	al6MSHHd3ieFq9qGXM5Wlyq96BhK0YbGy5Bfu+JMcuCoRnXfPF26WDzqYgsN2bYTFlF1llnstIU
	gN4IIhhpjZgk+4ZurII2wkjDxuEJBh6aC+prOXvDbu4vBiAysjx4xSlnQHTvA8H65fdFudGIUnv
	AQDF2DQ+UMYRtGgdpaRG09I++iJNKrH39GIb96kvpB1gByQnLNdzJ8kDmKkiSrXAdBk0+cw3H0B
	zDJ/lc8BYn9NBbKYlBMiHq+f4aWepp
X-Google-Smtp-Source: AGHT+IETvmRJDPqvoGwZfpT9SCakxegbPS/0bbSKIMzPz3PpTxt6aJTD9R83rWDRa/SvRKZvwc2SQg==
X-Received: by 2002:a17:903:947:b0:290:9332:eebd with SMTP id d9443c01a7336-29b6be8c682mr114103125ad.10.1763963817332;
        Sun, 23 Nov 2025 21:56:57 -0800 (PST)
Received: from devbox.. ([43.132.141.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b106094sm124881785ad.10.2025.11.23.21.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 21:56:56 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 1/5] LoongArch: BPF: Sign extend kfunc call arguments
Date: Mon, 24 Nov 2025 05:56:38 +0000
Message-ID: <20251124055642.1591-2-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251124055642.1591-1-hengqi.chen@gmail.com>
References: <20251124055642.1591-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kfunc calls are native calls so they should follow LoongArch
calling conventions. Sign extend its arguments properly to avoid
kernel panic. This is done by adding a new emit_abi_ext() helper.
The emit_abi_ext() helper performs extension in place meaning a
value already store in target register (This is different from
the existing sign_extend() helper and thus we can't reuse it).

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 16 ++++++++++++++++
 arch/loongarch/net/bpf_jit.h | 26 ++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index f97dc9936401..c67631303841 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -950,6 +950,22 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			emit_insn(ctx, ldd, REG_TCC, LOONGARCH_GPR_SP, tcc_ptr_off);
 		}
 
+		if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL) {
+			const struct btf_func_model *m;
+			int i;
+
+			m = bpf_jit_find_kfunc_model(ctx->prog, insn);
+			if (!m)
+				return -EINVAL;
+
+			for (i = 0; i < m->nr_args; i++) {
+				u8 reg = regmap[BPF_REG_1 + i];
+				bool sign = m->arg_flags[i] & BTF_FMODEL_SIGNED_ARG;
+
+				emit_abi_ext(ctx, reg, m->arg_size[i], sign);
+			}
+		}
+
 		move_addr(ctx, t1, func_addr);
 		emit_insn(ctx, jirl, LOONGARCH_GPR_RA, t1, 0);
 
diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
index 5697158fd164..ed0193659cf9 100644
--- a/arch/loongarch/net/bpf_jit.h
+++ b/arch/loongarch/net/bpf_jit.h
@@ -88,6 +88,32 @@ static inline void emit_sext_32(struct jit_ctx *ctx, enum loongarch_gpr reg, boo
 	emit_insn(ctx, addiw, reg, reg, 0);
 }
 
+/* Emit proper extension according to ABI requirements.
+ * Note that this requires a value of size `size` already resides in register `reg`.
+ */
+static inline void emit_abi_ext(struct jit_ctx *ctx, int reg, u8 size, bool sign)
+{
+	/* The ABI requires unsigned char/short to be zero-extended, leave it intact */
+	if (!sign && (size == 1 || size == 2))
+		return;
+
+	switch (size) {
+	case 1:
+		emit_insn(ctx, extwb, reg, reg);
+		break;
+	case 2:
+		emit_insn(ctx, extwh, reg, reg);
+		break;
+	case 4:
+		emit_insn(ctx, addiw, reg, reg, 0);
+		break;
+	case 8:
+		break;
+	default:
+		pr_warn("bpf_jit: invalid size %d for extension\n", size);
+	}
+}
+
 static inline void move_addr(struct jit_ctx *ctx, enum loongarch_gpr rd, u64 addr)
 {
 	u64 imm_11_0, imm_31_12, imm_51_32, imm_63_52;
-- 
2.43.5

