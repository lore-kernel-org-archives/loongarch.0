Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146EE3F54C5
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 12:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464219; cv=none; b=e1JrWbwme29wteePtHjViRKuP/mWzFrgvN8mtl8WVaNf0EbpwIYntncmcomWiBZUjHwTU3jXuH+GnavYxjxgLWITDaUM2U0995sNkNVCNKdoc0e7R0o8OyKvoV4xXfddDV5ozhu0hLfUTKJkFfA0nlA1BjsK03Hp0ErPxMMhUTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464219; c=relaxed/simple;
	bh=stpTmU7S/OiOZ1k50FUfkHZaoNqcsoeBAFBDz9JYs/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GENoxxp0giWI3hCMyTRY/MsXKgyuxOYoTKRaAVj5fAJKvgPO4q1Wg0E53I1qv6avC2R8Mj0lGh22FWL6YF1W05DOhUs5GXInGR1Bfh1OVmJSFD6glZ+lueJdfDh9YJ0QB8WNP+ivMUKr0/ep4Sqf4EWvnxD6MzV33x3my9xLhRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=bCCdOYAg; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="bCCdOYAg"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-824c9da9928so6060090b3a.3
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777464217; x=1778069017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zitPtmtf9h1hodlmn4/XOblxDn0DauzTlzLSukkp4sk=;
        b=bCCdOYAgWqRomlA+cVg+WmeFcrSybs09IQjBUrgUuD1z5OB9PlXqjnvbJ0OyfHVlhJ
         TiPuU/ow1uqZeIlwTrb1ezLCNSq5SgDHXoQxWDQ62dv4JskqCx+5oEWOiw1U3kpWeoYV
         Gbv6MFOshfT0pBbJnTNcRYJn9b+xrDhsRqn+W8vQwHqDa1G+WpQCXQtMdACCj7HbtFnW
         eQ/0Rl7AWorDLRMFFgf/P+L9CgA+m7DZ6dXZBRTLliztgRCrU/VMH4zQg5L6NmXHwKqR
         v3Yf+0xVudHgtNwHs7kFMDXRg/YRBijL7KrhzkD9IYPX0k5MCTXpmu8a/NK4gZ6mT92I
         +etQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777464217; x=1778069017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zitPtmtf9h1hodlmn4/XOblxDn0DauzTlzLSukkp4sk=;
        b=X9eybhjqy6a+aiaV4o6+wnrUxe4ke1J/7wtejRUrotyjfQGMe6Y5lTq2Dyk9A5BdMM
         jlLl/JFHjWWXx5OQ0NHRIEBcAxHErXppM76V75a2GXTNiZh/zm9G0vjgyebaXDKM+Ewg
         TLjyfLgrr9EuKNtYSDAKrJDEY+RV+3ObbBrWD5LXwr8ZzH8eUdmzdL9qhKSO2a48zzO0
         fueO8COBb0YRbsXRGeDZjQwNalkVJV0GmQT7JyH3XRzizRrW50++A49xut75GDmKIJu5
         Nw0p03fipZqmtpgX+ME8wW1bmJQ95+KXhI4w00cTEY1qQLuF7QaRS5BSrmrForUW35V2
         wmMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KwqgBGi7/FyVa8IAYRmCVzolQAz2axHIP/r1u5AYUM4QP4gl12WWHpoU7dWzfeUe/ycZFEYaM1DE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTW4JTe61MYq7obMZi09tRbtz3nEYcrk3LZxD24DaS7xmc5sR8
	JmIVHbz9/ZEdmzEGS9o48/wXInpg8DrLO0XIQ+5smD00Snj4gLSfBRCvfdYZ6vd3LKU=
X-Gm-Gg: AeBDievDvjQ1Fu5jKBcdMm+dCBLL7ysM8PXnAmEhPX/FCbquxujtmvAhmWLgBy//VR0
	Coqc3/K5sfxp5gCQf/Uw+ICCIcDCxAVOMwfc9JpfYRZgO2Gh77J2gSosN8JWfmoaC1WxE4LfOTa
	i9+qeKwNKEVtlv0jfqchV1WecN8Sl2BCdOVLgMrJXgVqwao94pQPJh0LMWgu3TtBcfNkYYBt2Ox
	4aIEO8jI5vAP9WyyH+5TjGZiCR8Q5DPsdrQaS7hDOWKMEesIE0OyiFEiwY+PE7o4B7vVxfUpfQE
	OqImOjMRhQKYcMTyY+rjd3QkfvAvKbhjuF/gIK0O4Qs+2y6Q6Gn4Ei23B4ebqy3IBI2b/0zV1s2
	4IAbTtuol/1IBARDCem1x6iwMiXAwSxkD80t8shkPohf+IZ19ib4lPK7cWcBgaD54Mk7NONzIfy
	hJQgCuEbFz6CbTqliiWA==
X-Received: by 2002:aa7:9067:0:b0:82c:21af:a7bf with SMTP id d2e1a72fcca58-834ddad8bc3mr7310658b3a.13.1777464217056;
        Wed, 29 Apr 2026 05:03:37 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de33:3dbd:69cf:4a22:309])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5efaaasm2016493b3a.27.2026.04.29.05.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:03:36 -0700 (PDT)
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
Subject: [PATCH v4 0/3] LoongArch: Move KASLR to EFI stub to avoid initrd overlap
Date: Wed, 29 Apr 2026 20:02:57 +0800
Message-ID: <20260429120300.1786210-1-r@hev.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since [v3]:
  * Minor cleanups based on review comments.

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

[v3]: https://lore.kernel.org/loongarch/20260429051318.1581350-1-r@hev.cc
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

