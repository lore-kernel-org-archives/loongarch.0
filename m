Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0A92C3256
	for <loongarch@lists.linux.dev>; Wed, 20 Aug 2025 05:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755669464; cv=none; b=NHBiysLQOk479WwbRIyVe9DWsum3ZPqxY2jegFPqcnhP/oVr/jQ1W06bALe/ICzIo+J8SxwTYn4eiuRAAimuHZrNI79/cWRGnl8vHwvQruZN3B/ccQyPXQwQHrfB5I1IxI+D3Ury+FUN2lWgQi2VXJRcWRWLGAqq5/nNrzcIJdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755669464; c=relaxed/simple;
	bh=QUKo6e58SSJFQgr+/h0Hwp0bH0rAwKhcQAAdxn7j7xs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bYiyvcpMriP+2Mdh7jsbr5VhkzocOuW4gEwpYRY97puqG8kRDtHB2cAXh+ueNjsZz/FwveUkQ58QZaoPJ/Iojx4nOLEtbcL4lOqLCQv6dZmha5WIZFleqMvBaeaxRL7ocQ4pzMYulvbzsnAKbQh3QfaY984CW0s6tQm0gaMymuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZGfbgEJ9; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZGfbgEJ9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755669461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRynx6jaHBNziqdWwYMx6lpx2wd+0zdA8DgB67CZ52I=;
	b=ZGfbgEJ9PJrpkrn+SPytCPRo0OZ5Nlnlm+sI5fekbXIkZjiInD+QN+yH9I9MKdf72pSFis
	eBKau8BS29jkoPYVSTx/XJ5/RtoTcBGA6Hs6iz7FMKPGD/lUhvVzNjYM5H2Ac2ki1XxeFI
	COFKubd3VtnCyZLXDQX03KNd4ZddSrc=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Baoquan He <bhe@redhat.com>,
	Yao Zi <ziyao@disroot.org>,
	kexec@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v2 5/5] LoongArch: Enable CONFIG_KEXEC_FILE
Date: Wed, 20 Aug 2025 13:57:00 +0800
Message-Id: <20250820055700.24344-6-youling.tang@linux.dev>
In-Reply-To: <20250820055700.24344-1-youling.tang@linux.dev>
References: <20250820055700.24344-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

This patch enables config KEXEC_FILE by default in the
loongson3_defconfig, so that user-space tools like kexec-tools
can use the same as the default interface for kexec/kdump
on LoongArch.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 34eaee0384c9..6cfea2f37cc0 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -45,6 +45,7 @@ CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PERF_EVENTS=y
 CONFIG_KEXEC=y
+CONFIG_KEXEC_FILE=y
 CONFIG_CRASH_DUMP=y
 CONFIG_LOONGARCH=y
 CONFIG_64BIT=y
-- 
2.43.0

