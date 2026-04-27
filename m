Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CC63A16B6
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279661; cv=none; b=L2FQ7qb3R0Mmmu0/Xek/ZRc4nSYq/ZDooJ/K1t+7ty9QyJ9eaf7JdalGOV6V/nhqtkBHVKu/G/3IwuzSWcYso3B/xFr6FOlA5+0ywYNQ4hv3bdmznEsjtJgGBYU3Q4d5IvkgZnLYxEMn6Di1sAyqMcnuCrzv3QbGBCfess/ZvHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279661; c=relaxed/simple;
	bh=ud6229bzqFmsJw1B4jV51SEWrfqqWrMb4pJy+DI1Kls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=akfuQb1xDOw3uHGe7DpkBKrCTMiGCL8XKJzHkza66lZHm7WwYvEDw3dm63amfu8HHpkcDpKdrYAoQGYk+95491Ez1VOtQij7VZC6hh0jBwB5fHX9UmhjJ4JWaJRgTcUk35C7fVtz/FzTP1irJn8IH74FWzheo66b95CaUwaNPPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=PJS+uw/o; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="PJS+uw/o"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b299b3c739so45476325ad.3
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 01:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777279659; x=1777884459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EbS5XqlTtlqCLLkuZnn42EvCeoWF8vUClWjJ8C+Uh3A=;
        b=PJS+uw/oAF67UjfchJ1RpCTIsaIWdnRbQjnyqHGIqNgNBWfH4oDoSpk8mMCnjo5diz
         DkK7cp83Yuaoi+cWqV2N2iK60V1lwUaWEmHlKsI3WMczpEZYMWaxIRoW8agdGZHuh7eO
         qQ+qtwb2WWMb2QqDhrp1U5tzEtSQgij8mevhsdcmOrI1/nzX4Rb398441LylbyyCiNpn
         DX1nUjC2x5SOpXAoOB2PLcrmq+dy6i14sTqOCmp9kbpKcdSawN0BJiQ5DHbrORpGVU/d
         1i/cOIrS5NdpstpOa7Q7COn8xYiiFgaYCEvjSt20PIVQVgKnuJpxdYb8cCKNir+9A/aj
         itdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279659; x=1777884459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbS5XqlTtlqCLLkuZnn42EvCeoWF8vUClWjJ8C+Uh3A=;
        b=CJpj9YaejP6xLq5JnoPKyEO5MU+RQPpwobFB2tN3kmMWPYfJ/uck1ee+Y6e7MMopR0
         8PF2D7ibvVHSMSlN4TTnMOblJyjjXwhvjB7Y+pkuZeoTxWW72h347Tz9G7b977eygnBw
         CIamLHmwmdYNjjQMR06W1Nq3NTcy8voSPQw5s3m9x3ub2vusHhMJcFCYV9e6LSjITUqU
         J0WII6MqBA9xjxwOFcWmtuX+qWBU9hcNd/+Ns8cDM9VlosthNSSIH9V09H5PG3opVpdI
         DZE0oZ5LPO9Mj23VWr03oFn5DJjN3vWxVlecFcmc+7O3YGx65kwXvCVhYjRMwHcKfnIN
         lVzg==
X-Forwarded-Encrypted: i=1; AFNElJ+FPfEi702GMS0L+NboBIHDzGxSp5NKj1aPIuVArOzFpmaFlGH16XPQqK/iyKKzrbHR+14StUrliqA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBG1wuS3qQmWH0BIBklagIWwAUbPo/aRqwb4M8O7TlgGEqVszg
	LTNeLOAQKIhtGg9kCGSm1XaJBFVNMFJwRiu8EY0hCUF/yd5UROWCtZ1rBSIFwgUn60g=
X-Gm-Gg: AeBDieugvc5B1szXoKUR+Ohw++J6xY6UqVJnRnmveTkejRY/xUjd1GKy02bL6FGdifr
	IBJCk+sx+nDbssr9IFS7l7NfW4au4Zv2lpHL7/vmZK8l+6Shlmjzi6P8bybtvFgwSCQ7cDHncSa
	KbE7iQ2zYuSpodOV476J0Zjv4RBlcbo/L53tpbDeXmAfPhsY9LSjnirgveAH0oomuK93eqften1
	7mGi91zR+ttL/aD6y8aPXIazrt5XFXIjz5+JTn8c70g9tDevczqCWj/JYLciQ/LezSWsets/k/a
	tN3hEcm+XniUvd5HS0Kr5W/SeuHI9C7sXH5LExgUGWACKaVyOTM6Tx84ds6w4WYPm+NU7PHfcQx
	NkGzW9lhpJVrCiqrzxD2MPi3F6coYbS9LSU39Y5MlzsfG9IlgErAbBog2izf+sYClZOKjc4Vs0A
	w6f2Fzvhx3RvThkXIV7MS1Gw==
X-Received: by 2002:a17:903:3d47:b0:2b4:5b82:a8e3 with SMTP id d9443c01a7336-2b5f9f51e09mr293896815ad.24.1777279659118;
        Mon, 27 Apr 2026 01:47:39 -0700 (PDT)
Received: from xpc ([2400:8902:e002:def5:7882:53a7:6a48:4d11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3a929sm291703215ad.72.2026.04.27.01.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:47:38 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	WANG Rui <r@hev.cc>
Subject: [RESEND PATCH v2 0/2] efi/libstub: Ensure instruction cache coherency after kernel relocation
Date: Mon, 27 Apr 2026 16:47:19 +0800
Message-ID: <20260427084721.40535-1-r@hev.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since [v1]:
  * Move efi_cache_sync_image() after check_platform_features(), matching arm64.
  * Add "()" after function name in the subject.

The EFI stub relocates the kernel image by copying it to a new memory
location using memcpy(). On architectures where the instruction and data
caches are not automatically coherent, the copied instructions may not be
visible to the instruction fetch unit without explicit cache maintenance.

This series adds the missing call to efi_cache_sync_image() in the generic
relocation path, and provides a LoongArch implementation using the ibar
instruction to ensure instruction fetches observe the updated contents.

[v1]: https://lore.kernel.org/loongarch/20260427034451.717817-1-r@hev.cc

WANG Rui (2):
  efi/loongarch: Implement efi_cache_sync_image
  efi/libstub: Synchronize instruction cache after kernel relocation

 drivers/firmware/efi/libstub/loongarch.c | 5 +++++
 drivers/firmware/efi/libstub/relocate.c  | 1 +
 2 files changed, 6 insertions(+)

-- 
2.54.0

