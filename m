Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437014F6D
	for <loongarch@lists.linux.dev>; Fri, 12 Jan 2024 19:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bhxNK7s4"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dbe9c7932b3so11188884276.2
        for <loongarch@lists.linux.dev>; Fri, 12 Jan 2024 11:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705087865; x=1705692665; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zcB+CUweXKRRwTEVx+dPw3m+uDfT/oMzwKpBe0EWZg4=;
        b=bhxNK7s4/jPuMckzH9T7RMagzvXOQeT115ILurSfhitsR7sgoQvjlDGYPRMWmG0vWb
         4vf5f4r1QPBZK7naY92MvYMT+t4AUd0/7q5xeimgMEJ45d+A+rl78eXGENmvEMtPfOXz
         ie/sl6nAo9ptLpmqodeJN+VNR4EOpVtqBgk2ZqHtHfgWi3kKhfldpGRy9muyHJwlOG2V
         p/Qjpk/EKw/eXGyTJmIMsq8Va1lzLcAQWfrCqvdxJdiG/KigFmOKcl7gfaq/KwKumSIU
         s7UACADvgV9r/jB0zqlKPPBxZygjGpCi4u45dMeEEA/I+1DyQFOcp3KRyRKqMU7t8a9h
         fMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705087865; x=1705692665;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcB+CUweXKRRwTEVx+dPw3m+uDfT/oMzwKpBe0EWZg4=;
        b=pVKvIGoTsrezhukZBNY90123DnXfyfuFWAf1c6lWo7mG6NI8L+Y+UzRDmQaqYPDGHz
         EodEOcVLt+wMsE5nyATSOhwNVmFlBvBiiwhvX2C8k3LBQvoC3cS3QuZELpbwWQ55cMYw
         ZCrC68tKpsyBY8DLZPBcqr+NXmwhhaVC6dxOLhot6Nio78t3z41BMWZ5B9b8HGsdjcR6
         EylGaBDwRrWQ2pHZ0VJaTH60cJfVW+N9f5J6zm/29duorTXGEVHcCwuauCMkzKcjFd6A
         b46k3NR7yj6Dg9QaDSYPcho3n3QPLHuan+1eoHuDDPyqmMwD7zP+lXGmpe3cFg0py89u
         qzdA==
X-Gm-Message-State: AOJu0Yw7wYlfsg631hLpuCquZmzGup+9QoFjXC4W9lYMzHj6ET55skP5
	cwbAj417n5BQp9qgXaSlGN2Qx0d1bU2rBjgwnzUT5Lk=
X-Google-Smtp-Source: AGHT+IHXfXlLCPAaZRRjOmLUIRThqdt/F+b/7UzcDXbsb8hupk3oS/NFXVxFBaFHFuKSENWk6NaW7A8MSkPs/nbY
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:29b4])
 (user=yosryahmed job=sendgmr) by 2002:a25:8246:0:b0:dbd:748c:fbb7 with SMTP
 id d6-20020a258246000000b00dbd748cfbb7mr586650ybn.0.1705087865498; Fri, 12
 Jan 2024 11:31:05 -0800 (PST)
Date: Fri, 12 Jan 2024 19:31:03 +0000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240112193103.3798287-1-yosryahmed@google.com>
Subject: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
From: Yosry Ahmed <yosryahmed@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Nhat Pham <nphamcs@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-mm@kvack.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"

The z3fold compressed pages allocator is not widely used, most users use
zsmalloc. The only disadvantage of zsmalloc in comparison is the
dependency on MMU, and zbud is a more common option for !MMU as it was
the default zswap allocator for a long time.

In hopes of having a single compressed pages allocator at some point,
and following in the footsteps of SLAB, deprecate z3fold. Rename the
user-visible option so that users with CONFIG_Z3FOLD=y get a new prompt
with explanation during make oldconfig. Remove CONFIG_Z3FOLD=y from
defconfigs.

Existing users, if any, should voice their objections. Otherwise, we can
remove z3fold in a few releases.

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
---
I have limited understanding of Kconfigs. I modelled this after commit
eb07c4f39c3e ("mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED"),
but one difference is that CONFIG_Z3FOLD is a tristate. I made
CONFIG_Z3FOLD_DEPRECATED a boolean config, and CONFIG_Z3FOLD default y
so that it is on by default if CONFIG_Z3FOLD_DEPRECATED is selected. I
am not sure if that's the correct way to do this.

---
 arch/loongarch/configs/loongson3_defconfig |  1 -
 arch/powerpc/configs/ppc64_defconfig       |  1 -
 mm/Kconfig                                 | 13 +++++++++++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 33795e4a5bd63..89b66b6c6a1d5 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -85,7 +85,6 @@ CONFIG_ZPOOL=y
 CONFIG_ZSWAP=y
 CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=y
 CONFIG_ZBUD=y
-CONFIG_Z3FOLD=y
 CONFIG_ZSMALLOC=m
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 544a65fda77bc..d39284489aa26 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -81,7 +81,6 @@ CONFIG_MODULE_SIG_SHA512=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=m
 CONFIG_ZSWAP=y
-CONFIG_Z3FOLD=y
 CONFIG_ZSMALLOC=y
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 CONFIG_SLAB_FREELIST_RANDOM=y
diff --git a/mm/Kconfig b/mm/Kconfig
index 1902cfe4cc4f5..bc6cc97c08349 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -193,15 +193,24 @@ config ZBUD
 	  deterministic reclaim properties that make it preferable to a higher
 	  density approach when reclaim will be used.
 
-config Z3FOLD
-	tristate "3:1 compression allocator (z3fold)"
+config Z3FOLD_DEPRECATED
+	bool "3:1 compression allocator (z3fold) (DEPRECATED)"
 	depends on ZSWAP
 	help
+	  Deprecated and scheduled for removal in a few cycles. If you have
+	  a good reason for using Z3FOLD rather than ZSMALLOC or ZBUD, please
+	  contact linux-mm@kvack.org and the zswap maintainers.
+
 	  A special purpose allocator for storing compressed pages.
 	  It is designed to store up to three compressed pages per physical
 	  page. It is a ZBUD derivative so the simplicity and determinism are
 	  still there.
 
+config Z3FOLD
+	tristate
+	default y
+	depends on Z3FOLD_DEPRECATED
+
 config ZSMALLOC
 	tristate
 	prompt "N:1 compression allocator (zsmalloc)" if ZSWAP
-- 
2.43.0.275.g3460e3d667-goog

