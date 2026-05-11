Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C743C5544
	for <loongarch@lists.linux.dev>; Mon, 11 May 2026 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496398; cv=none; b=XzSSHY+vvF/sPRdM/RGDiARdFeYIBZWk4QtmLBWc0cGZHjVwopJME9QqZ7XZ3+GWFGD0hvcYwTT6a/YQ6yAv61ROUZco94Z8Bul7uOpVlTfA4B9TskxeHs+6du1YgHnHdz9Sdg3CrcwSZH3zLWsAVS5Q8JoJ/dzJH0B0OQtSPzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496398; c=relaxed/simple;
	bh=Y5mUbefp9XBFg6fpQ787wEyH+xfV2Y7Jsw0fmz0xXRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kzxaC1KB3uLfQA2wIw19EC67FZI4v/jkBHcsYAflNdtOZgXRqlDYJTpazncv0raWqb/RpzgrWF66hPeuJWieevCf8RqcPiddDkwc1reucuM1+ietzo0xNhlzonXPC1c/EeJg22ZBktkOO7l9jSp1RSqDO25EQLKuznxfsKY8Ku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=tX9mHcpE; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="tX9mHcpE"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82748257f5fso3048969b3a.1
        for <loongarch@lists.linux.dev>; Mon, 11 May 2026 03:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1778496396; x=1779101196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HkqpHwr57m2TFfldzHKpZdrF2VStUjZkl//5CCmr3Dc=;
        b=tX9mHcpEjZ1mpQwRuP614CRIZm+1HNc/k/j5mvWUYLSq7Wrr5tWHIif8tasc0+QXF4
         VCaoY3o089ecvFzRS03JhzIOtRuwrj5NBGL5rpF8eF7dbtE8bM6ai8sKkDTvsWrkLFJ6
         wdM9v0Q+xLNYVrZ5lKKqIjbXquq9kaFA8fCDofuM138+wS3XIEWOLVsthm3hRrKSVcD3
         yrdsgSZLSSK7+bpPZwnz29YacrX+MbKi4Ew6xnEgDwCSlhbhgAKtefAhV2rNw1vQ7jC1
         z4hOqzZuUXtDui2kaBQKicxYujUOuziT5bPpADE+EucqQPJSptnZjLu6Qmpsvi8fgRFM
         jwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496396; x=1779101196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkqpHwr57m2TFfldzHKpZdrF2VStUjZkl//5CCmr3Dc=;
        b=PLRNvVfTWsKiCyTBQgmlKCDlArYYKNvpDzS3ClwrMXtu0VJv1yIuu8lCUM+Y1U6Dhl
         rQmR/365uo42lOVxXdYvU2YK+VtGIb/abmKTVuhhGyflb33RoUsBwlcxN1lZvOg1yRbd
         2e6mfcQMPCIIJHXw8p0B0EpYqn5OTDJmXV/lyEdn3tE/OiVkr9iO1T9ncor7FqbsfOhK
         zDOcWfuOFfyB0Z0XvpQsxV8Oo9vjLiUQZEDkVIUIS808j2vdzNQXQvzZiZqAd3u6WVlW
         L9SBKprDoJHX8Hv8O8Byuokh35xh6QSCF+ZaLH8mufg4KkRxFgxSbd4nwE5w2dvroP5i
         DXFw==
X-Forwarded-Encrypted: i=1; AFNElJ/mrThsWnEOxWny4y/XHs7rtJDlzQI16MEDuRlgLLcyC9kpgajTAW8XPPVLYyqCHvJrPu4gegfVNFM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmU/8DdfsAv7zY+/7DlhCuqzReS0FuvSecitXoPKPP5TcKuxxc
	HfVjzXAolbVShgFiKOw+ixF/C0so/7iHnJE8VxP6Oan+RgzsGO+fXGslMeeIXVk74Rk=
X-Gm-Gg: Acq92OEh0eNmvwoCFPxQJsh2VtXommelsF21Ve0AHYSCedsXC52XP80iZj4t+9tUqnV
	5bHQtBN4YZbJHMcMFEdT+FHtKugMZcMHBSZT/QU3OeKJtAT1YK19td0+1NCZQI5E5pdThDcSoHl
	NmkqSGAovDUCxPlzUKSqoqi0CHaJeKiIBuODolnjbxIlhhuhc91OsqtIZhlzzdzxX4ESCueZt0j
	ViJt2Oh25wLBy7tY5gs4vLT4jQ73UaNMWN19Z2kZ2tQTkp5jim6Je43FoCVcQ72wEQLUqjN3tt9
	GTMtZ8w4AtwSv/EgqbkcO5sTUV1xjTMZ8u3oBJIm+6T01KDTOkFpU57posgCv7fgqWl1ofOsdGx
	TjqcI2ZqrjekqEVkbUwFAIJghPv5qSZ3x3WAh8dZvQxNgmllNXkYb6FJtruZlCMjquw1m2dAp5c
	gpIS3yvKjC
X-Received: by 2002:a05:6a00:a214:b0:838:1f6b:dcbc with SMTP id d2e1a72fcca58-83bb65f3f6dmr14902315b3a.6.1778496396421;
        Mon, 11 May 2026 03:46:36 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de3f:344e:4435:2c77:3920])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c861esm24927599b3a.30.2026.05.11.03.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:46:35 -0700 (PDT)
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
Subject: [PATCH v5 0/3] LoongArch: Move KASLR to EFI stub to avoid initrd overlap
Date: Mon, 11 May 2026 18:45:52 +0800
Message-ID: <20260511104555.196270-1-r@hev.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since [v4]:
  * Add a comment above kaslr_disabled() introducing the terms
    "strictly-defined KASLR" and "broadly-defined KASLR", and
    explaining what kaslr_disabled() returns. (Huacai Chen)
  * Set efi_nokaslr when "resume=<devname>" is present, since
    LoongArch hibernation does not support KASLR. (Huacai Chen)
  * Adjust local variable declarations, comment wording, and
    function placement. (Huacai Chen)

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

[v4]: https://lore.kernel.org/loongarch/20260429120300.1786210-1-r@hev.cc
[v3]: https://lore.kernel.org/loongarch/20260429051318.1581350-1-r@hev.cc
[v2]: https://lore.kernel.org/loongarch/20260428040159.1065822-1-r@hev.cc
[v1]: https://lore.kernel.org/loongarch/20260427104721.47724-1-r@hev.cc

WANG Rui (3):
  efi/loongarch: Randomize kernel preferred address for KASLR
  LoongArch: Skip relocation-time KASLR if already applied
  LoongArch: Avoid initrd overlap during kernel relocation

 arch/loongarch/include/asm/efi.h              |  4 +-
 arch/loongarch/kernel/relocate.c              | 50 +++++++++++++++++++
 .../firmware/efi/libstub/efi-stub-helper.c    |  4 ++
 drivers/firmware/efi/libstub/loongarch.c      | 16 ++++++
 4 files changed, 73 insertions(+), 1 deletion(-)

-- 
2.54.0

