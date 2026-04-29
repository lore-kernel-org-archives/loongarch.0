Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984E833AD9A
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 05:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777439640; cv=none; b=M1Ubjz7OosWm6zouZRr2gSUmmMfB9nfkXnvFdARuIHM5hH2hHHzY5Zp6EFe0F42G5ozMuLeWTqo+/c3hd+LTiIrTvgmo5Jek/5RrSQWnrsWDzGYLzYDu3A3T7FnoQgzsuEi4Oz1W4fb+F51lB4qvn6GdJ68N48fqGjggsCKMl+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777439640; c=relaxed/simple;
	bh=fLx7XKHTHH6UDvhEAPenncyVd6XtMyelO2DdvXwhRGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NWuDr4xOB9BFfJlX2H/z9jK5n0CttmvDyJHCaQe5G7niEBCVL9Zt8+ZIf/oSDXbmuMib/fjpLtiKGbniyKLH0ZSCsbkS3EznaMPom6GbzgJ9XinPkVFx2E0cbczjqdJnYSIRAOJ9zkq4mujW4nZiUlCwl3anNtEOZxeU/P2DIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=gA0E0z9J; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="gA0E0z9J"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ad9516a653so61774245ad.0
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 22:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777439639; x=1778044439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bM1p8teMQ8tc32DGf5XZZMDcKwPJm9rYVZ05iIFpvhU=;
        b=gA0E0z9JfNgk9P5OmSpbrPeN7GCtCeCg8NZayXnAko2/3H2+hG+L4qOzYLBP/Ltu1g
         7PRaW+NNF5dDtuYRjE5mMRrDBzgAj06RIWPHiONdwqoZ5oxoIwQxLGAjix20ldbQ1bPe
         bkMRrWFUeWMvpd9h+M98cQhO9eNGzPgCEYaYQpZjCSne/IMQaU0rMh6piYczndKLJHVZ
         Tuw9xASFigzOM9778B/F30eKn+yWKirl+Cqzja/FHrQkM1Xh8hljNGolqLdepprxxs3/
         iU6jZ/ttnluQxLPeIu1pxD5TTS1Fk2Bk0clpOnCay8kRedZH02x2bGf3RzFnOsKaAfyb
         neMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777439639; x=1778044439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bM1p8teMQ8tc32DGf5XZZMDcKwPJm9rYVZ05iIFpvhU=;
        b=aP/Q6X3U80uAOWJnkmG5trPYnppZgTnt25HnantVs9z5IprTb0hW7SBvwZvBC/mi7A
         EnqMWyONs29ZeRzYwYFSxo6fQQCaDpbVJ8OZxuDxScCxJsapDIDCfm96phpRSYbK63Qm
         C4UWlqtUlwk0lmzzPA2fohBrs4PLhjEOQMopegopNVF0RTPIgILujcR7zoannDkjDg8J
         c/WhUO6oz+/LbzrXkhEdvIMIHhdujSNRJo8qXjWgASurnpiwZ0J0Wywcr881nifgnnb7
         cOp4HdPJGC+7gZoNaU/sQvj184R5pAMcMy5mD/l0ze4DTjjsq3SXEiaAhEyI7/XvALVQ
         oY/w==
X-Forwarded-Encrypted: i=1; AFNElJ9soa1fyGNcDXGlYZRB8KOoBz0YYyrsSK3eQ4GU2Qz+kXOSGjgr4SZggPOKtEtboLDt8u9JXGyUqRM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCaZeeEImpyVGeUVmQx74y0WzV3V4zhXKhDa3R0oYU2JrHhxZh
	JUSo8oTgbC3SqhyJIegV9r9C7K2VSdZ3S8X5oqPDXNBM+pXghB3YJFu4ocT3l/vHyBg=
X-Gm-Gg: AeBDieuHjJKsDVJYExksnGf/P5ZQrTDlIqrM+UWeJjyNzxbDVygpgQSScrR5+vExywv
	a3quRnoZu7aQTHSk5RM56Xvs+X/1qlYqw40PALLTWinv02YACqCpJll2LFq5iO09dX//Un2JGkx
	85o1nlX0YOykEFMIarB21G+kLiVuG4mIlRO53cAJhJZfHsUpLJuIpJoObrwzF/XTakx9SJGXjMl
	pYUdJzYUK1gcRgZF7xSegYHPY0M0NsWczVLGMe2f5n+gr9p6uI5XB7TqVUkB73lBByJ8c+6xWu+
	hir3XLMFhf5XRceO1ODv9Qf/7k3L9JSFwwUw0pA6Alad5z+vOAVAEm06qNTsbaOmlGBUDeI+yPm
	+++tCaWQZHYmVDxhOeg3OlEeDsppD3QLbnfwZHu1+r+bDeX91ck3RH4Zpk9hcjHt2rj3hLY4vCV
	UkJU9XHXpXBK548Cq1ZQ==
X-Received: by 2002:a17:903:1b66:b0:2ae:8253:1452 with SMTP id d9443c01a7336-2b98734184amr21843565ad.11.1777439638849;
        Tue, 28 Apr 2026 22:13:58 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de33:3dbd:69cf:4a22:309])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988787360sm8846935ad.20.2026.04.28.22.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:13:58 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Haiyong Sun <sunhaiyong@loongson.cn>,
	Lisa Robinson <lisa@bytefly.space>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [PATCH v3 0/3] LoongArch: Move KASLR to EFI stub to avoid initrd overlap
Date: Wed, 29 Apr 2026 13:13:15 +0800
Message-ID: <20260429051318.1581350-1-r@hev.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since [v2]:
  * Add a new patch to prevent initrd overlap during relocation.
  * Revert changes to the CONFIG_RANDOMIZE_BASE_MAX_OFFSET range.

Changes since [v1]:
  * Drop the patch "LoongArch: Allow rdtime_h() and rdtime_l() in 64-bit builds".
  * Use random_get_entropy() instead of rdtime_l().

This series addresses a potential overlap issue between the kernel
image and the initrd when KASLR is enabled.

In the normal boot flow, the bootloader is responsible for loading
both vmlinux and the initrd, and it can guarantee that the two do
not overlap in memory. However, this assumption only holds as long
as neither image changes its location afterwards.

The in-kernel KASLR implementation breaks that assumption. When the
initrd is placed close to the kernel image, randomizing the kernel
location at runtime may move it into the initrd region, leading to
memory corruption early during boot.

To fix this, this series moves the KASLR logic out of the kernel
proper and into the EFI stub. With this change, the final placement
of both the kernel image and the initrd is determined by the EFI
memory allocator. This ensures that the two allocations are
coordinated and cannot overlap.

Functionally, the kernel still supports KASLR as before, but the
randomization now happens before the kernel is entered, rather than
during early kernel relocation.

[v2]: https://lore.kernel.org/loongarch/20260428040159.1065822-1-r@hev.cc
[v1]: https://lore.kernel.org/loongarch/20260427104721.47724-1-r@hev.cc

WANG Rui (3):
  efi/loongarch: Randomize kernel preferred address for KASLR
  LoongArch: Skip relocation-time KASLR if it has already been applied
  LoongArch: Avoid initrd overlap during kernel relocation

 arch/loongarch/include/asm/efi.h         |  4 +-
 arch/loongarch/kernel/relocate.c         | 49 ++++++++++++++++++++++++
 drivers/firmware/efi/libstub/loongarch.c | 16 ++++++++
 3 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.54.0

