Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A22A315D47
	for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118848; cv=none; b=ATFyJFkUUaCkpzdkCp7FyyF5j+N0wHVctsMZxXdb1kgG9u2ug9Grz6DOZdcYPI+96nFY+9U8Prck/n7jObpXDbcvpQoFmYIEtCb8YcznBSm8LpVB8wQYwRdpZneKgooavRLzToDIlaa3VBKIOtpGW5IQ7Wh2oo6n8SK58V9ijDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118848; c=relaxed/simple;
	bh=L77VHJOsxYGfJl12t5E1P3bJEqsaMDW4GIC4V2YxBI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLg9dYqPmWbzQhYEZtAYX8MoeYqHQOZQIe/ed4NpciNIJUDGnLh7WQv6QPTm+w3MiIUKM72G9B8hpY5Fc7sbWh4/FW44Up9Eh1PofmEEDdUxeY/G+N/hjcxFBGYS+1UCTbRJwxtgz62jtCHXWiTJdp4g4m1UjmpORbXVc+IgA4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L48H43W4; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L48H43W4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763118845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUnrWplutHBzvgR2dvaxPt91n3EUIlT8RN+kjzr9YeU=;
	b=L48H43W4jFZRnZVw9O79JRiRB5m9aw/GV0MPdZjIrgDSOzS1xJajXCccgoMGVVyjHQVMx8
	ixGDGcGZ9+fwVuXGogoz7wJwNfE66muSzsaVj6jY+ONOTTSdEs5AZWkbAoLKzZN3TJkNEr
	SLREeZzO+x0CEbQrd41ME+/n9u8TpH4=
From: Qi Zheng <qi.zheng@linux.dev>
To: will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	dev.jain@arm.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH 6/7] um: mm: enable MMU_GATHER_RCU_TABLE_FREE
Date: Fri, 14 Nov 2025 19:11:20 +0800
Message-ID: <27f173b0fc6fdf92104721fc3daba8d7d9d31e2f.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <cover.1763117269.git.zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Qi Zheng <zhengqi.arch@bytedance.com>

On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of
empty PTE page table pages (such as 100GB+). To resolve this problem,
first enable MMU_GATHER_RCU_TABLE_FREE to prepare for enabling the
PT_RECLAIM feature, which resolves this problem.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
---
 arch/um/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 097c6a6265ef3..47a41bc77bb24 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -41,6 +41,7 @@ config UML
 	select HAVE_SYSCALL_TRACEPOINTS
 	select THREAD_INFO_IN_TASK
 	select SPARSE_IRQ
+	select MMU_GATHER_RCU_TABLE_FREE
 
 config MMU
 	bool
-- 
2.20.1

