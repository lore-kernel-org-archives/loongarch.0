Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F92FBDE3
	for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763053635; cv=none; b=SHlL8VGSXPAHB4AU/EgqMfjep1NixUcf7vJN3soZ+EfRVlvTXxKzLcgFOoG6zFVJ1KGgNCNy6JzAAd3q4qlDTcglxcwx4e2a+bRlkpZhzFXObDOOkdCqRV+KXpH607S/F+ahvE5JNjavys7ijAhDRK8dBOTfTLs30/+4JMkqFCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763053635; c=relaxed/simple;
	bh=eIDJr2pEA2DRlPLQjPs6NNGihwqlyDxmUFqdN1+Zr80=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=i2Df2EvH8q0WV3jqTaHT3GS5aVZohMn7UP7QK4oiaehGjf5c95xiUpr2CMJC1b9wqx5tBdlYAFdY+aehu4grI2bkBll1SKa5goKwW25TW5wDR+8M48cQi0joJVSd7InvvFj8FNNRWy3vLAzXYyzZggYLz/wLFtwHenvba32nUv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTqRo6qN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTqRo6qN"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7aace33b75bso982808b3a.1
        for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 09:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763053633; x=1763658433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SKwZSMmGzUdanwCTT7PnADQTRL8j3tcNkt4rj2Q3WSU=;
        b=bTqRo6qNGmivxfJtdaHhaNNvjBJveiJ3LV/zCzK8K+4Z+MLdu6j/iwsI0Vw60eWolf
         TpPmQa+rdkU8BNne3AcL6gx58A4CrTWJX1rjyyzEBr3/cwKzLXKw7YAixsbEUVLYNfxv
         UQXYuHGPp1uIdAcRaK5BBIhzyvrbfgenwP1PvyLr4zodLicKi1ZOzP6DTAeeyi6RE3vt
         atio0L0W79SY2rohYbbcNw+wALc/7yXg4Tq7r1bOcpt1+cp/38sEboOyPQKU3M/eae1W
         itwDSiuGrj6NEJi5EVwEuvmh8pjXaElDLu0IUHK2WE7jn/mwbl/1RTdzMtE3LmD8pY8j
         sJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763053633; x=1763658433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKwZSMmGzUdanwCTT7PnADQTRL8j3tcNkt4rj2Q3WSU=;
        b=M7eRcmfvH+i5N1/OgZ4Mu+GK+1hy6i5peg6IvcUKiPr7y0x0sPqHItKLPXfGZFmsdI
         C5Gn8H83wj4CLnIhGHfqjco7qyfVOMe2KnTjfhmSQcHdiODFHoU9RZO1P567uHJtLrZP
         8qrKXafEe8Gh3avRWcz8eYepy4afsqOZwYYDkWu25HP40Z8apJBOXYtdHrvKBQP/FpFP
         E3O04VX/FGTBnOd9jGNDKCtz0cdPhotN/wxtTgjY54nIVKjwHdvDJeoRaZH7Z0YjkHwl
         1HUsdDg+l8DThhMi1biOOMbrhDfpIPKxh8aqqWy5LRe5y11EOo6nPGG/juFMv6TxuFbo
         LAig==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7DsmKPBV9oBKULZmHjwAF1dVQ8xTDQoW16Y/aTlG/p1dUDwao6e24wa8jBKT/roEyqqoIFE2qLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzB81E7fvJorGEFmz4IDT/Vmw0Op77EJ6M1pCo4dCGdWQxcYZpV
	P0oMyABZJQJqDim5iBPvd4r4RlCYnCaO3fmpyVr93pNCFhKX34wiuxlM
X-Gm-Gg: ASbGncuABIk8+ZiZzL7pfjbKMlBceyMvCn++bAVgfu2sTyEQhL9ga5w2DV8CD76QjD1
	vpJ2T8iX1cPa/XESJtCcA/eveyeyaYUPkvYNqLpdsPyky/ryDLZzgCylUZ7Ht6EGXbzBi8WMGqf
	m14MQaQ09VInM9KPVoWe6i7Bo2pTeUmp0LCxENAGQCKW4YNxLkMn1o+E4jmo5yEbtF/JuA3KWYM
	woX6L/mgnq7vFWKOlieP8pm2xcr/iE/qD8tKVMOEAC42yfunnnfVoc8pDjSFYA73QrMdTjONVOD
	hU85LdTQN+qarCms2z2uPYsPMXWgtjO+izo8iCvxchKXJKWuFklBJs8n+3ZU6R1Uv3x2JfCrir1
	/4g3n4h9Lj1OmgCHafFTf9AT9loy10K8GeNS29D93F/abqRTOqkioBfeMDJAZevbCUsRjQg4R5K
	i4dBsPCC7zoQ==
X-Google-Smtp-Source: AGHT+IEfUMMtqB0bhkhL0gj5Ig+FeOUTrhBZAFyF9owq3FJPGQALfGZUkSO+nlRFF81/4Zl757VY9g==
X-Received: by 2002:a05:6a00:9a9:b0:7aa:a2a8:980f with SMTP id d2e1a72fcca58-7ba3b4ab38bmr229629b3a.20.1763053632940;
        Thu, 13 Nov 2025 09:07:12 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:648:4280:48f0::76e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92772e713sm2770885b3a.54.2025.11.13.09.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 09:07:12 -0800 (PST)
From: Vincent Li <vincent.mc.li@gmail.com>
To: Chenghao Duan <duanchenghao@kylinos.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev
Cc: Vincent Li <vincent.mc.li@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] LoongArch: BPF: Disable bpf trampoline kernel module function trace
Date: Thu, 13 Nov 2025 09:06:51 -0800
Message-Id: <20251113170651.367092-1-vincent.mc.li@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current LoongArch BPF trampoline implementation is incompatible
with tracing functions in kernel modules. This causes several severe
and user-visible problems:

* Kernel lockups when a BPF program is attached to a module function [0].
* The `bpf_selftests/module_attach` test fails consistently.
* Critical kernel modules like WireGuard experience traffic disruption
  when their functions are traced with fentry [1].

Given the severity and the potential for other unknown side-effects,
it is safest to disable the feature entirely for now. This patch
prevents the BPF subsystem from allowing trampoline attachments to
module functions on LoongArch.

This is a temporary mitigation until the core issues in the trampoline
code for module handling can be identified and fixed.

[root@fedora bpf]# ./test_progs -a module_attach -v
bpf_testmod.ko is already unloaded.
Loading bpf_testmod.ko...
Successfully loaded bpf_testmod.ko.
test_module_attach:PASS:skel_open 0 nsec
test_module_attach:PASS:set_attach_target 0 nsec
test_module_attach:PASS:set_attach_target_explicit 0 nsec
test_module_attach:PASS:skel_load 0 nsec
libbpf: prog 'handle_fentry': failed to attach: -ENOTSUPP
libbpf: prog 'handle_fentry': failed to auto-attach: -ENOTSUPP
test_module_attach:FAIL:skel_attach skeleton attach failed: -524
Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
Successfully unloaded bpf_testmod.ko.

[0]: https://lore.kernel.org/loongarch/CAK3+h2wDmpC-hP4u4pJY8T-yfKyk4yRzpu2LMO+C13FMT58oqQ@mail.gmail.com/
[1]: https://lore.kernel.org/loongarch/CAK3+h2wYcpc+OwdLDUBvg2rF9rvvyc5amfHT-KcFaK93uoELPg@mail.gmail.com/

Cc: stable@vger.kernel.org
Fixes: f9b6b41f0cf3 (“LoongArch: BPF: Add basic bpf trampoline support”)
Acked-by: Hengqi Chen <hengqi.chen@gmail.com>
Signed-off-by: Vincent Li <vincent.mc.li@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index cbe53d0b7fb0..49c1d4b95404 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1624,6 +1624,9 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	/* Direct jump skips 5 NOP instructions */
 	else if (is_bpf_text_address((unsigned long)orig_call))
 		orig_call += LOONGARCH_BPF_FENTRY_NBYTES;
+	/* Module tracing not supported - causes kernel lockups */
+	else if (is_module_text_address((unsigned long)orig_call))
+		return -ENOTSUPP;
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		move_addr(ctx, LOONGARCH_GPR_A0, (const u64)im);
-- 
2.38.1

