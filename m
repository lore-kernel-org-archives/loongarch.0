Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D86E32D0D0
	for <loongarch@lists.linux.dev>; Mon,  5 Jan 2026 10:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610533; cv=none; b=T9/ZCuKVmcAFIIuekxyPJggp9W092geN9a9MqQS1Ht2rhYAjWkERnSWUyq1fbOYxescUmFEiqll8WdzX4W6bAXWDUAuuENphQ057lk6Nyndz9+UMjiHeKoO+e9afXxwnhRYlQVywDBdEumtDf/5Sm5qLOwzD2Osm10ZFrSwvtKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610533; c=relaxed/simple;
	bh=VvIMH6uDCfo9dHgHYOA50uC9oucTRbBEH2ez1L+nu/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aI+ZD0UeeIiEpTAAKcZHMjq9o3MX03y3oOlT1gYM0jdBOSFZ+NcM7JNJY0RJdMvCSYEIt9DEpAmF9VYzs2nRBmPvxWe3Rvmu3Uxlg4BY0q1qPach3AgJJWzmTVAKZDy2EhV8xWp7FS6K5cnBkSvAQgDC/V+JcYK//xj1LK/6tC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ELLsImp8; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ELLsImp8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767610529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90lPtiX5iGw6HKdw2bSu0Tovhut4F8g9SrqqXr/vigA=;
	b=ELLsImp8JFptd+lTJNZSfdVorahEefI8KjaNa2rDC5GcGrfiODzfnoECuPDP4KG1Af2MAv
	XWN9r7PSsQAYwTLsMndefSojZCDLqhWOu7DGCBLTJt/LjJYpp093OYoKmYaVQbho4OEG/S
	A4LN5JMvYdwODSvvWQiDGuayJzSZVrA=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: dongtai.guo@linux.dev,
	hengqi.chen@gmail.com,
	kernel@xen0n.name,
	lianyangyang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	r@hev.cc,
	xry111@xry111.site,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH v9 loongarch-next 4/4] LoongArch: Enable 128-bit atomics cmpxchg support
Date: Mon,  5 Jan 2026 18:55:14 +0800
Message-ID: <20260105105514.76021-5-dongtai.guo@linux.dev>
In-Reply-To: <20260105105514.76021-1-dongtai.guo@linux.dev>
References: <20260105105514.76021-1-dongtai.guo@linux.dev>
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

Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>
Tested-by: Hengqi Chen <hengqi.chen@gmail.com>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 730f34214519..f9845ebec1a4 100644
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
@@ -130,6 +131,7 @@ config LOONGARCH
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select HAVE_ARCH_USERFAULTFD_MINOR if USERFAULTFD
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_DEBUG_KMEMLEAK
-- 
2.43.0

