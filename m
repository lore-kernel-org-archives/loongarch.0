Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4792F49EC
	for <loongarch@lists.linux.dev>; Fri,  5 Dec 2025 06:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764916178; cv=none; b=m2pldiQoTEEoYhx7KqfA72eT4b8QPbcBsXpCdgV1Q7RM4Hl7XXLxQ+G0x4SOBUN8aahbl5CjxU7VdwLqoZtKbDPQicWjrbyZpj8xFBpqX+lGrGKlzEdtnWUsoZUcOWfFJMwZlZ5+O1eW8WsbmJmJ1JProflkGntr0E9eeU0y3+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764916178; c=relaxed/simple;
	bh=jBTSf1NBjHQ0A85ubxl+1PskFCEAy3vCJ4zJY+SfPYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KocCs0LAghI8xq8GeUa4qlRu1bZwKBejT+DqXkatJYMHZ5r2WuLIgLsuc2EDgfW6qLBxI7vXUv67ETlBWPk+joyvwKULFSm6U1GImi0R9n7DRedujcQbrkjKPooMWGU9VliuvgM64gO2mcDfqp1EAsfS66WmXTFKq4QULAuVZ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AV31+iMp; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AV31+iMp"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764916175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XnHdPbNZY+icNHDhsU00WTTGxUuRI5fAPK2EbH7Tj7Q=;
	b=AV31+iMpTXKQcElWK/hU5Kcj1Wmv6dXqia85uaEROKfWssCby6m62e6S7kv4dAeKBDh1Bn
	tsrhIBqL/r5xDroCQUE0JNQTOOFOU4eqNS8ONNvZdgxgEz1NgK6wV2RbOH9BrxFHynDOCG
	D7BBUiTlwQwNRwFrfUWO2ryTXPJbzQI=
From: George Guo <dongtai.guo@linux.dev>
Date: Fri, 05 Dec 2025 14:29:07 +0800
Subject: [PATCH v4 4/4] LoongArch: Enable 128-bit atomics cmpxchg support
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-2-v4-4-e5ab932cf219@linux.dev>
References: <20251205-2-v4-0-e5ab932cf219@linux.dev>
In-Reply-To: <20251205-2-v4-0-e5ab932cf219@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 George Guo <dongtai.guo@linux.dev>, George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764916160; l=1046;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=ciDWXt3BQSm1RCVw/2AyrNMAA+62PK+Q6MPycedHCU8=;
 b=BLAmpMY9tnhJlSwlaGTR8TBDvVc4J0Qd0e2os0lEFKVfdi9+KzRrAlXdrHT3q3rt+FxYoCmux
 xQBdiUrePU/CvkEaR5mH0o7Gg45W2JF5pcLvOmBdqBq1NCEJIt15ORQ
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
2.49.0

