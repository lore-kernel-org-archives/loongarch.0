Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55D29D28B
	for <loongarch@lists.linux.dev>; Fri, 12 Dec 2025 03:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765511762; cv=none; b=lZBqVugKS1/OF0iHF7Dtk5Ds/pyFt/lEsRB3J4LmV3OJYiIPwD+OpVF06GgiHaIq2Kp8RKR68qS0yaJ2o+erD28hptfujgHQtsNbbxz99uI9wPJWIwl/8DntZWtSsrFuHq7F7LpGtPYmPTbHthod1cRd+6QeroF9AfEN3BW4i3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765511762; c=relaxed/simple;
	bh=jBTSf1NBjHQ0A85ubxl+1PskFCEAy3vCJ4zJY+SfPYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VsLHZRoNIHlqNeIwMP4XTbqVEQR1Yp/MN/lDW8aIvqQZIsVAgH1WlWrwSGXoM8R9/XZHiaXYNhkSnPamINefswLF/l2C5KFWrUSPC4HvsjsHMMVdCSHKhOSSVFdPx2E0FWVJziXrlL637F8SzJIC9kK1fDXtDHsDGaC9NVhm7+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uYyF8QVs; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uYyF8QVs"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765511758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XnHdPbNZY+icNHDhsU00WTTGxUuRI5fAPK2EbH7Tj7Q=;
	b=uYyF8QVs82XmAN/rHGEBYvkLM4FMUsol9d2Vp5MBczXC9tzSNd1ScTSeDVCW3Rn/0SFAC4
	KP6jbyACbGRfIQEUUqG1GiKdDrd6Irf/31dTSDeM6AoyBS/7kU/Unx0Ewh5fJa2HwXfUwQ
	/7OG0+oXfBidtBAC078iRNpMJjHo6Ro=
From: George Guo <dongtai.guo@linux.dev>
Date: Fri, 12 Dec 2025 11:55:24 +0800
Subject: [PATCH v5 4/4] LoongArch: Enable 128-bit atomics cmpxchg support
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-2-v5-4-704b3af55f7d@linux.dev>
References: <20251212-2-v5-0-704b3af55f7d@linux.dev>
In-Reply-To: <20251212-2-v5-0-704b3af55f7d@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 hengqi.chen@gmail.com
Cc: r@hev.cc, xry111@xry111.site, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, George Guo <dongtai.guo@linux.dev>, 
 George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765511741; l=1046;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=ciDWXt3BQSm1RCVw/2AyrNMAA+62PK+Q6MPycedHCU8=;
 b=ZW9gZ1juolUW/BLqBECUQQJjWNWj7Efqfny3S2TkznOxTPTO15pU6sOtV1s63P1CiiMkjkvSO
 pYCz4leT7g2B+KvKNfqKUXtxvCXVxA8sxMNNuDOmtnt0okYvw+fq7sh
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

