Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E42826B741
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753099; cv=none; b=HdZ1iGmRmLAOLV2pI4JGlCnNNuUdIUdK22+kCtP/cBrP+8gbzNU1E7aSYGpdLq36TTQzJpdL3aKR5jSxJ1ab67LthXuoTf4cvDg+uzVq3ZhnOn1H+8+dMQDervEVpz5ujZZhxBGLR+CqeC2S/ro/GguiJxVfwvlXYPJfkUEmfwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753099; c=relaxed/simple;
	bh=UoH7J0oEBDN34+51ceJIwHqRobz1aoc3VNpYnNPpb0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D3rAM2yHhYIkqb9xMavrrxYFNWdXhjUvqiV9xlv+s5XHpEdx/HfjlziENEXKJKerezHlQvVrM/ygidnZ74MJJZ3Ig8W42UhV6BGN2jL9O0YnoVBZP7dxAM4VrLLvRrngvkah7CbglBs5J9abZlnO8sOvjsKCnXZ5aM16sOFfNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=ZTwah7Sd; arc=none smtp.client-ip=159.100.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="ZTwah7Sd"
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id B727F260DB
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 09:11:29 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id 818793E8D1;
	Wed,  3 Dec 2025 09:11:22 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id A2C6140086;
	Wed,  3 Dec 2025 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1764753077; bh=UoH7J0oEBDN34+51ceJIwHqRobz1aoc3VNpYnNPpb0c=;
	h=From:To:Cc:Subject:Date:From;
	b=ZTwah7Sdo+Chr6cIeFlzf9ntW5sQLqujdS8TO0I70XdW1BeUOlKe/tdrgQLqXlBWc
	 aAJhK2iSrHeXmjdDb2lObyDtB3Noq9JL4MgSj1AvcwXQ0LA4+wNnCXMdjCNn+56ArB
	 Z5A2f1kgfpJ6bn6i12TqLQ8yWego195CqlI5Ge7E=
Received: from avenger-XINGYAO-Series (unknown [39.144.78.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 5A6B0407D7;
	Wed,  3 Dec 2025 09:11:12 +0000 (UTC)
From: WangYuli <wangyuli@aosc.io>
To: jpoimboe@kernel.org,
	peterz@infradead.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: yangtiezhu@loongson.cn,
	pmladek@suse.com,
	alexandre.chartre@oracle.com,
	wangyuli@aosc.io,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	guanwentao@uniontech.com,
	WangYuli <wangyl5933@chinaunicom.cn>
Subject: [PATCH] LoongArch: Add klp-build support for live patching
Date: Wed,  3 Dec 2025 17:10:39 +0800
Message-ID: <20251203091039.125259-1-wangyuli@aosc.io>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: A2C6140086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]

From: WangYuli <wangyl5933@chinaunicom.cn>

Add klp-build support for the LoongArch architecture, enabling
automated live patch module generation using objtool.

Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
---
 arch/loongarch/Kconfig                | 1 +
 tools/objtool/Makefile                | 3 ++-
 tools/objtool/arch/loongarch/decode.c | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 1a0a5f9def33..7b5f2a329908 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -159,6 +159,7 @@ config LOONGARCH
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
+	select HAVE_KLP_BUILD
 	select HAVE_LIVEPATCH
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index ad6e1ec706ce..cead37c25a69 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -8,7 +8,8 @@ ifeq ($(SRCARCH),x86)
 endif
 
 ifeq ($(SRCARCH),loongarch)
-	BUILD_ORC	   := y
+	BUILD_ORC    := y
+	ARCH_HAS_KLP := y
 endif
 
 ifeq ($(ARCH_HAS_KLP),y)
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
2.51.0

