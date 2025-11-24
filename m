Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5CE2F5A30
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 09:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976435; cv=none; b=shMlShBdX3Br8uTXf5TSkZAH6kMf1ejVlogne2aVpZWxIZCq+AmrecB5M8VQtslaEdttBaHWVQrt1CEdEEaQbyZ1kDmfxS60n1KLMebV6AQYA5ajn8VKkLvj3dn2Uqkc34Zp1E4lTSwhu8cjHnnPbyHt+jtuVe4vZm1V72Ptcl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976435; c=relaxed/simple;
	bh=8TifsbTNXqYIYqD9lXrhIsElmC4Aa87KXjt2KqkZcjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6MqSRFBB7QMh0MVH4ieGcYqarA9pVNJnUa1tDJMnHWNqHKFQjIFZKf9Xa9TMfCniJP+UFkQy/Ww8a9vIo/oTaY0w9URYGO+bBjRyvd8pb/51bJErP1q+R/485SvamIdrjxvjSDqaGJqAQ6fn/CSvrVwk6j86sm28zxXWUQpZQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q+cX0lgy; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q+cX0lgy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763976431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qd6hbMJvs0YabNz3CCTWdf/jCMHxiJ1lcDXBCRGzJYI=;
	b=q+cX0lgykJL3ZtL5P2U/ep3iAtXMmXxRa7H65tKyrHg5d5rQ0Pq/DdcdRuTitT0WsNWEPk
	rcq4oHCPNWGEm2Ioq/fP4+kcfUp72OQWi58z+oborshYPF4Vx2wCYbKDwR9FqADFjf7mc8
	1cfaNwJ3YoxvJ2erBA/+mTY1DfDwxfw=
From: George Guo <dongtai.guo@linux.dev>
Date: Mon, 24 Nov 2025 17:26:30 +0800
Subject: [PATCH v2 2/2] LoongArch: Enable 128-bit atomics cmpxchg support
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-2-v2-2-b38216e25fd9@linux.dev>
References: <20251124-2-v2-0-b38216e25fd9@linux.dev>
In-Reply-To: <20251124-2-v2-0-b38216e25fd9@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 George Guo <dongtai.guo@linux.dev>, George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763976426; l=1046;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=jJgZhwA4ooo3Ax4Z4naKB2Lj5KNiYF1TJyBIlsCbAQU=;
 b=5rKSWaY93YF7a1D3IhcCI4cRndcFN3EsEhr07oh+kQx4zYCQDdpaTFVL/LtHdq0GpvyciryLN
 z27qDUId66cC/hz3Ey2MoDpuF5Yxjk6z//VgPTQrrOyw3ipHIS4aoTS
X-Developer-Key: i=dongtai.guo@linux.dev; a=ed25519;
 pk=yHUJPGx/kAXutP/NSHpj7hWW0KQNlv3w9H6ju4qUoTM=
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Add select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE in Kconfig
to enable 128-bit atomic cmpxchg support on LoongArch.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 5b1116733d881bc2b1b43fb93f20367add4dbc54..6fb2c253969f9ddece5478920423d7326c3ec046 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -114,6 +114,7 @@ config LOONGARCH
 	select GENERIC_TIME_VSYSCALL
 	select GPIOLIB
 	select HAS_IOPORT
+	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
@@ -140,6 +141,7 @@ config LOONGARCH
 	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select HAVE_EBPF_JIT
+	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS if !ARCH_STRICT_ALIGN
 	select HAVE_EXIT_THREAD
 	select HAVE_GENERIC_TIF_BITS

-- 
2.48.1

