Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F237842A788
	for <loongarch@lists.linux.dev>; Fri, 24 Jul 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893344; cv=none; b=pIA0TD1Q8pMzGKTmMEomCRMah20QJaTAz+5WffbNJYazRp1M2M0bSDv6ynpHM8v18jq9msql/LvhbLfVYCkGCYSgYw8+rb1yVhg0of+erowk4TfLiCjm2FAhj0JP3+sqS/css39OWPIFeWZS9FSObh2qOY64C37/M/saizuMNBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893344; c=relaxed/simple;
	bh=g4aWsJHOiDyicVy+6atNZeWvyTiklyF5B/Q9s60sTEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzxhU4185n2+yYco4KF2MiDtSpr3Fu92ty/LT+vLmTP4LtjX73Vv+/db0xhaXDQ3Cn8KfBJeYahxH+WbriDs3f9TgYN3n8DapGCrtaqpHrhB67mbtrtiyhS5JO/+6sA57L7vZQEFBBfDebFGf+t+BujuQUp5I/FLTKgB60pjels=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D8ya6kBZ; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D8ya6kBZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784893337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YodUDurSBZ0t3mGqHGWa1pwdwgkEMO0YVH20Jc2peyc=;
	b=D8ya6kBZ5iyWBDJ2Hqd7Fx+WaE3Z+8K0AI2YXDn8UoAxZLLJF0pWcRfguyRzuwNdkjIRje
	/vH+Eh4utMDPEi0cHUFDQb70zHyRcrrgFv98Jil21rEtjRr0ru0y9KMcGiNP0/VfRqkGFm
	S2uyuSJlwtbrA211tHGHFR1N5rU/KIs=
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
	wangrui@loongson.cn,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	xry111@xry111.site,
	wangyuli@aosc.io,
	loongarch@lists.linux.dev,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WangYuli <wangyl5933@chinaunicom.cn>
Subject: [PATCH v4 01/14] objtool/LoongArch: Add arch_adjusted_addend() for KLP support
Date: Fri, 24 Jul 2026 19:41:14 +0800
Message-ID: <20260724114128.31451-2-dongtai.guo@linux.dev>
In-Reply-To: <20260724114128.31451-1-dongtai.guo@linux.dev>
References: <20260724114128.31451-1-dongtai.guo@linux.dev>
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

Co-developed-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
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
2.53.0

