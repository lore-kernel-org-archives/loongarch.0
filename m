Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8894B320CB1
	for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204972; cv=none; b=TxSoub+jcDDW0qJlbeGu13GsVuvNeSVUTog+H+PlrOcdjIsTAqcSgfFfpDtcYLzpZUhK4/8mHboALikLnNUZfvKxGSIlOw/7jo+z2QWj/37SvhuHkZqp30/e86/5IzvWk6MR+vbu37Wz07qDp8qFL87R8W6M0HXebIub5iPG8EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204972; c=relaxed/simple;
	bh=kRcVXv28tDnvQzXVvyODGNAJffBkNrvU5IYCATY2cz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WcgoqQDmhkTJ6DhjX+7/ReIazdSGo1Vivg8qw0dJOd72f36CBfLoG+ErZqcKNkt1VI87zO+sViVlkruM2XhOuX9APQU9/07J34mgu4UOeQHg8nOwKnVyUbZ/QiEwphBe8bETaD6hEFg7oezj4o/h9wyO+UWXbo+C4Er89eqTu9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=kzoUzV2E; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="kzoUzV2E"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-362ddc1de56so2162560a91.1
        for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777204971; x=1777809771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ghTQEcleXWHPOaZ8rEPzzwQ8WxO8nfCzXA22IKrt/r4=;
        b=kzoUzV2ET9kZHVvWL1VCYFv0r7MfOCUF3FglqlEHua5P5g/Ddp6X1QgFK8KCiGIsKL
         6ZnvgAj7sEPGvFdrJ8KcDjf9OB/klmyjkxUAdI2oNVHh2dvEafvZ3zrZukvitZtulxUX
         JeqoMYq5KZbemxGijYSAGRSMAAD2OJrYMoB2evytdKHHYU9Qj+iTem6eazfRIeDae9ql
         +OIUms85K0RizqrTo8HeGcXr+Gjww7ZNFiJ/fZRtjLAJbGOr0jN9MQ4Ma/qlNIy/RLbp
         7RSKlfh2YsUS6319lAM2ETnvCDTZLdxMvj2g0jHL7abD5FiX5oaUEmhmMFrJ4KR0SxGY
         XDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204971; x=1777809771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghTQEcleXWHPOaZ8rEPzzwQ8WxO8nfCzXA22IKrt/r4=;
        b=qP5hPg1AT9Ro8sDqQ6sZ6WkXUmV6jvicl+PrZ3Wy/IZwEcQZq3I9Lcwdgp3uvx77XH
         XwV9uvA5iaSPGS9p++KkiW+Z7ynlx3Z4vkkplL/T5+RzYdcN9URMW38+9ArjgrGWc3oT
         bC2MVm16aI3vnYNZaT88U1jGefGJ+N+UvvXJxJaxCM8uR27VO6zOno7pYspTZ4PaVheu
         T4keaPcoUNZKzi5Pzezen7ua4JlU4DYYw3SPM9gj1q8+ENE79IcvCh8JPZBpqS4CrACo
         4n9xc974ptv+Y8hmEWE6saD7IiQR23r3gjHfbyHwlxmfN5HJr6WhtzJyXoF6qMUFs+JL
         pR6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9/XVQwNsMgsHiADZkWsOWNGs4RVLLstxVv8UEtw8VzDLD6FZ+01LCP81VzDrzHpZNh18QD3RrE+Jg=@lists.linux.dev
X-Gm-Message-State: AOJu0YztUu6xSoEVAO21iBgzpjCU/zj+Vy4lhBrBBChhQkKwblUir8MA
	beyrXF8rOMQlAZelKeO/YSTafy6ah4FLUuAOeBIJ9yjm1j8EpZwlbIYjVPTPr1iIf2g=
X-Gm-Gg: AeBDieuLQMy3CMFgSWSP91MLl3O/FvrKSVdxREGbktp6768elHr/r7/mmCvRY+28XDV
	afd3dTSOAt+ZKGQDZndFSvQ3A3TGZ0R/jKdxW0Gt3bjVVq/kca9fzQ7faYb1tLI4Akd6xpVp4Xl
	lIfdeSuBeOxGUaWqLwcugBNX5YANBVySYhMSASfYrQzr6tnsbPT+d5llM5ooMVsw/pp2uxxPvvX
	peom6C5s8GLi1ubZSkaWGhDw9Wau5gHSGSxxt1/JKAKc3t4IQkxTA4UpVLgAxl+hKGVnOEDU2au
	ZrCz2TyA1Csky38oEp3BS1PC6E8jjZRCaW/N9nD7r1PSb5D99xY6Bb74Xhrt5lkZpIiEk0C/Vyg
	nmHpUtf8t94nYvFyKTiAB6CNdkoDcIz1/P/2SRomCwuIrzA9moMt6VkW8Z5M8Mi9AMmzlaBfxTc
	ZAZN9mgd3lihZuAVZkAnU=
X-Received: by 2002:a17:90b:1dc2:b0:35f:b306:5d47 with SMTP id 98e67ed59e1d1-361403af9c4mr41043913a91.1.1777204970795;
        Sun, 26 Apr 2026 05:02:50 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de3c:3085:4d80:3614:2212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab297c8sm263413965ad.67.2026.04.26.05.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 05:02:50 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [RFC PATCH 0/3] LoongArch: Move KASLR to EFI stub to avoid initrd overlap
Date: Sun, 26 Apr 2026 20:02:28 +0800
Message-ID: <20260426120231.532644-1-r@hev.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

WANG Rui (3):
  LoongArch: Allow rdtime_h and rdtime_l in 64-bit builds
  efi/loongarch: Randomize kernel preferred address for KASLR
  LoongArch: Remove KASLR handling from relocate_kernel()

 arch/loongarch/include/asm/efi.h         |   4 +-
 arch/loongarch/include/asm/loongarch.h   |   6 -
 arch/loongarch/include/asm/setup.h       |   2 +-
 arch/loongarch/kernel/head.S             |  12 --
 arch/loongarch/kernel/relocate.c         | 182 +----------------------
 drivers/firmware/efi/libstub/loongarch.c |  15 ++
 6 files changed, 24 insertions(+), 197 deletions(-)

-- 
2.54.0

