Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB02F3B2FF4
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777286860; cv=none; b=g/5S2JxSF3exk4vjnygSewDmUFcOIoHW+rXeioypUiF0rYw7ECDcV+bA11EbaOtmMNQ7JEM/VhuKSxWx4x1TeboNPrkjako5/s6wj1XNWg1cYykp+tpwmZ5lP2LH1bQkF0oCAGpx60it1aswg9l46UBqC4NBXfxaJJUw1zQnHiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777286860; c=relaxed/simple;
	bh=kcLRKUt6VV+0E3c3aZ/Ze6zUJANaEPNPvyoBX7yqlW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FX4ak92y5F3N7KLtHMYze81/xpZDXEerX7Arq9VnvVwpehV3sA+WB6276m/NNBglSGXvMxw5W+LqiQJx/Cxkm9Kw9sAHOzgGRoG3GQX1Zn9XxeG0Ee4sbzWFu03PMOCmQgl+R5jtyKqgQspy9J5hT5NTs/NZWPUMshoOqIWbr8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=T8shyFmr; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="T8shyFmr"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-362bb3260f1so4525773a91.2
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777286858; x=1777891658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBaDcbNtNJIr+4BqFmEontn2SIWukKG96vRmR4j4yIo=;
        b=T8shyFmr9Ya3xJM3Cx0opd/QoTnwO/AiK4AL1vYIo/2JC5b1w4mzm7sxb7N+vSX3i3
         HnHOwHmBM3ktl0UnV7OkfbsPLPHs1pd/n2w1vKQDmFLy+EV1fDEZlsMuXuvgRfdoZ7dl
         BPCQ9AleMxaTYXry9gBzfcvJYVLAa5dBwz2iwEWAyGzhrfTNrp+nV3W67b5WLPueWKhf
         CHsULhxwFiDOnmL1OZ4LwQJJWBaFKDVRLV6suHn7zlKDJzO5aLkxsDOligWZfd4Y9uki
         zL3MZ8JTpRud82J6TgDEbSXC5EEO82HxTj3Ys3d6TMQmmN4ow0QLNVr0IXA5CLbmn1Eo
         ExrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286858; x=1777891658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBaDcbNtNJIr+4BqFmEontn2SIWukKG96vRmR4j4yIo=;
        b=ZBxV1swmzfIYmGQEpV1urcCSBiLAIJo1NeOc7gkl4NAGVg5FzbokgZ1yAIGxB1PRWl
         jQhbc+A3qs3dRMyvP0WtdtykHsf8dGw8zlvjO+xzJbKu2Z9Q/zJyzUk3xBopaqbXfqlO
         zEimmq9im/Dtla2hKevw1Uc4MCdJT/MoJHCkeVFj+0wZjff7uG7uksqQUr97Y7vnp2jY
         uuqY8m/6Qp48v5sz+1QBxTNlugl0kYb5ZgE2GQz12mLlG0n+P1+erxQQiWx/TPlg0L8N
         sAGq3H6ebagjsb/soTU87YErpqKQDlcfbmbhT/papdpnhTObufYs5WtybheOFzd8wkMR
         Ry2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ceqi48QmheQfBjoxMZF1QADllIw+6z0N90VWySZUfLm4wEUYLvmpV+xyRqJjb8qH4GpK87y9K/Qs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx97lqNxMneG8xVahQ+SRRRqZaPyE/m4sN4bnAo5hHavUCml4+5
	ahlhKOIRKXFujDStM+/USzebg7NKpowgKKrKsuwRMpUgji0qHMiI1tiXGc3p0IW8uBI=
X-Gm-Gg: AeBDieui1KWaR3JG7Yv7oZbed7C98GwSdeBAygd1TgDiaSHM9VOxGrNbZnur1/GXDfF
	UxEA7CrMvb2gI9/8uSK3HeLhpjQlrgDto0cMtcP0FjgzjAQeeiQD7JjBKecfvSSL6a74LtS2uCd
	nfsA/wLjFpvd7e20vttGMvuz9ohVcLiVuBVuD4ZnIyGqm2xEi/etrKpQ07nGox2GuVxROYK8XOU
	WIKE7iP6uQe1HnmcwfWkF2ie8qy/IQ248U/hBknUisXtAo0fBOmekihc6zd2lTkj8EPqVfTgK+S
	BJpBxaKey3Yb/vMewZ6ADEnThkvorrvvK6Iv8RykihWc/lko5Ab/4tuhCMC4dTbIo3c9dIm0g/y
	fNh5GF+ji8yxNnhvEHQ2tcPyFTqh6Fg5BbV4dhnRr9kiYeWJ1TBHz5GTWGbFK+oIqxOPhnvwjiN
	+3XRKK41Y8Mm8=
X-Received: by 2002:a17:90b:1846:b0:35f:c796:ca5f with SMTP id 98e67ed59e1d1-3614047a264mr45414490a91.19.1777286858194;
        Mon, 27 Apr 2026 03:47:38 -0700 (PDT)
Received: from xpc ([2400:8902:e002:def5:7882:53a7:6a48:4d11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362dde4ccbfsm16227029a91.1.2026.04.27.03.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:47:37 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [PATCH 0/3] LoongArch: Move KASLR to EFI stub to avoid initrd overlap
Date: Mon, 27 Apr 2026 18:47:18 +0800
Message-ID: <20260427104721.47724-1-r@hev.cc>
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
  LoongArch: Allow rdtime_h() and rdtime_l() in 64-bit builds
  efi/loongarch: Randomize kernel preferred address for KASLR
  LoongArch: Skip relocation-time KASLR if it has already been applied

 arch/loongarch/Kconfig                   |  2 +-
 arch/loongarch/include/asm/efi.h         |  4 +++-
 arch/loongarch/include/asm/loongarch.h   |  6 ------
 arch/loongarch/kernel/relocate.c         |  4 ++++
 drivers/firmware/efi/libstub/loongarch.c | 16 ++++++++++++++++
 5 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.54.0

