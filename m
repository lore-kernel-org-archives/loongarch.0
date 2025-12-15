Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7BA2C0281
	for <loongarch@lists.linux.dev>; Mon, 15 Dec 2025 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786969; cv=none; b=ZwIF3/gFHcfSTX5wZfHiBW6R+Iu/rhuQFd/A5lxF1qruUWeMIbBaWt8kJ1OiBE9/bBPBscVrdG71NN8gIJsS8XCx/52N7kPWYtCamAB6e9ZsS/SDbJVZWU89/gAeI8NSkrGKdU3JpnVbcRnvY3jc2Nv3XYktAUpeeXWEZMuVk+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786969; c=relaxed/simple;
	bh=jBTSf1NBjHQ0A85ubxl+1PskFCEAy3vCJ4zJY+SfPYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5qhBvJB9QJGpm9Ta2iEryg4q7Hp/sXEICeg9R6rrAw2j8I+etHp1a+eHWObseRylSLnE5mcLHqfZMl4bW7nn/rczHPdi0mcrt3rWmrmyEx921vTNpIgSvIOjE+cNA5YXOfdp/FozYG+mss3Qsf0kIS6ExHq+H1vO6dWzY5FgGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tSafFRUj; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tSafFRUj"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765786965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XnHdPbNZY+icNHDhsU00WTTGxUuRI5fAPK2EbH7Tj7Q=;
	b=tSafFRUjcri0kk/LKeDUWGBY16ZYmLR1FCdTK/b1GxPfQUw60oG41n8Doo1khp6SRKSWVA
	HIFgk+4lH3TcVlZbfKeYvJmYr9XMVYAguxeY7O9GJq7OOKEPgt7NssDpAxblxXj3NClpU7
	DVUqPt8UI/wxDpiEuNEQcnerhHjs2PY=
From: George Guo <dongtai.guo@linux.dev>
Date: Mon, 15 Dec 2025 16:22:04 +0800
Subject: [PATCH v6 4/4] LoongArch: Enable 128-bit atomics cmpxchg support
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-2-v6-4-09a486e8df99@linux.dev>
References: <20251215-2-v6-0-09a486e8df99@linux.dev>
In-Reply-To: <20251215-2-v6-0-09a486e8df99@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 hengqi.chen@gmail.com
Cc: r@hev.cc, xry111@xry111.site, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, George Guo <dongtai.guo@linux.dev>, 
 George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765786949; l=1046;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=ciDWXt3BQSm1RCVw/2AyrNMAA+62PK+Q6MPycedHCU8=;
 b=1iI1XIbB8mlkKnO/8vzxPD4K1e2TfwP2hScjG31FoCnwv+LkIDUwXDCCUx8CJlI572cq9I5aV
 Tix9yEfvMpbDIlHnDIem4aXkAv3w6RY6XXVBNdIfaDkRy6miVC7x6zo
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

