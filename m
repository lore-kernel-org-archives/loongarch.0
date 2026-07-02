Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8645E2EBDFA
	for <loongarch@lists.linux.dev>; Thu,  2 Jul 2026 02:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782959124; cv=none; b=miFIFxB4bFkqvjByvibY8pgLFlFfaFfBCpL63I2CEgZ8Jd3tSPmA/aeFHidzIy62JltRJFZwYJ9hzm3RAdx940Bs2xiU3L5uGMxEoT9l/+zqgRZNvJGbJ9FdcEcRXto9Ampxo9PkSfmL3ocYqOytVdaUj4JACDwIJxWgsCMQQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782959124; c=relaxed/simple;
	bh=oWGCDeInbCsa1ASxuX2ySdcFuX2MA6q4duP/oVn06Yk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a6o1ADWTNsFhEb1nyonb1mF+8qE4NihCsij/7XmVoHZbb1x+kNCZ2GZgdsA+jE5CRSKJC4eF6Dw6+PlgnH+MI6lUU7rYhLJP6qhw0UBJoKYE1T9cu1xLLEjiDyhuC1r6bUN5APh4AHixUkPWfMi4adZEYqb6rOrRAEUWbwRKbjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VV8KYdbQ; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VV8KYdbQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782959122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oQfRiZog4SBEdxvYhnX/dtSk1v9+C3JVdCsGBBIYCiM=;
	b=VV8KYdbQwvMEza1DhIhY5bx6GHSR3d0tiaeY5GsNgXnxFGkWUDRdd/jXdmVfmOgvvmGz5p
	/5qdwlK339UgoiMp2W6Mx2/EVr2JXn92IfwXAbO006PcaRRdb0r20vyZLcvW8hBiUMaOM2
	7O155fyaM+NeYAZEK2pVLoGX6J4GrgE=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	George Guo <guodongtai@kylinos.cn>,
	bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 10/11] selftests/bpf: Enable arena atomics tests on LoongArch
Date: Thu,  2 Jul 2026 10:23:21 +0800
Message-Id: <20260702022322.51033-11-dongtai.guo@linux.dev>
In-Reply-To: <20260702022322.51033-1-dongtai.guo@linux.dev>
References: <20260702022322.51033-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Now that the LoongArch JIT implements atomic operations on arena
pointers, add LoongArch to the arena_atomics load-acquire/store-release
architecture guard so those subtests run on LoongArch.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 tools/testing/selftests/bpf/progs/arena_atomics.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/arena_atomics.c b/tools/testing/selftests/bpf/progs/arena_atomics.c
index 2e7751a85399..38a628b4ee24 100644
--- a/tools/testing/selftests/bpf/progs/arena_atomics.c
+++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
@@ -29,6 +29,7 @@ bool skip_all_tests = true;
 #if defined(ENABLE_ATOMICS_TESTS) &&		  \
 	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
 	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) || \
+	 defined(__TARGET_ARCH_loongarch) || \
 	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
 bool skip_lacq_srel_tests __attribute((__section__(".data"))) = false;
 #else
@@ -316,6 +317,7 @@ int load_acquire(const void *ctx)
 #if defined(ENABLE_ATOMICS_TESTS) &&		  \
 	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
 	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) || \
+	 defined(__TARGET_ARCH_loongarch) || \
 	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
 
 #define LOAD_ACQUIRE_ARENA(SIZEOP, SIZE, SRC, DST)	\
@@ -368,6 +370,7 @@ int store_release(const void *ctx)
 #if defined(ENABLE_ATOMICS_TESTS) &&		  \
 	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
 	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) || \
+	 defined(__TARGET_ARCH_loongarch) || \
 	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
 
 #define STORE_RELEASE_ARENA(SIZEOP, DST, VAL)	\
-- 
2.25.1

