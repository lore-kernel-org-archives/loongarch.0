Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DE22F068C
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 03:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767152740; cv=none; b=GHK5pwAKYadmZ0PTPBGq0rMFCoTWc1bd09IFfHeS5eDXTR1ohvBN+PK8xQBt/F3nOZOhuDMMjcbCFa9eNjeSXhTvKzETUOXmtmu5jtCKeFIJ50JG3qEaJlJPcfJV87TMqU9IMNf6zlnFhF7u2WkAQOm5L/vWDyj5WGX0/adQ/JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767152740; c=relaxed/simple;
	bh=sxTP2oXXUnc5NysmI2N+EZ1bqhsGfXhqVJPVELj4s9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rx9u3t12Jia4Csvey8l3nxChCaJV8qdStEnD0coqsgNFcIKGb7HJOkGHR6k1/CK0ad68KlLsya0qapi5mb7Q2egzzqvQPhlLZLqRwOFjxYAHRXOMkcqJyiyRqKKJa4ikjP4xZ1YFGVmecOKK4rWQ96R/0kvPA/oczSRckGaIlgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OV85iR8K; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OV85iR8K"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767152737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqpeETFJkzNuoFoanCBY+LFS018RYhS6I82D9WQGSDc=;
	b=OV85iR8KBGbrdZ+m+1p7Sr7AwqQkRY1v1yrNwDddheK74m/bKJ4Nk6z0EyGMXS5zqvUnEI
	bmoT4p4lsCDBOz4y3oq+iKBxbSJiEIxZVt0nBW65KDii4TQE5mdooQVBINNmB57I8tqJlh
	D+xcX1QyUodNoB59sWStcH4t7goSt1c=
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
Subject: [PATCH v8 loongarch-next 3/3] LoongArch: Enable 128-bit atomics cmpxchg support
Date: Wed, 31 Dec 2025 11:45:23 +0800
Message-ID: <20251231034523.47014-4-dongtai.guo@linux.dev>
In-Reply-To: <20251231034523.47014-1-dongtai.guo@linux.dev>
References: <CAEyhmHSi1LPW75Ovt=M8-8sv1S2LRmZw_YduJt9OUoy+OMSjKg@mail.gmail.com>
 <20251231034523.47014-1-dongtai.guo@linux.dev>
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
2.49.0

