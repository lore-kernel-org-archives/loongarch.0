Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29011155A5D
	for <loongarch@lists.linux.dev>; Wed,  4 Sep 2024 23:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725492828; cv=none; b=CTDzRQ2FTfPODZ8QIyMmGup75BIGtq3a/kPVw9L06zG0MCWvbPcvWH35DsaOuY33Pptq1gAnm1JWmQ1nG/01fpcFpqg+BMR3SPQenadCEpS8I/QI8koeUf7oP0bLHJfiXikBV4OGtKLFYB0j0pCr2iHkEsDP1JAE1Z7ZJ4FF+Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725492828; c=relaxed/simple;
	bh=0MV2v82CQOXMeR06j1K0EUveZL9YXnH6HgSg3iOOQPw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NA2FHh1N4udllfvdtjrJ6bS0FGx594OZK8oOhGQ2UVB9PvkY0GkxPRCEJo/kH2RPDdKQifp/xI2F+J7BLyGmLSahdJvNGhUuGbAo2Ciyi/ZZFcrYg39k+uKbuSmgkhqI1lt4rCp8WhgNcceqWAHaG6xSzIKsshnBz7ekL6VbkM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3IIY4bwJ; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3IIY4bwJ"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e02a4de4f4eso448061276.1
        for <loongarch@lists.linux.dev>; Wed, 04 Sep 2024 16:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725492826; x=1726097626; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uykNh/T0V9CAowhkC/wpCZl/aNMVHh9r5kx7pi77vV0=;
        b=3IIY4bwJgPxIJQ3DIjNJPAUX5raHQQR67RRzFH3ydDhxWQOda6IumbHZBBwxWjXzag
         R+LRXNfFzyN4tXpgHH0X1OQgaTwLyTD973AlJcbyuIaXfKPjqDPb40C9PgrNDCvSttv+
         JzeFYXnOvvjtsdNJP0n04vDiPKZd0HIwrglVe9IlCC2/gk2QxpISEthtKihlykt5z2Dm
         fhQ2o+k0CMqfPoFFMpRv9TiM0OJRmGGBofZsBKxcl7aqKKNDNQ/5Of6KyuhH0E4OOsII
         k1MxBX8v0UZmPrT0go7n2YF1j4DssNwGEfjod++96vt4ibSnJ1X0TpTDednopIwf+b2m
         90uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725492826; x=1726097626;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uykNh/T0V9CAowhkC/wpCZl/aNMVHh9r5kx7pi77vV0=;
        b=uy5ZqJhop5GXIwWJUUZ7MCUZarZsM89LplwVev5KYq4g+rh8b0YP+sQWayRtU4GVBo
         himLoHHIQlsm6XbYsloTy+cCQV1NpjUEl8LjXLLXgTpLMQBIBDUg/3+GlMIKWZmkqVVk
         lxeKxWsOTvxm4cRQ1YF+hGqMjRPwciYuih8ZL0jvVcPewFU9bD/vCSBDcuypbTOrmrEj
         oU+IQUhO/jVZgsjDsu9fLtrIUr6rqzWAkmd3HSWa0TV4hJsqW5DqJtrY85jdQVW6ajSW
         6r4JUz7/KsO81zOTSmFqzR51KePfAZPDth6sFh/O6+GQ/tqg0Mum3vURJmDlfYlbVs2X
         FnWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNHjxbssWKjzGxLbbgdyV09s7vT0PGDsL4e+xnT3/UNZ00cs1bLFOY3qKr6rwy4HhHPIl6LFTQxwg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXquMaYJkLYgN4M7UqOndvPkHyv0fbNM9XB9cHr+IUg9hJF5UF
	0Qci1vHfLOzC1dW6xGu499W/l9Mln26Hv/q2YgK68tVQeIMDkjOBNzPwloFDbrq3wQSh7x3nZ4X
	B0UTsr7b3nSX0er+/RQ==
X-Google-Smtp-Source: AGHT+IHlWubTx6E8VrUfQXTNNaZkLgFaN+lTCKP4pMLyXKpV+FgOVAlLsacWjKzs0BxCPS5/R97jnhWicwTPqmYJ
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:29b4])
 (user=yosryahmed job=sendgmr) by 2002:a25:8592:0:b0:e0e:c9bc:3206 with SMTP
 id 3f1490d57ef6-e1d0e78ad12mr5832276.5.1725492825962; Wed, 04 Sep 2024
 16:33:45 -0700 (PDT)
Date: Wed,  4 Sep 2024 23:33:43 +0000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240904233343.933462-1-yosryahmed@google.com>
Subject: [PATCH v2] mm: z3fold: deprecate CONFIG_Z3FOLD
From: Yosry Ahmed <yosryahmed@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vitaly Wool <vitaly.wool@konsulko.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Chris Down <chris@chrisdown.name>, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"

The z3fold compressed pages allocator is rarely used, most users use
zsmalloc. The only disadvantage of zsmalloc in comparison is the
dependency on MMU, and zbud is a more common option for !MMU as it was
the default zswap allocator for a long time.

Historically, zsmalloc had worse latency than zbud and z3fold but
offered better memory savings. This is no longer the case as shown by
a simple recent analysis [1]. That analysis showed that z3fold does not
have any advantage over zsmalloc or zbud considering both performance
and memory usage. In a kernel build test on tmpfs in a limited cgroup,
z3fold took 3% more time and used 1.8% more memory. The latency of
zswap_load() was 7% higher, and that of zswap_store() was 10% higher.
Zsmalloc is better in all metrics.

Moreover, z3fold apparently has latent bugs, which was made noticeable
by a recent soft lockup bug report with z3fold [2]. Switching to
zsmalloc not only fixed the problem, but also reduced the swap usage
from 6~8G to 1~2G. Other users have also reported being bitten by
mistakenly enabling z3fold.

Other than hurting users, z3fold is repeatedly causing wasted
engineering effort. Apart from investigating the above bug, it came up
in multiple development discussions (e.g. [3]) as something we need to
handle, when there aren't any legit users (at least not intentionally).

The natural course of action is to deprecate z3fold, and remove in a few
cycles if no objections are raised from active users. Next on the list
should be zbud, as it offers marginal latency gains at the cost of huge
memory waste when compared to zsmalloc. That one will need to wait until
zsmalloc does not depend on MMU.

Rename the user-visible config option from CONFIG_Z3FOLD to
CONFIG_Z3FOLD_DEPRECATED so that users with CONFIG_Z3FOLD=y get a new
prompt with explanation during make oldconfig. Also, remove
CONFIG_Z3FOLD=y from defconfigs.

[1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
[2]https://lore.kernel.org/lkml/EF0ABD3E-A239-4111-A8AB-5C442E759CF3@gmail.com/
[3]https://lore.kernel.org/lkml/CAJD7tkbnmeVugfunffSovJf9FAgy9rhBVt_tx=nxUveLUfqVsA@mail.gmail.com/

Acked-by: Chris Down <chris@chrisdown.name>
Acked-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
---

I think it should actually be fine to remove z3fold without deprecating
it first, but I am doing the due diligence.

v1: https://lore.kernel.org/linux-mm/20240112193103.3798287-1-yosryahmed@google.com/
v1 -> v2:
- Make CONFIG_Z3FOLD_DEPRECATED a tristate option to match
  CONFIG_Z3FOLD.
- Update commit subject and log.

---
 arch/loongarch/configs/loongson3_defconfig |  1 -
 arch/powerpc/configs/ppc64_defconfig       |  1 -
 mm/Kconfig                                 | 14 ++++++++++++--
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index b4252c357c8e2..75b366407a60a 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -96,7 +96,6 @@ CONFIG_ZPOOL=y
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
index b23913d4e47e2..536679d726417 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -177,15 +177,25 @@ config ZBUD
 	  deterministic reclaim properties that make it preferable to a higher
 	  density approach when reclaim will be used.
 
-config Z3FOLD
-	tristate "3:1 compression allocator (z3fold)"
+config Z3FOLD_DEPRECATED
+	tristate "3:1 compression allocator (z3fold) (DEPRECATED)"
 	depends on ZSWAP
 	help
+	  Deprecated and scheduled for removal in a few cycles. If you have
+	  a good reason for using Z3FOLD over ZSMALLOC, please contact
+	  linux-mm@kvack.org and the zswap maintainers.
+
 	  A special purpose allocator for storing compressed pages.
 	  It is designed to store up to three compressed pages per physical
 	  page. It is a ZBUD derivative so the simplicity and determinism are
 	  still there.
 
+config Z3FOLD
+	tristate
+	default y if Z3FOLD_DEPRECATED=y
+	default m if Z3FOLD_DEPRECATED=m
+	depends on Z3FOLD_DEPRECATED
+
 config ZSMALLOC
 	tristate
 	prompt "N:1 compression allocator (zsmalloc)" if ZSWAP
-- 
2.46.0.469.g59c65b2a67-goog

