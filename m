Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3FF2D0C92
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766990067; cv=none; b=hboI4F5adzqR2gaOj5PCK+a3Lj5frvUMlfZJoCkQiExIX8ZcUox/PH0UawaFvfVBfkP+O6/0ZFP+0ut+g94fe7amY4MM3KVCUU6hQGs3i3P6DhG1OIdvjGv7BsOHVbU9RiDDGN56Qn2A78cjrVkKmicF2ACJt/c9+WommhC4258=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766990067; c=relaxed/simple;
	bh=IxKRFQ2hIDuBInN9BpkikMOrYdxArX340pZEltaRdgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m77TP9L0HAM+XcHBavAS35lRLuZJp5s+rGetkcm07BQgxVZizAZPjEnapPFKpYgkKJtclyx4jEivcKmh/b3eA9VQWEoWZqXZV+vjP7ohPPTlhMyG+a7t/aebiTbvZSWuU3WAbL0lvoA0AuZ0LE3v8/I0sVsLeLlrGV1hCy2w+Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wA+F8b8P; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wA+F8b8P"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766990063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Busr31vYwHCmPhkYpBb+hPfItK01jR0m3O6Awmw6lU=;
	b=wA+F8b8PEXDDcOwbDBGqjPlLk/43Kdb9MyxsZoPzAj6IPt+s6sR/ALqTlD9Z3WbnSGuujq
	TxQNcYNYvtwfy/4yYzHSWKhIu5DwjlPNeXCRGDZ0w8SzeieMvtXOMDWpjD6CPDyfwj0nUJ
	dNQwgNhsGKRzUwRaR4yEMauWmgFSNBM=
From: George Guo <dongtai.guo@linux.dev>
To: hengqi.chen@gmail.com
Cc: chenhuacai@kernel.org,
	dongtai.guo@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	lianyangyang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	r@hev.cc,
	xry111@xry111.site
Subject: [PATCH loongarch-next 4/4] LoongArch: Enable 128-bit atomics cmpxchg support
Date: Mon, 29 Dec 2025 14:34:08 +0800
Message-ID: <20251229063408.34340-5-dongtai.guo@linux.dev>
In-Reply-To: <20251229063408.34340-1-dongtai.guo@linux.dev>
References: <CAEyhmHQgkgU-c6rmBc0672oNCdQAzz4Ob5kN4p7k6MUo9B4Okw@mail.gmail.com>
 <20251229063408.34340-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Add select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE in Kconfig
to enable 128-bit atomic cmpxchg support on LoongArch.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 730f34214519..d4de823276d1 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -114,6 +114,7 @@ config LOONGARCH
 	select GENERIC_TIME_VSYSCALL
 	select GPIOLIB
 	select HAS_IOPORT
+	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_BITREVERSE
 	select HAVE_ARCH_JUMP_LABEL
@@ -141,6 +142,7 @@ config LOONGARCH
 	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select HAVE_EBPF_JIT
+	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS if !ARCH_STRICT_ALIGN
 	select HAVE_EXIT_THREAD
 	select HAVE_GENERIC_TIF_BITS
-- 
2.49.0

