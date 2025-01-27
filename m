Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56A8481A3
	for <loongarch@lists.linux.dev>; Mon, 27 Jan 2025 23:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022309; cv=none; b=jwUAYOkSxYsVONFeHF95NFR/fBR5rkSRGc0DbIKDBWktgM9CQMUGS0XbRX765maLD2RrkA1Mf8o/TN62tMx79Zr/gCfYigjwc0hXypXPZ7PvggoVa+Ci7QCS5RoygdgDAYeNCoZ3Qo/SHAp7L3Dvb2m5jfpOqTulCwOlRwqeDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022309; c=relaxed/simple;
	bh=hyl+W1C/KQ584ku+PmjAw3yt4umZ4DShTwGCqvZmAKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ffgZFk0sVIgh1HufQtWGKTrJtSrUxuH7hzLrfTVLQEaE5Jul0I7hBZQJPd6+PRqccLTbDXTE/lry8kizeQSrnPC64kuidD5VfF5NWih/06nMNoVGUrHIcLmSlT+1lEA3We4LxSqKZpbceT1Sm0kmcMSDe05sN0R6SiQXwiLvgqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mop0t27e; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mop0t27e"
Date: Mon, 27 Jan 2025 23:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738022306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=EPs2Uumgwh7vfBYo0WttnFq3NwRPbFFMOoiBXTDN20M=;
	b=mop0t27e59d7Z63k1Y1+pYSX8oRmad5uJCwuZSkAt0858KbChIwYTDFFj3IEuwwnl0VIrb
	jOYSA3Y+YBa8rXiIfZSBW6G6Kvppy6PkrvENViR+lCFK7xQbnoLW7M7CBGUvscRC2OC8vy
	k9sT3EmvzEKtp5vPYDJ1TRXiSOhgMhg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vitaly Wool <vitaly.wool@konsulko.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: [PATCH 1/2] mm: zbud: deprecate CONFIG_ZBUD
Message-ID: <Z5gdnSX5Lv-nfjQL@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

The zbud compressed pages allocator is rarely used, most users use
zsmalloc. zbud consumes much more memory (only stores 1 or 2 compressed
pages per physical page). The only advantage of zbud is a marginal
performance improvement that by no means justify the memory overhead.

Historically, zsmalloc had significantly worse latency than zbud and
z3fold but offered better memory savings.  This is no longer the case as
shown by a simple recent analysis [1].  In a kernel build test on tmpfs
in a limited cgroup, zbud 2-3% less time than zsmalloc, but at the cost
of using ~32% more memory (1.5G vs 1.13G). The tradeoff does not make
sense for zbud in any practical scenario.

The only alleged advantage of zbud is not having the dependency on
CONFIG_MMU, but CONFIG_SWAP already depends on CONFIG_MMU anyway, and
zbud is only used by zswap.

Following in the footsteps of [2], which deprecated z3fold, deprecated
zbud as planned and remove it in a few cycles if no objections are
raised from active users.

Rename the user-visible config options so that users with CONFIG_ZBUD=y
get a new prompt with explanation during make oldconfig. Also, remove
CONFIG_ZBUD from defconfig.

[1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
[2]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@google.com/

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
---
 arch/loongarch/configs/loongson3_defconfig |  3 +--
 mm/Kconfig                                 | 26 ++++++++++++++++------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 73c77500ac467..7ce5beb3cbf34 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -109,8 +109,7 @@ CONFIG_BINFMT_MISC=m
 CONFIG_ZPOOL=y
 CONFIG_ZSWAP=y
 CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=y
-CONFIG_ZBUD=y
-CONFIG_ZSMALLOC=m
+CONFIG_ZSMALLOC=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
 # CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE is not set
diff --git a/mm/Kconfig b/mm/Kconfig
index 1b501db064172..e3e15ab0cba49 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -129,7 +129,6 @@ choice
 	prompt "Default allocator"
 	depends on ZSWAP
 	default ZSWAP_ZPOOL_DEFAULT_ZSMALLOC if MMU
-	default ZSWAP_ZPOOL_DEFAULT_ZBUD
 	help
 	  Selects the default allocator for the compressed cache for
 	  swap pages.
@@ -140,12 +139,15 @@ choice
 	  The selection made here can be overridden by using the kernel
 	  command line 'zswap.zpool=' option.
 
-config ZSWAP_ZPOOL_DEFAULT_ZBUD
-	bool "zbud"
-	select ZBUD
+config ZSWAP_ZPOOL_DEFAULT_ZBUD_DEPRECATED
+	bool "zbud (DEPRECATED)"
+	select ZBUD_DEPRECATED
 	help
 	  Use the zbud allocator as the default allocator.
 
+	  Deprecated and scheduled for removal in a few cycles,
+	  see CONFIG_ZBUD_DEPRECATED.
+
 config ZSWAP_ZPOOL_DEFAULT_Z3FOLD_DEPRECATED
 	bool "z3foldi (DEPRECATED)"
 	select Z3FOLD_DEPRECATED
@@ -165,21 +167,31 @@ endchoice
 config ZSWAP_ZPOOL_DEFAULT
        string
        depends on ZSWAP
-       default "zbud" if ZSWAP_ZPOOL_DEFAULT_ZBUD
+       default "zbud" if ZSWAP_ZPOOL_DEFAULT_ZBUD_DEPRECATED
        default "z3fold" if ZSWAP_ZPOOL_DEFAULT_Z3FOLD_DEPRECATED
        default "zsmalloc" if ZSWAP_ZPOOL_DEFAULT_ZSMALLOC
        default ""
 
-config ZBUD
-	tristate "2:1 compression allocator (zbud)"
+config ZBUD_DEPRECATED
+	tristate "2:1 compression allocator (zbud) (DEPRECATED)"
 	depends on ZSWAP
 	help
+	  Deprecated and scheduled for removal in a few cycles. If you have
+	  a good reason for using ZBUD over ZSMALLOC, please contact
+	  linux-mm@kvack.org and the zswap maintainers.
+
 	  A special purpose allocator for storing compressed pages.
 	  It is designed to store up to two compressed pages per physical
 	  page.  While this design limits storage density, it has simple and
 	  deterministic reclaim properties that make it preferable to a higher
 	  density approach when reclaim will be used.
 
+config ZBUD
+	tristate
+	default y if ZBUD_DEPRECATED=y
+	default m if ZBUD_DEPRECATED=m
+	depends on ZBUD_DEPRECATED
+
 config Z3FOLD_DEPRECATED
 	tristate "3:1 compression allocator (z3fold) (DEPRECATED)"
 	depends on ZSWAP
-- 
2.48.1.262.g85cc9f2d1e-goog

