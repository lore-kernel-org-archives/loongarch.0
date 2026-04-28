Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3F840DFD3
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 04:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348949; cv=none; b=f7kj3X5B1w7DCdjNeu+uqYO7pBH03EMTuInRuQtp82RlxNpm/8hnwREnIfI9vfG+Rmejvt28l+2zSjwWAH2EmeyKkpg38+5pLn9oO8vPhD1trq4MuzdCu7wbSZGszFvup29PNZTU/RxcdXsNXU6AXIZ8jVgxyJ7oOpZdoRv6ev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348949; c=relaxed/simple;
	bh=Hhiz7YXIt0m1DU+IaREY7k8p2d/aCJr7MC1uza7rXvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7xuIZXK1uW//iyjSEMpm07w/XcCMltjNQbSBoCRFHte+wKPWEtBHCyVjZ1pRSWwhoAdnhWShvElDooKN2a+GopYB6jJ2eP6Lkq7gr/wog0jdWPxAZO0OY/QhMD0YMiulsAakhTOoNDHQrmMFS1AniZPRohGguQoqVLgR9BEmks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=PRc8vaIQ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="PRc8vaIQ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c7ec83fff7fso645789a12.1
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 21:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777348947; x=1777953747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bd1hgbTBVVdcDcX9ve5H/qCUgL6eJ7XhwuWBwZRmwfQ=;
        b=PRc8vaIQRDUugTLIkCgX4Cvi7IORfW4IuVEIHuFsxeVDfz4k1ugN7c1kbQyaFbOUww
         dQoOoDxzdKgUqA9uWXgF5ReI0yt0OlLgdAY8HXdPJ3ntllmnTLegOwB2vp/wLsjqQEj3
         igrLnQAPw8wSZDB1wR0fJ6lNh1Dg+2KeJUxqFirAydMooBV3/YCFWhkFpV62hXrny9vb
         IwZMBLo4QqQrO6ATtv9/OBl8C9DKIOGFNE7S5e0oHqjoz5WLvfnXD4pmaKgr/5yapIW0
         rCavWZynb72egpKtuDYktJBAVl2tBvImar7rWjDvR8clye/NwA8t1BQQA7dvYXy8/biP
         JDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348947; x=1777953747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd1hgbTBVVdcDcX9ve5H/qCUgL6eJ7XhwuWBwZRmwfQ=;
        b=iVeK18NZXzlWC9u2SUR7hr0SDK4v91xOPpanh8xaLQ1jgFaQZ+ptZzzzMrApLSDyfE
         ewJxqDViWWg90gi6L83nvnEfh4VYi/9XRIDBlrQEE4pfTPil6GnV1uaYgPWSjZZpl6J1
         vR1i66Serrbn5GV9nn5Ou4MhVLz5FnQnCV9/v7OibprCn8rc3G+KqvZYYT21Rwy7XgLi
         0jqMwIFArJnqO7VLsqp8yb/kJV/FBT5n5VK9RhszHteARTvFqMWIeR3fq+k5MxsAAptf
         bnES0WWq0RBGar9tgfNjuNCdyaHsXca/nn6AGmv8Yfouu7hJ6y5QckVNgxp994wNxjuh
         Crdg==
X-Forwarded-Encrypted: i=1; AFNElJ/albo86HvSAYrVZwjv+S/jQmw3ASaiBUOJxLYGW/N+2Nxs8O16s5Qx31gbdHD/8BCPzY3m4Z9FH6o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxnnTkFCAIiY+T7SF2OLuvCVW3RMlMkom9LDnXj6U+FSZpG3QU
	ZM73lQuHM7snVD2sbHR0lGc8Dp1dFXBEU1UE3hkiAORfOPhVXxsN5au9q+yH9YcVDSU=
X-Gm-Gg: AeBDies/LPmZsujuc8AGWLAKXZ58qrH/mD0v3rpvrMiejWSXT+V+uAHBaWBgk/4pJWG
	hpijwLUY2b/Qw3JU7HvWoRBst0/jGncff1svJnbPfnmqCIxAAdf3oSdEMHVxVjZAJyt8vyIKq5H
	gicquDE5HxuLJcY1hhkpSMKRdlPFrsphNQ/rh7NVhNHhl/d+0SykLSWRwB8L8OtK2srpgqtNt/k
	AIkVsfiOlSKyxo0MtbpnV+jhz/qd2uVg9+eNQ3fykPa9RSsEE48JQHlxuM8mD8rIQt5M/myue0B
	IHDfJwiB5c/3dWo6aGx7rkTBuZmPAfrjuuztKyFptWCZRFFMPkDAjOt7CV5NTmf3Q83jkjdIPaQ
	sWzUY/Iv8yQs7TSP4ys/82EcHQUWzukLk6fyZDtmrH4s41kAL2SjlaVwVdWQeC2Bub9pQ7L4qqO
	kYNDlVnoHRmbCq8k+z9FhObPsUdkS3
X-Received: by 2002:a17:902:f542:b0:2b2:53f5:461f with SMTP id d9443c01a7336-2b97be3deeemr12458925ad.25.1777348947328;
        Mon, 27 Apr 2026 21:02:27 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de33:3dbd:69cf:4a22:309])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8cd29sm10131365ad.61.2026.04.27.21.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 21:02:26 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Lisa Robinson <lisa@bytefly.space>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [PATCH v2 0/2] LoongArch: Move KASLR to EFI stub to avoid initrd overlap
Date: Tue, 28 Apr 2026 12:01:57 +0800
Message-ID: <20260428040159.1065822-1-r@hev.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

[v1]: https://lore.kernel.org/loongarch/20260427104721.47724-1-r@hev.cc

WANG Rui (2):
  efi/loongarch: Randomize kernel preferred address for KASLR
  LoongArch: Skip relocation-time KASLR if it has already been applied

 arch/loongarch/Kconfig                   |  2 +-
 arch/loongarch/include/asm/efi.h         |  4 +++-
 arch/loongarch/kernel/relocate.c         |  4 ++++
 drivers/firmware/efi/libstub/loongarch.c | 16 ++++++++++++++++
 4 files changed, 24 insertions(+), 2 deletions(-)

-- 
2.54.0

