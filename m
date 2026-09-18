Received: from mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F1138F928
	for <loongarch@lists.linux.dev>; Fri, 18 Sep 2026 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724107; cv=none; b=EELuKH3PYQqY6/Y6dHANL4Kne9Db073Gu7c9NaxkewYmcZUx16OEcLOJ0MUl2J4uVoMsyB/x+R4hKuMGon6ik0fNElI5GUw6kVx5yz6KCLxFLNIbzVkL+cSQ//GRwMgA7D4RuuY1E2yBGzz4+pWcJl9S/CLReb6s//1pIMLeAZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724107; c=relaxed/simple;
	bh=p/DQJd95U/7tkNehVUiamBQTKyTjZl52MTnDy+aDty8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mh6jjv504ArLINL/Lvjgl9k+CnhOopgl4r2Z/N4UdK0WRaUHv8wi5r4+8xqGh0RcYuf79OyewXYLJqqkDU3JlRk04+C/C7kpc1ShcrSG1K4EmkcahI/VOSJpzfY68h5V3FF7FbCZSGrRJgmmzVClSejZdMiCvuab/K/EQEGbycE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t7TZ60mt; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t7TZ60mt"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=p/DQJd95U/7tkNehVUiamBQTKyTjZl52MTnDy+aDty8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789724104; v=1; x=1790328904;
 b=t7TZ60mtyBpGmXyqF9xUBXtjYq9ZtoFwrn0HSx2Ph+U4/WywNAhaY7HkNO2bIxtCLk/QXpXx
 ePKIRBMR7usKqfagJlrKT6QvXX4vhQ9JjEXuC8fYvlcP9wnXceW7kStV9BWvI9jpomfSYnSzZ8P
 /2Era6AfCaa01vvu6sABCWxY=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c0e6a754c1f50c48;
	Fri, 18 Sep 2026 09:35:02 +0000
X-Mizu-Trace-ID: c0e6a754c1f50c48
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: pratyush@kernel.org
Cc: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	sourabhjain@linux.ibm.com,
	graf@amazon.com,
	changyuanl@google.com,
	akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] liveupdate: kho: calculate per-node scratch sizes before allocation
Date: Fri, 18 Sep 2026 17:33:16 +0800
Message-ID: <20260918093317.12216-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2vxz1par7amw.fsf@kernel.org>
References: <2vxz1par7amw.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sourabh, Pratyush, 

> But in practice, this problem is only on CONFIG_NUMA=n and I don't think
> in practice KHO or LUO is being used in non-NUMA systems. So while I
> think it is worth fixing, I think we should also have a test where we
> enable CONFIG_NUMA.

Confirmed. My vmtest kernel has CONFIG_NUMA unset, and your analysis
matches the data.

I reran the vmtest with Sourabh's debug prints on both configurations:
same kernel, same QEMU command, and without my this fix patch, so the
default percentage policy is exercised. The only difference is
CONFIG_NUMA.

Without CONFIG_NUMA:

  KHO: Before low and global scratch allocations
  KHO: low size = 330185 KB
  KHO: global size = 322 MB
  KHO: Per node 0 = 672 MB
  KHO: After low and global scratch allocations
  KHO: low size = 330185 KB
  KHO: global size = 322 MB
  KHO: Per node 0 = 672 MB
  KHO: Failed to reserve nid 0 scratch buffer
  KHO: Failed to reserve scratch area, disabling kexec handover

With CONFIG_NUMA=y:

  KHO: Before low and global scratch allocations
  KHO: low size = 330197 KB
  KHO: global size = 322 MB
  KHO: Per node 0 = 96 MB
  KHO: After low and global scratch allocations
  KHO: low size = 330197 KB
  KHO: global size = 322 MB
  KHO: Per node 0 = 96 MB
  KHO: After per node allocation
  KHO: low size = 428501 KB
  KHO: global size = 418 MB
  KHO: Per node 0 = 288 MB

In the run without CONFIG_NUMA, the reserved-kern sum the sizing sees
is 330185 KB, which is the 98.45 MiB baseline plus the 224 MiB lowmem
scratch area: with memblock_get_region_node() hardcoded to return 0,
the NUMA_NO_NODE lowmem area is counted as node 0's kernel reservation.
Node 0 therefore requests 200% of (98.45 MiB + 224 MiB), rounded up to
32 MiB alignment: 672 MiB. That no longer fits next to the other areas
in the 1 GiB guest, and KHO disables itself.

In the run with CONFIG_NUMA=y, the real node ID excludes the
NUMA_NO_NODE regions, so node 0 requests 96 MiB. The allocation
succeeds and is visible in the sums printed afterwards (330197 KB ->
428501 KB), and the KHO selftest passes end to end ("KHO: found kexec
handover data", restore succeeds).

Sourabh, this also answers your question. Your PowerPC system runs
CONFIG_NUMA=y, so the node filter excludes the lowmem and global areas
and your numbers stay flat. Your experiment and mine are the two halves
of the same mechanism.

> I think on NUMA systems the problem is the other way round. The
> calculation for the global scratch also counts per-node allocations.

> So I think the proper fix for scratch sizing is what this patch does
> and then a fixup for the global scratch calculation as well.

Agreed. For v2 I plan to:

  - Compute all scratch sizes (lowmem, global, per-node) before any
    scratch area is allocated, per Mike's comment. The sizes are a
    function of the pre-allocation state, so this seals both feedback
    directions at once.
  - State the !CONFIG_NUMA condition in the commit message. The feedback
    described there is not unconditional, which is what triggered the
    question.
  - Add the LLM attribution Mike asked for.
  - Include the CONFIG_NUMA=y vmtest result as coverage.
  - Look at the global scratch calculation on NUMA systems as a
    follow-up.

Thanks,
George
