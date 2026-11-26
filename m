Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672460;
	b=iCZ7ugS76EgUc43kQWCOYW1D1yihG7gb1iKHYsyyddkFokyTO4ZKpXWrIC9oNu97uYYO
	 sw63Psv3zfWtMWH8SN4/lNW1+f1GfMMUKVibAHJb8ljUbwy6ELWxGc7Pv6y+T1eMvact5
	 Lh6VJ0CZxcnrke7+HdUF4/BSYOsOk4wLyTP86GSebBgZi5JvRyNPdLw3+UiGjq6Q8rC5C
	 3Cbz0tQ4iFj5mvnldR5GpOHFIgf17Sf9mILlmbHFVkrwVFoZKhXGLoSTKGxuQqSrfSTw1
	 nTl4w28mouOCFt5MG++8FkGDwAi/xR8g04DTnskMKaTRHNVCWvMTgVjGTkr6raNyVJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672460;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6sqiVTrDEe2NBuw3nlAAoo2cHvqlzBtrt28T5zPPIyU=;
	b=UCDBvixCu72iOqm+a5zAkAjUsdp4nxEOIQPOR5DXzk/msf9vYllIlJg2tMV0Snv1i1Qx
	 Hx1rQKzI0lz0f+meRw3WcZX1xmctJNrzCIU4WGnBl2TJNzXRcFrZRom72htBlZBday09Q
	 J8IBLmL+5CmTtS1oYgAgLjGKMlQKlYGuLY7eU+Oq7ijAQuyaqMR13kRNWb6mlEbQ7Ld06
	 tiHPv5Wh26RoLsSaeR2xmBq1wMszbAaI5Bv2ki5PC/n49/N6GMpN1wPNLxccffHJIa1un
	 qt7pAuo6ruDRTxXUbenORFHBjV9TBRPo/EIPIMAlK7qxUI9OJ1NO4g0WUXPX2elDpdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m9HX0h2S;
	arc=none smtp.remote-ip=91.218.175.119
Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF92606A31E
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 05:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFF92606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m9HX0h2S
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=48jh6X0S0d/3YzMepgD+fBr+qcdyyP0trXSd2pnvpUM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672457; v=1; x=1796277257;
 b=m9HX0h2SfK2mGszpXzDcz1LbtCXh9UiltXV301pmtOqaBIBZnBFOngjFtQhKvjX/ZkTqCgHM
 LEILn7hXtLwTYtLUjyVOufsYYt9S+oxy2aXBWvX7ZbEnrvCBZqonEd5PXWLOf1S2a4jWy9yq2RR
 bYlolNI74K3bSQkn1rihzx1k=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d7a20327b4be166a;
	Thu, 26 Nov 2026 05:54:17 +0000
X-Mizu-Trace-ID: d7a20327b4be166a
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH bpf-next v1 3/5] selftests/bpf: Enable struct_ops private stack tests for LoongArch
Date: Thu, 26 Nov 2026 14:53:52 +0900
Message-ID: <20261126055355.9967-4-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126055355.9967-1-dongtai.guo@linux.dev>
References: <20261126055355.9967-1-dongtai.guo@linux.dev>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Guo <guodongtai@kylinos.cn>

As the LoongArch JIT supports private stack, enable the struct_ops
private stack tests for LoongArch.

With this patch:
  $ sudo ./test_progs -t struct_ops_private_stack | tail -1
  Summary: 1/4 PASSED, 0 SKIPPED, 0/0 FAILED

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 .../selftests/bpf/prog_tests/struct_ops_private_stack.c        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c b/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
index 103179ff8733..730d5741591c 100644
--- a/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
+++ b/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
@@ -7,7 +7,8 @@
 #include "struct_ops_private_stack_large.skel.h"
 
 #if defined(__x86_64__) || defined(__aarch64__) || defined(__powerpc64__) || \
-	(defined(__riscv) && __riscv_xlen == 64)
+	(defined(__riscv) && __riscv_xlen == 64) || \
+	(defined(__loongarch__) && __loongarch_grlen == 64)
 static void test_private_stack(void)
 {
 	struct struct_ops_private_stack *skel;
-- 
2.53.0

