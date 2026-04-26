Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F235AC13
	for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204977; cv=none; b=E92HjCblR9uw4iQfkQCnUZ/GQbnKzyzknYSELblPdjJgSUBlhfw11e7V2KDqWqByxHp0zueqhsYrZMJGYfYcmi5S3JwCfUew/99mgdTZ0jIZ0KMZn9RKS0DUk/2ACVZTxR5jcw8tc86VVIHKbWCdBnXrfZUqr7gkOych6qfNfXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204977; c=relaxed/simple;
	bh=qQCPWEhONCN/TKigEaYuGrNcB33stTCwU1/MF1UQ6tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GOOF8xTtKgeQSPof8pbLDK50ajptA6A+kwtMLU7CMarS6Yen/82QeHlhYhcdHj2zJE8HXttY2+oa/NAYRssi9LCH+ezlpPqmKPrqtcI53BugqUaL5clEtS3htoyZGCvHjUYklV+ZsdcDiszynl4ILmdDbw504Rb92NJyFFjQYv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=rLX4RvZP; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="rLX4RvZP"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c7b9f54d3deso2677981a12.1
        for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777204976; x=1777809776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YymJ79SCPZTf+NPdeESDccb+VxFojDPK0l67eRMH4Fg=;
        b=rLX4RvZP5VPQcBqOXWBtwanKcrbxep5kxkxmedBC+jx78Hdh3kAxS9puJptiBpxDqf
         kWhwFDEgW8Uyt2RJz8ufY4AgEkTllUsXEU3UEd1/B5xUeK9U/fYGCk7Jh534YL+MNQi7
         2yZXweXJ+D6iAFKPrafs1YHWLQ4H/2QBOgIfsNQaieQrM5pzN8NZf8LTjiT+cl+fS+Q4
         DM6jTPyB17zbvzH2zomMWofvr35808zrlRN1wGFOFKxu2QgpsXXKX35fOzOou8Bbf3vA
         2PnOxN+ejnfUtLCNk1ZEcOC+VShpETjXFqQ1oLSCdPEHkurTl0/dDOD1gq5JZkYwJhts
         8LIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204976; x=1777809776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YymJ79SCPZTf+NPdeESDccb+VxFojDPK0l67eRMH4Fg=;
        b=FriYpPkI8PdT68yy8wfvH6y5i1WGqgjgG7OzNTvFfI6Knn/Q4hcvZMRKgmCux1dQvh
         X+RYaZhFIproGR/mU4OMyNn3+4Ju0GNCYvhmqvHnR5RCj2GyEh8Ly6/YjzXN2NxB2re6
         ayIMKgYjPRPA1ZRxG5R4WaJXuYU07OIhg0lHru72c3/11NuxgDK6UrG8klFm8mHqDkRF
         FU2Q4Z3KoF1irEut5AO4Huf+bJwzsNINwz8kmIxA8lJgXe9yv8pDQkB82sU9loiwD1Uv
         LNmXsjBcKpr/rVkHmdlrHvU8RRSbr7PTWqb5tArS1Joi2vNjDSGRJhwn3+My4Et7gaJv
         1IpA==
X-Forwarded-Encrypted: i=1; AFNElJ+IOlhHm/932RpzuNK5WQJXGklU3JgoQU4crqLXbHHPKaRSDQlYW96lL/pYOkTuIl6YuJJbZdzvsQU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAClaklBEirE+17QY7JWteicUPnQpAfoNNswuVXqXVax6EnbLv
	73sTMlDyK0IHZ71IJSZS5zwxdvINQATteSp37idr32TwXgj2R1Sde12ZOYQE4r9CUyY=
X-Gm-Gg: AeBDieuEUEFJQKjF9TGf1xlceO53sDAC5l5q9ylcXaM8TP7AoDkl3W/Mr3WnmQhg41P
	GgXxw7TGPhfqLObqnxYui6X0KLES/hLWmTwTFmdbPdZgeAK1RatNG8k0bjoABmrACCNPEusA0Q2
	X2j9VZBWjuPqyvOsyq9NsM6JgvpS96Z6oUwrrLXfkjXFKjyRixRIc33JmtKsqe7WQU9DzMIjboh
	9Y5D4U4mvDn4XoM+vlJVTDo/VuqO1SPpJWUP9IC4sDjHdCdzkBRJVC5ZOLt8vP7f8xFA93TKQLQ
	ioTsKfB2SXD/G9tESsJ1k/vC7BrgRrvqr5cranSZXVL7Za1igN4gLNhjyxtBPwnjqHssuZSn7GU
	gFgkUMPLinzIdZeQbSx34BAfTaFrpZ7RGUVbJF9BxqQ5dYYJuRGr8AqyuUzbWlVeAoZGN/GAIGT
	Q9aBgrMsfOxQL1XbxyEBwBlqC9cTehDQ==
X-Received: by 2002:a17:902:d58e:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b5f9f1b8d7mr389958585ad.19.1777204975949;
        Sun, 26 Apr 2026 05:02:55 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de3c:3085:4d80:3614:2212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab297c8sm263413965ad.67.2026.04.26.05.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 05:02:55 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [RFC PATCH 2/3] efi/loongarch: Randomize kernel preferred address for KASLR
Date: Sun, 26 Apr 2026 20:02:30 +0800
Message-ID: <20260426120231.532644-3-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426120231.532644-1-r@hev.cc>
References: <20260426120231.532644-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce efi_get_kimg_kaslr_address() to compute the preferred
kernel image address dynamically when CONFIG_RANDOMIZE_BASE is
enabled. The function derives a random offset using EFI-provided
randomness combined with the timer value, and constrains it within
CONFIG_RANDOMIZE_BASE_MAX_OFFSET.

Update EFI_KIMG_PREFERRED_ADDRESS to call this helper so that the
EFI stub can select a randomized load address when KASLR is active,
while preserving the original base address behavior when KASLR is
disabled or nokaslr is specified.

Signed-off-by: WANG Rui <r@hev.cc>
---
 arch/loongarch/include/asm/efi.h         |  4 +++-
 drivers/firmware/efi/libstub/loongarch.c | 15 +++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/asm/efi.h
index eddc8e79b3fa..f831320efd41 100644
--- a/arch/loongarch/include/asm/efi.h
+++ b/arch/loongarch/include/asm/efi.h
@@ -30,6 +30,8 @@ static inline unsigned long efi_get_kimg_min_align(void)
 	return SZ_2M;
 }
 
-#define EFI_KIMG_PREFERRED_ADDRESS	PHYSADDR(VMLINUX_LOAD_ADDRESS)
+unsigned long efi_get_kimg_kaslr_address(void);
+
+#define EFI_KIMG_PREFERRED_ADDRESS	efi_get_kimg_kaslr_address()
 
 #endif /* _ASM_LOONGARCH_EFI_H */
diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
index 9825f5218137..80ba7d69e1b3 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -38,6 +38,21 @@ static efi_status_t exit_boot_func(struct efi_boot_memmap *map, void *priv)
 	return EFI_SUCCESS;
 }
 
+unsigned long efi_get_kimg_kaslr_address(void)
+{
+	unsigned int random_offset = 0;
+
+#ifdef CONFIG_RANDOMIZE_BASE
+	if (!efi_nokaslr) {
+		efi_get_random_bytes(sizeof(random_offset), (u8 *)&random_offset);
+		random_offset ^= (rdtime_l() << 16);
+		random_offset &= (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - 1);
+	}
+#endif
+
+	return PHYSADDR(VMLINUX_LOAD_ADDRESS) + random_offset;
+}
+
 unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
 		efi_loaded_image_t *image)
 {
-- 
2.54.0

