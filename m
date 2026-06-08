Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4853BED46
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 10:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913444; cv=none; b=krVVvqsDDgXyEQUyLccgQbVFt2efyicG3ft5GITkk2nKvwtjw4erNYRpKdTBKUzZrdpAAR8xY5lpKjmr0tar8Bw2gFQknbog2ZUVi89sMgmHPekf4fX1hVPW6NZ6A4oqf4Q/j/imAXIgYsKpAKolwGjwwHKTOBln4fJSG2HajUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913444; c=relaxed/simple;
	bh=dydZVhth1y6JE7+fyLmn2w7NHqI4W6Xits7j2exGHig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nbJfeXP3t4vQasmo0fa0TWrdVsW7SkO0OykE/4qByztH1Ga9XjqdgOeyetSlVHN5m55n8uxuVJ+HJD+DupYlyLAPp6pcw+BnIozm/+pmv6sUAljXO3vOXj9oeqyspgWfN+mDaMBG9JL6MjnXK1KqUKl+tBiDLKxjDhesuoBv3GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m2FsbYpH; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m2FsbYpH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780913441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2K4imcceEzYpUOx6xUchhbO3GzKewULjWdUSxLezYq8=;
	b=m2FsbYpHffZ/H+tvH+IxMgXM/MiTgHfy+iQKy2XeKjO0eOqwjxQo2CL3B5a8/T6kPMgsU8
	j6/5+zkif4G2JIMSHuHWlyn2GBH6fOEDCY8s8HcIUkT/w2lce5PHF0KMjkXUbhAevUzS1B
	a/VhVqdPl0y4sWUc9MS8f7ogL2QS4Ow=
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
Subject: [PATCH v2 7/8] klp-build: Add LoongArch syscall patching macro
Date: Mon,  8 Jun 2026 18:08:51 +0800
Message-Id: <20260608100852.325413-8-dongtai.guo@linux.dev>
In-Reply-To: <20260608100852.325413-1-dongtai.guo@linux.dev>
References: <20260608100852.325413-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Add LoongArch support for KLP_SYSCALL_DEFINEx(), mirroring the generic
__SYSCALL_DEFINEx() pattern from include/linux/syscalls.h.

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 include/linux/livepatch_helpers.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/livepatch_helpers.h b/include/linux/livepatch_helpers.h
index 4b647b83865f..a8aad067177b 100644
--- a/include/linux/livepatch_helpers.h
+++ b/include/linux/livepatch_helpers.h
@@ -91,6 +91,28 @@
 	}								\
 	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
 
+#elif defined(CONFIG_LOONGARCH)
+
+#define __KLP_SYSCALL_DEFINEx(x, name, ...)                             \
+	__diag_push();                                                  \
+	__diag_ignore(GCC, 8, "-Wattribute-alias",                      \
+		      "Type aliasing is used to sanitize syscall arguments");\
+	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
+		__attribute__((alias(__stringify(__se_sys##name))));    \
+	ALLOW_ERROR_INJECTION(sys##name, ERRNO);                        \
+	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
+	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__)); \
+	asmlinkage long __attribute__((optimize("-fno-optimize-sibling-calls")))\
+			__se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
+	{                                                               \
+		long ret = __klp_do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
+		__MAP(x,__SC_TEST,__VA_ARGS__);                         \
+		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));       \
+		return ret;                                             \
+	}                                                               \
+	__diag_pop();                                                   \
+	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
+
 #endif
 
 #endif /* _LINUX_LIVEPATCH_HELPERS_H */
-- 
2.25.1

