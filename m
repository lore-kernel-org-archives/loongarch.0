Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A1F21255E
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758074150; cv=none; b=BH+16I6mEEUt/Tp2mxwNkK9DOe2VnPv/BizlOq23CvInR3zjK7OXq40BRqn0j0PQKNbgA35kivhshEF4qre1RGtUT4ovsJ7tpS7kvqdIPGMtqDYVRiDmQbhj1sEwgJJvoqQbGUOByTSOug7pPf5RJyJZ12+y5fU2DjWabJWzfAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758074150; c=relaxed/simple;
	bh=ncHCnrnycW16MMAxELB1xZy/QO2XTlz5Cj+ffFSDYJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9XIiWzzZpDwdkJyE2CZxSoDQY7jPysKhmoB1Fjs3ErAKpPAkHgR26RX/UeFxPlvwC69dcna4P84Rn2cfpXBzuLxEy6+iZLImnQz6mIWKn9boik5PhG7X2ekZqQsBWiYhKx3iKVlqvE8bj8nRBDrw4/V7xoHTeGXtBUuuuilZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHWQ2i1M; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHWQ2i1M"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-267a5aeb9f1so17683585ad.1
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 18:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758074149; x=1758678949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWOwPbM2fUTpsZY/pQNuzJg4wvjHz9XRhdTCKAJ8AeU=;
        b=jHWQ2i1MHXL8igCyw2l6GU0XsO1DeMYJl2GJE9nIWT+z/b5UcRocvef9QnaXmB9ldx
         8rUNfZDJXzKrEnYa/Qdj6oDOmgsjkA3LmkrtM6Kt1T3rBB/VFpz15J7FLmqgRKCIN6xn
         MG05cBptEg+7N9nM3Z2tDb/bMkJ2ptJgXgT3htyOjxvfbeaSDJWPqyWUbAXuJt1hV/9Y
         /RRzsRDEAitv/TH2L0MYy8oECuddIgiVG4egPDU+HhjNEOc5tbQtFPwV1TCoMVtXKaD7
         Pmmdia1gdh42Gxi2tj1ucETOTZwVZj7hp+O0fYht2yhgKJaddtrhxAb9cOWVhDFRU/UF
         sk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758074149; x=1758678949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWOwPbM2fUTpsZY/pQNuzJg4wvjHz9XRhdTCKAJ8AeU=;
        b=BwMztGFfqGCtTlKDvIEXyGN9qCzLSSx0o5to4kS4JgTC73GUZXCLrRaXO+vBGnFyKz
         bVh4AUk4qlQEUYJf4ueh/A90sOLBV8yfFAq1opfJCgd+r6JP+MOf4hIWS6vcNicsKxcW
         DeHQtQKBMmmm8MpIIoMbNp3e3Ch0EJDbxuzwo6nghfX95obF7Lj5AhbW9u09jR/XpY1X
         TXyudC9bSD3r0KworGxDrIRsbK/zmt2fA5YLnRbmgtRheJRHgAT039hxZBUVwepd9m8j
         NljF+azQ1plYWkpfQMR/ObkKizZFZcuMKNEJBJ3XYQOdMBVv2dzWOVpy3+JtQXoWu7Ae
         eJmw==
X-Gm-Message-State: AOJu0Yw7L9d3YOE9lAkDlXeWIJ0cAMnCDqn3S10mb/n3flL2+RDxUNkX
	8SDjjmRAyf67cmd0QxCyMqf7cnFABg+VJogHyHCHoJGw8l7usDRaZDIiIOvsQu8O
X-Gm-Gg: ASbGncv8Ofwjv1k21xwX1twLndlYUGtKdcrNteSuSUr0I26tkLbQyThbGEPopu8WlVG
	aQ0ixNYcwuKLG/VruoeAc2RplkkFDVZj9DHWQ6FztVgdc86HSGdrIkeHhxq/QoYjGYFThOZsf5b
	k0F06io18XrwmxRUKdDYjP9yvoKR0Ou/MS3oJOxKUpB0eVfxhuhIWt4nSWbilumSbzr4gdAAhQc
	jsRB1TNDQP78Gc19ujiAbyl1PTPtaCJQwIlBx13mv+udQB4FIBIC1kMFwoYJ/cOKm7rl611l0Xj
	/4PEP+ipawxZNJXvtxlpEhMlmZltmSsPDN/tO5UW4NYBubIhpV0qcylzcTHm4lLfE/Ty1Ecz8Ji
	Ot9QhOLxpln8v532vWOHD1rdWr91hYsSpN3md8Bg=
X-Google-Smtp-Source: AGHT+IFvQcT3+jfC2+CaxGa82a2M4nHwGLIr2HhZQ1GpAD5eLglXfwZZq0JSEaLPWXd2q9vAk02UsA==
X-Received: by 2002:a17:902:fc50:b0:24c:786a:d7ac with SMTP id d9443c01a7336-26813be78a6mr4288625ad.47.1758074148639;
        Tue, 16 Sep 2025 18:55:48 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed278b065sm839746a91.29.2025.09.16.18.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 18:55:48 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v5 2/8] LoongArch: BPF: Remove duplicated bpf_flush_icache()
Date: Tue, 16 Sep 2025 23:56:21 +0000
Message-ID: <20250916235627.102831-3-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916235627.102831-1-hengqi.chen@gmail.com>
References: <20250916235627.102831-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bpf_flush_icache() is called by bpf_arch_text_copy()
already. So remove it. This has been done in arm64 and riscv.

Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 77033947f1b2..9155f9e725a1 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1721,7 +1721,6 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
 		goto out;
 	}
 
-	bpf_flush_icache(ro_image, ro_image_end);
 out:
 	kvfree(image);
 	return ret < 0 ? ret : size;
-- 
2.43.5

