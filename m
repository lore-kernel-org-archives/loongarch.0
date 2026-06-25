Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1B12D97BA
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376347; cv=none; b=Fmpmw16LdRedTobxCjW0Uk9Dty84w60u3vEt2cERAcQIzGWH4KDWfVGcAG3sSRoi2NQNE+GIt0cikbb2v/APApS63pMq85S59+pn2S0R+yUepwTXommvI6k8ahPcuwJEMOAHLjCC2u1ZltMIT2HlK7mpsn8wt1HYx9w18Fy3uXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376347; c=relaxed/simple;
	bh=BZZquw/jXmlgegwfN6ZKdryo2XXh+2ogII0Lar0RgTs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rfB7U/MWaTKyc4HAL9dUqc3D6za8QaN+cWKOX196G7zYkgSNfmtCOFG5PJE1EqyyoeUDGWt70JLqzgZXph7xIFC+yCAE2wqGxVz51FrVqPtFMyH3leDukPLw/r5aY0/K5wcWWRVjNaH3Ckio896ey2k4GBDAs+TBd/PbQUdLzVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XxeN9XOL; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XxeN9XOL"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782376342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vhqrTpONrLAKDeSNSKScdeEVuc9qz3WGSi76AN9w4mM=;
	b=XxeN9XOLEMLSe6LZc1Cyojts7VeKZllWIK4sK7Jaf3imzJIC03UcjQt6t1PWp4eFIbDYtE
	YL1IOyWqmvz3chwhIOfD79SZ8Pzqu/rDL0mTzC37bnrx24UbsFBZ5fCpNT8iHkOAFmRHtQ
	d809qytT2t2Uv3uH6ZWwcUu/LfahFUU=
From: George Guo <dongtai.guo@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	George Guo <guodongtai@kylinos.cn>,
	bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf 0/2] LoongArch: BPF: Fix tail call count handling
Date: Thu, 25 Jun 2026 16:32:10 +0800
Message-Id: <20260625083212.277417-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Two independent fixes for the LoongArch BPF JIT's tail call count (TCC)
handling, both found while enabling the arena and tailcall selftests on
LoongArch.

Patch 1 fixes memory corruption / a kernel panic. For an arena program the
extra REG_ARENA slot in the prologue shifts the callee-saved area down by
one word, but BPF_TAIL_CALL_CNT_PTR_STACK_OFF() did not account for it, so
on every tail call or bpf2bpf call the JIT loaded the counter *value* and
dereferenced it as the TCC pointer.

Patch 2 fixes an off-by-one: emit_bpf_tail_call() increments the tail call
count before the NULL-slot check, so jumping through an empty prog_array
slot is charged against MAX_TAIL_CALL_CNT and programs reach the limit one
call early.

Both carry Fixes: tags and Cc: stable. They touch only emit_bpf_tail_call()
and the new offset helper; there is no functional dependency between them.

George Guo (2):
  LoongArch: BPF: Fix tail call count pointer offset for arena programs
  LoongArch: BPF: Don't charge an empty prog_array slot to the tail call
    count

 arch/loongarch/net/bpf_jit.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

-- 
2.25.1

