Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675531632C8
	for <loongarch@lists.linux.dev>; Mon,  6 Oct 2025 05:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759728832; cv=none; b=EELqso24khlosel2W3u/d6BmdSlvQ7A98I4hvPyv91ZK8+fti5+R2J302LbGuBtGQ/F4V+EGsw04IotNcMpaL5dafIATTrKFOvagyK63gAX38g3TQXzOH6LsKBXSdblp/AK1yp3GOz2EZ8HbU69/e++Xo8gYc4KJv8gQys99JXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759728832; c=relaxed/simple;
	bh=4tbZvjEP9XmhrT+6N5knI4Y3OlMwyizU8KI18o+ilkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvC6GUcxDWerY0sZ4E0Kko7zjv4EgWyBwTUTM1R5Vn0+WdA5LMeetnxLf4cRi9Ug9UdRwzDaUfq1wYFPAE1PkyWJIjIJy9LpA+mD7u128PSnHdeuANiUIBqs1Yr4Muz+OFiuOzm5j/HeFbAde7Bk7DTtXjJzOqkXQVoBbwHvGS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/4kOwJ5; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/4kOwJ5"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b5506b28c98so3107313a12.1
        for <loongarch@lists.linux.dev>; Sun, 05 Oct 2025 22:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759728830; x=1760333630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDzkQOkkfVeKM89O1rbqmP7AjMiVrgvPqNbXkDHoP+0=;
        b=K/4kOwJ5fT2Jt1UMoaA3MlWSxob4KJUEr+Ei6+bRCl1H76ZhCIJj6YClqS0znlsAzA
         bvNGiVwFh0dz+d/yd0dPkIXD5X4cu5XOHqWpi7gnoOHlyGsnueDrZ/dP+moFHuq0x/B3
         QyK1RnotmIzATLlHlLfkJLK6UTuMUN9YxcFHA6l8naxzNqaiaPc9WJJBBmDfW/Rx4MUz
         jNzHsuJRUgllAxwAcbbRzn2LXSs3XT+i32Y8mKmG3dxoyNH7HcypDHeW8gmSH6lRHpZG
         EFKQubpzaKt4i4456MF0z89Y3xqXVjB0XgHjIezIbPsXakwO9V0G/y3vb+O5axyPlnSl
         IAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759728830; x=1760333630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDzkQOkkfVeKM89O1rbqmP7AjMiVrgvPqNbXkDHoP+0=;
        b=f6fEcNp9Tf4rZ04YiwahGhb4849bkmSJbajL9xCWow/PL/Aa/FNEnv+m5THCprxO9T
         fQ2w3NNy0/9Sf58AUUyLv3XOu0UimdJaA3zX7GnAGw++ihGqaQDWWxpmkFHSo2hAC3GU
         M7C5K/mJEkNoDZNc/T9eLW9ipQxGNB1YqVWI5kuPGSifXVRy87igzmetj/t/vFLUG4Ba
         60LMBsPC3aDRdZ03f10NnAXH1tDp3iDNO60RTwSCSmhMcCxhQLul3HpNmoe+UlpyLaU6
         iNkU+HjVyTPCcXqumZeXmQTOHlKaH4Z2+mjTjkM/rWxiAPpSZdhG9269XzsYowOkVeKO
         bfqw==
X-Gm-Message-State: AOJu0Yw9vkUsGiD2/KGcYDUEsoB9ojfoxl6pXJ5BwEyHExDS3UDnn7qO
	N2LUQ5bgW/5bGUEyTzUV5dMnRm0qHjWTmfQmpsjSfsGTGmMrU1d/QAKi
X-Gm-Gg: ASbGnctzQsH2HYEtkSjrfDArAGXP0tLWfPAyB8ObrjiMVfDwD2dDJKSXc/B5BdMvmMT
	LOVSndpTpZu2c05wfKyaXFm1qU3mU2GBSyocEcZyZYHYY0yxKrjYZRprcUK0k7j0YVgUWzKZyup
	95xeXLw74P5P/8OFy03PD6tdVpXYtPn9p7bw5/0DjKbQJ4UDrMErWy6OhXn7Hiuo0nyhLyLcHuz
	NDdYl4zv9EEMvv/1KoFnPFAqpwQFIXDfvJsvfDWTKvY5KnMYvUdgHz/L87p+abQAOS4Hc5Juhr9
	3pJRt4DDNvUuRtr8VbJry1MFdzySj1i26abtRYJQE2Sh0GbCP9dgzm8bQAFNSFZjmUCAwaG485w
	jslKCSJcF3qwrLCKcLs7C+dtyq64DiFp7Qrp8JDS7/NQOqEewxsyKovgnK+PvPXmCPA==
X-Google-Smtp-Source: AGHT+IE3q3kenghoSrNvros81GEbQ9Ao6r0E2bmuhF+kUwVTrDx46rcAcaI1QnQ3weYNApaNBl/fMQ==
X-Received: by 2002:a17:902:f612:b0:280:4b60:5570 with SMTP id d9443c01a7336-28e9a65167emr135438445ad.52.1759728829602;
        Sun, 05 Oct 2025 22:33:49 -0700 (PDT)
Received: from devbox.. ([116.16.231.215])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b88fcsm120187075ad.84.2025.10.05.22.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 22:33:49 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 3/7] LoongArch: BPF: Sign extend kfunc call arguments
Date: Mon,  6 Oct 2025 05:33:19 +0000
Message-ID: <20251006053323.193581-4-hengqi.chen@gmail.com>
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

The kfunc calls are native calls so they should follow
LoongArch calling conventions. Sign extend its arguments
properly to avoid kernel panic.

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 579957b4d40a..83e623ce2908 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -983,6 +983,22 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			emit_insn(ctx, ldd, REG_TCC, LOONGARCH_GPR_SP, tcc_ptr_off);
 		}
 
+		if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL) {
+			const struct btf_func_model *fm;
+			int idx;
+
+			fm = bpf_jit_find_kfunc_model(ctx->prog, insn);
+			if (!fm)
+				return -EINVAL;
+
+			for (idx = 0; idx < fm->nr_args; idx++) {
+				u8 reg = regmap[BPF_REG_1 + idx];
+
+				sign_extend(ctx, reg, reg, fm->arg_size[idx],
+					    fm->arg_flags[idx] & BTF_FMODEL_SIGNED_ARG);
+			}
+		}
+
 		move_addr(ctx, t1, func_addr);
 		emit_insn(ctx, jirl, LOONGARCH_GPR_RA, t1, 0);
 
-- 
2.43.5

