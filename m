Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F713845B2
	for <loongarch@lists.linux.dev>; Tue,  7 Apr 2026 06:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775543010; cv=none; b=DuP4ygTi7qvt2RqhQtvjGvqv106sdHc33GWLe8eSihhVg3HEdn8pudJsscX3MkRHzmxwzoBeW3W8WxQN7f63WAVBp+O/SH/hF1dnTWe0sRwQDdfq5C7JdRXXsOk05y6vKdJs/NNmeTqMHgcsBRIAMeZ69v0vBTfC+W589PDMHEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775543010; c=relaxed/simple;
	bh=mCp4it8EUfMTU9HORMd1P/tyjkUnKYdEXsV+q3LQIBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZdQjP6L0Ss8hsBCr2b2u1qLIuJ3cvxAzdi8rx/FrLiMdi911YTvEPHB4whryJmRm85BqXIb32BHBujJY0BzBowJ0FtHZ6h3g0CIHgYmEq/8kV4FzeYtpe8d8jtcnvn2ug79nvH+7dbjUFe4GSNf3A6qXYNZHoXqFqP29h3OWm5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxQcDfotRpzqUiAA--.37715S3;
	Tue, 07 Apr 2026 14:23:27 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCx_8LLotRpYh5nAA--.54S7;
	Tue, 07 Apr 2026 14:23:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] selftests/bpf: Make CAN_USE_LOAD_ACQ_STORE_REL usable for LoongArch
Date: Tue,  7 Apr 2026 14:23:06 +0800
Message-ID: <20260407062306.8915-6-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260407062306.8915-1-yangtiezhu@loongson.cn>
References: <20260407062306.8915-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx_8LLotRpYh5nAA--.54S7
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tF17GrW8JF1DArWxKFWkXwc_yoW8tFWrp3
	WkuFyqyr18Kr4a9FnxAFWUuF4rGFykXrW8AFW0vr47G3WUJrWxJr1qkFZ0yFZ0ga9Yvrn5
	Zwn2qw13Zr48ZwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8CztUUUUU=

In order to do the following load-acquire and store-release tests
on LoongArch:

  sudo ./test_progs -t verifier_load_acquire
  sudo ./test_progs -t verifier_store_release
  sudo ./test_progs -t verifier_precision/bpf_load_acquire
  sudo ./test_progs -t verifier_precision/bpf_store_release
  sudo ./test_progs -t compute_live_registers/atomic_load_acq_store_rel

it needs to make CAN_USE_LOAD_ACQ_STORE_REL usable for LoongArch.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/progs/bpf_misc.h           | 4 ++--
 tools/testing/selftests/bpf/progs/verifier_precision.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
index c9bfbe1bafc1..19f0bf44a9e1 100644
--- a/tools/testing/selftests/bpf/progs/bpf_misc.h
+++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
@@ -257,8 +257,8 @@
 
 #if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) &&		\
 	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) ||	\
-	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) || \
-	  (defined(__TARGET_ARCH_powerpc))
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64) || \
+	defined(__TARGET_ARCH_powerpc) || defined(__TARGET_ARCH_loongarch))
 #define CAN_USE_LOAD_ACQ_STORE_REL
 #endif
 
diff --git a/tools/testing/selftests/bpf/progs/verifier_precision.c b/tools/testing/selftests/bpf/progs/verifier_precision.c
index 4794903aec8e..6f325876efdd 100644
--- a/tools/testing/selftests/bpf/progs/verifier_precision.c
+++ b/tools/testing/selftests/bpf/progs/verifier_precision.c
@@ -75,8 +75,8 @@ __naked int bpf_end_to_be(void)
 
 #if (defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) || \
 	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64) || \
-	defined(__TARGET_ARCH_arm) || defined(__TARGET_ARCH_s390)) && \
-	__clang_major__ >= 18
+	defined(__TARGET_ARCH_arm) || defined(__TARGET_ARCH_s390) || \
+	defined(__TARGET_ARCH_loongarch)) && __clang_major__ >= 18
 
 SEC("?raw_tp")
 __success __log_level(2)
-- 
2.42.0

