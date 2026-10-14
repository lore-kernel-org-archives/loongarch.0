Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B3B40F73A
	for <loongarch@lists.linux.dev>; Wed, 14 Oct 2026 03:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950361; cv=none; b=SDxVk67GykbRH8zoi8bfvjlDSEd2Ctc+CbyDnzIPKSS0toJp9NcBQoF8OTtXRFq7x50CgqqV6Lfq0ltF7hnCmkEHcJt3aiatGW/EeeJy+ea87fceJZFYf/OeF0s3LemqhN4RaQfbmNIFVKaiMW6tWxLpdw+/ZpznAPNpotf0+RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950361; c=relaxed/simple;
	bh=eo2KS1rD2mthJFfkPWGzxyjARkBBzJ1ObzuNrYesD1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpCEgyDNpo5JroxPiOd8zOo8cKtoKEm+0+7+0i0Skw2kpC3XKRP64MMn+zapZWLoI14moKy0HRQ/x7x4Djm5FU2G2Oi6GwJ/Nolm0UlLCloQbpvNUPglo80YQv6IPshkPMhKQ+Kshc0vGeyA2HHJQTywrATcHK0N1A8zB6XanTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HwxD4iRK; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HwxD4iRK"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso2295983a91.1
        for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 20:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791950358; x=1792555158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5STA7RRpF0bZE7yNESPvMRAN/jMwPnFqOs2b9BGo7gc=;
        b=HwxD4iRKTiLSZ0AsmwGVmHDGtaGmuGGz2upY1fsK29Nj9cKFzTRzia23Z1AEuvAFhN
         qjj9gg24zVouW4fOQmlIzUZwD5UM2BXZIobsF4zHpAQvIkJJqNvZhaSvhBgpDzMukCeQ
         w1hXDcEE+9K36Xy8wZKgxNmxS7Tuujb4GlDx8GnIMWNgDGyPv1NqbCICIqAGjSjXNodI
         tFo73xzxSjYuyTQK4gErtwRFhIMw81olETMfhpX4ntGw0jSZZqGR7yPoXhhxOmVf30L8
         o2SFmw5snwil6Ux4xbEz9R3M27KV5TEm6YJR2rkzz/MkEiR7BH7uoBrdsSYmsu81ETo2
         4HfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950358; x=1792555158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5STA7RRpF0bZE7yNESPvMRAN/jMwPnFqOs2b9BGo7gc=;
        b=q/nnttnqJcv+daKm+IDz5K/I7m3SKujoNkwoMdbQKzebv6ywo8+up4B2sa0nEHciWQ
         oTirqT5AmTaitPf5QusyN9qmsQ+0Zvg4MpYWCrupWRGC4gEqBO1zvSa2VQjH+xP9lSh6
         LL1yMO00IxbTj2922q4AB4fdl9I6nxypNWS5JfYv0KadFxx8tjhznDu+D1uuU1g6biVO
         3eOwJYWG7RE26Rbfw0mNeCvWYQFxS8FnJvJYRIPN3JwNUheO5D7qwrE4FaVeiETJtECd
         yQ13vyOJ4iSIayE2FH8iI/XDLdoEik6rJE9msmjtQ2YRHOW8MpWkUkmgcogqVGeRm+S1
         AKOA==
X-Forwarded-Encrypted: i=1; AKwUvBwbUTU+s7HCSVJPkl9/Dravwey/2DbdV5pmkNw1aDMf33UA8CHCnhz8ylJck6mkzi+U8ebpuIxbTRw=@lists.linux.dev
X-Gm-Message-State: AFq9FYJk4bobj9n6v11TY+eyYkghIvuy17kQxLgYWAxhUhbZLiqLta+o
	EuE8QiBNesAS+ah7LWPjjKyuP1zPAAt9u9zPPNoMZNjtBAuiJKvNHUt/eg2SaGll2Hs=
X-Gm-Gg: AYBFou1Ki59RTFbe9FRnZPVUJnLzGe0V1DqCpVxJp2MaLwRvjr0Fvz72G6r9aHSScaZ
	pJkGfQwzkUGmDkuP9wbZhqqNaKt0x/VZN1ZE8BLF66y46Xvd8g1Na+wxCFsVEJat5rGv5/R3EjN
	I/+RXWDLJv+PAnVRu/nXUlprvyDOXFEYjOOkxTdXquev/kfofvsz65QQT3Evjb/GWs3uNpP3n76
	VTHoxu17W+TqvrL2owHOWuBZzvL8DU75J1nkN+igll2Uo8YvC8Z9ocHJN2Jyr6g5gzIKOoFnzDN
	VZUlP9TbEweaf1S6mgo6bkFmn5urSudijOpZIVOZDqejLy+kjI0ukWQ7iuxTp5xa3lI6ZRqDmpB
	WoCZj2xhwkqAqIQeHjcUnq5YhlZXU0AqlODxS82dHG5//WA10s7Mpe+zadKAbGIoj/2Hd5bx6Q1
	rOpH89+EtioWY7NpdZaby8y2tfuy0WKOrKD//P8+SgJ41Jqa7i4yuhinDVsAoA9eACOwLa3XbTK
	dBglnlecDFXZ45A55El
X-Received: by 2002:a17:90b:4c8a:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3ac63bfe81amr1395913a91.41.1791950357376;
        Tue, 13 Oct 2026 20:59:17 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2492305a91.9.2026.10.13.20.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:59:16 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] mm: Generalize page table allocation helpers
Date: Wed, 14 Oct 2026 11:59:07 +0800
Message-ID: <20261014035910.687847-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A subsequent series will switch runtime vmemmap population to the
generic page-table allocators. Since vmemmap tables belong to init_mm,
the allocators must select GFP_PGTABLE_KERNEL and mark the ptdesc as a
kernel page table.

Some architecture-specific allocators do not preserve both semantics.
LoongArch and MIPS choose PMD/PUD GFP flags without checking the mm,
which can charge kernel PMD tables to a memcg and leave user PUD tables
unaccounted. The private PMD/PUD allocators also omit kernel ptdesc
marking.

Rather than duplicate this handling in each architecture, extend the
generic PTE, PMD and PUD allocators to support architecture
initialization hooks and non-zero table orders. LoongArch, MIPS and
parisc can then drop their private allocators and inherit the generic
GFP selection and ptdesc handling.

This series only prepares the allocation interfaces; the runtime
vmemmap conversion will be submitted separately.

Muchun Song (3):
  mm: generalize kernel PTE table allocation
  mm: generalize PMD page table allocation
  mm: generalize PUD page table allocation

 arch/loongarch/include/asm/pgalloc.h | 48 ----------------------------
 arch/mips/include/asm/pgalloc.h      | 40 -----------------------
 arch/parisc/include/asm/pgalloc.h    | 17 ----------
 include/asm-generic/pgalloc.h        | 29 ++++++++++++++---
 4 files changed, 24 insertions(+), 110 deletions(-)


base-commit: ad9f2d463666c64e94b04be5263c9bf8f9f96fb7
-- 
2.54.0

