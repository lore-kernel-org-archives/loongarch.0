Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1018F3AB29A
	for <loongarch@lists.linux.dev>; Tue,  7 Jul 2026 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408899; cv=none; b=OXh0KM6/cV9Xj4gRqTPkYwjcn+/8P9nIC9oguEieKySM3Mu12t0c7pT1du44QI1p3KmM+r81AGWVJow8+CVNq/V1IOSzxKwFpdIXKNF3GPtGKshduFZKkzk4k7Ht2LIp1I0ptzxdY8N8dVCaJSkOrgOqf13srsEIMmbIKVjMEnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408899; c=relaxed/simple;
	bh=oLaUr+FB9VSsAuBRiSWaPzIJPJ7H5RqIcSuL90V25FQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LjTHLnQDQEAROfry//7jwxoO7KyExWudozA13N2rFNscv8KVNUTQBWx9uB4Xz67szRVEy0pLmHrhoiqccvWqPPLa1uRbkEt4YCuNRVpUZ3IFVhc9YavYot+egvvb0aiZQjaEbdpB/kUekuRHbvj+m9tTZ9NHnU7sFPvTvL+fHAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V0oLar8W; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V0oLar8W"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783408890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svJYdefjY/nnU0nlx6aQgjbpTVvVYZOsKKX0wUiaSj0=;
	b=V0oLar8WHfeL8Mf4YkchnWlrtNzB+U/hQf6Lk1qrfrJB6v943An71OU/xS1rYytucTsSmT
	wF2Ib4ghAT2G81X35+M2UbpRWI9TV0BiHuv/tzabBkC/9ZrSMDqCqWHufs5uHAWjGX88wd
	aYiYASxTrY7cTyl+gaUjp3i4k5exiRY=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	jpoimboe@kernel.org,
	peterz@infradead.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com
Cc: kernel@xen0n.name,
	joe.lawrence@redhat.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	yangtiezhu@loongson.cn,
	jiaxun.yang@flygoat.com,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	xry111@xry111.site,
	wangyuli@aosc.io,
	loongarch@lists.linux.dev,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/12] objtool/LoongArch: Add arch_adjusted_addend() for KLP support
Date: Tue,  7 Jul 2026 15:20:20 +0800
Message-Id: <20260707072031.231066-2-dongtai.guo@linux.dev>
In-Reply-To: <20260707072031.231066-1-dongtai.guo@linux.dev>
References: <20260707072031.231066-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Implement arch_adjusted_addend() to return the relocation addend value.

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 tools/objtool/arch/loongarch/decode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index 6cd288150f49..674e4efd138f 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -34,6 +34,11 @@ s64 arch_insn_adjusted_addend(struct instruction *insn, struct reloc *reloc)
 	return reloc_addend(reloc);
 }
 
+u64 arch_adjusted_addend(struct reloc *reloc)
+{
+	return reloc_addend(reloc);
+}
+
 bool arch_pc_relative_reloc(struct reloc *reloc)
 {
 	return false;
-- 
2.25.1

