Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672455;
	b=sxCQq/3pcR9VjuuHF5WCNBVOJn8esaQ8+cKtJOTb8rJaCcSioj0vP24l/x/vnbG7XzNS
	 i7D5BdJrxsPFCQ0b7OjsMvCL+ITc74XC8inakPfrmsd+s1mkyM4i/NeFgRmNm+3LaROLn
	 N+iVQQ2BVUBYWZDh0me//f9LDqBiMQkywajRwgL0hC3POtPZiHcuc/+EJIJ40dFlx5uhY
	 vJ3AotaB8RpC2u2jbjNAY3LOLg3G4jb5E/vJN80KXLMD/i6REM+unK6V0dqNVGM6CdrYB
	 SXGy+LoJnADww9f0Kb6RAnPVqt6si94EBUKHSKl1wwqVwuW6iMZzPTs7W2PqfICB6EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672455;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qH3mpj2/hJm9tn/Nzzofy4FMFli+1gACokUbRo8C0+o=;
	b=enxSQvZaWn+Lq7Y9jSyNPMLK+/uXec+b0ZqnuYdFvUBYJ2DwWSWzSJF5jaPIrPstas/j
	 iaGeNso5eTE4CZLmMUIfqMQNnMpuJfYq0x7Q95VbuMCQxfHSm0t3Zkj0DKbLqlWwGTWU0
	 1VfC00j1ngj58qtr8P1nq9D1Bk9xoBrhpbRvhESyB3lYVNAqQrYgi5iXIiRaBNrTJ8NGP
	 17EM2JDvaqpvJG/TwbmoEix5LZELCmi8Zgw5FOJLyBJafQU0eQ9FpoCI6U0F5vvfKqN/N
	 5Y7cRcq9Jpf7sXxWbB4SVIjYDXYOwLTTmR8Gm7JNDXTUbnk4NDPENolZsj3aEMqY7dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hwPqy6Kf;
	arc=none smtp.remote-ip=95.215.58.83
Received: from mta1.migadu.com (out-83.mta1.migadu.com [95.215.58.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5CA606A326
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 05:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F5CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hwPqy6Kf
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=5IXQjQYl3ynF57FUD38TBi94RLTKK46vofzPlB9f6f0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672453; v=1; x=1796277253;
 b=hwPqy6KfVg3zbFdhCTE7msVrzQb5RMIIFxdo8weWnVfOEudM4rgTyRqaHKZcrulCVrH7c+XZ
 nhFt7tEb7TG4rhaJ6kexYMXKj6d6KKR1IvrfsR0u0kbVL2A4Vuvc50C7hnuhQ9kUPuuw6zjuYIP
 tEb0Xt6y37HqjC3Sz1s0SCcQ=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 02c115c139af8cae;
	Thu, 26 Nov 2026 05:54:12 +0000
X-Mizu-Trace-ID: 02c115c139af8cae
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
Subject: [PATCH bpf-next v1 2/5] selftests/bpf: Enable 2 KiB private stack test for LoongArch
Date: Thu, 26 Nov 2026 14:53:51 +0900
Message-ID: <20261126055355.9967-3-dongtai.guo@linux.dev>
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

As the LoongArch JIT supports both private stack and large stack, enable
the "private stack: two frames of 2048 bytes" test in
verifier_large_stack for LoongArch.

With this patch:
  $ sudo ./test_progs -a "verifier_large_stack/private stack: two frames of 2048 bytes" | tail -1
  Summary: 1/1 PASSED, 0 SKIPPED, 0/0 FAILED

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 tools/testing/selftests/bpf/progs/verifier_large_stack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_large_stack.c b/tools/testing/selftests/bpf/progs/verifier_large_stack.c
index cbabb41d973c..f25455d628d5 100644
--- a/tools/testing/selftests/bpf/progs/verifier_large_stack.c
+++ b/tools/testing/selftests/bpf/progs/verifier_large_stack.c
@@ -248,6 +248,7 @@ __description("private stack: two frames of 2048 bytes")
 __load_if_large_stack()
 __arch_x86_64
 __arch_arm64
+__arch_loongarch
 __success __log_level(4)
 __msg("stack depth max 2048")
 __msg("subprog 0 (private_stack_two_frames) main {{.*}} stack 2048")
-- 
2.53.0

