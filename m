Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F08D3090FE
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 02:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764122773; cv=none; b=qWpyAu0ZC1g6YVWwQQqXnT9ui4//J1Eb4fUSE2Sez9gwqF1yXoJhysz+U8CLvkvNHo0a69WpaSFg/MK1jBoNZbnIABKPvxfvIIeDRLIJDYpSzXUlD0pnjyl2zwpST8YLlJNqMPmPq3GhSUenO2Ek0kA1aJOCeBeoLbmMhjZRwo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764122773; c=relaxed/simple;
	bh=8TifsbTNXqYIYqD9lXrhIsElmC4Aa87KXjt2KqkZcjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KIqjQPiNslc+2++tEZUstKP4PoHsXUX1jdf5YA2Z1RVPpiu0EjHd3D52zD0niCGHT6GX7J4ihk8gTGRFDuE3AK6+Aof3pHlJ8RD/LcHvC7Pf+6kW/oSiUvzdbLAguHts8zt4CJd0ljF6NwFwsEpRUzZWdxAp9+adIhCbuVY9Xlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VC7tQSx2; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VC7tQSx2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764122767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qd6hbMJvs0YabNz3CCTWdf/jCMHxiJ1lcDXBCRGzJYI=;
	b=VC7tQSx2GWvoQl5CDS+jqGUm/3Y15uXxTw3eoZVwbPB53Df1zLs0yFoWXLP4RmQ5saoyx4
	kXq5QssRG0UNdygsN898jAgzD7rcQaUPII91vOLPTW0yFqrkXfu4o8Li3glhcfKl+CVeR9
	nVr9cC1er/puluA+u1/osRfI3JBwY2c=
From: George Guo <dongtai.guo@linux.dev>
Date: Wed, 26 Nov 2025 10:05:51 +0800
Subject: [PATCH v3 2/2] LoongArch: Enable 128-bit atomics cmpxchg support
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-2-v3-2-851b5a516801@linux.dev>
References: <20251126-2-v3-0-851b5a516801@linux.dev>
In-Reply-To: <20251126-2-v3-0-851b5a516801@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 George Guo <dongtai.guo@linux.dev>, George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764122759; l=1046;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=jJgZhwA4ooo3Ax4Z4naKB2Lj5KNiYF1TJyBIlsCbAQU=;
 b=EyzwY+EjUXHL5YSCwu7+wb0RxiIJz3LVNu5NtKXY13cQQzJ5Ii99mr4WisRxWmXW01LlPFxoZ
 9qKcKOKjfKhBYDvaPnNUCFFpNDWh5MwhILDx1VpIcqmWv92y3J67zIo
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

