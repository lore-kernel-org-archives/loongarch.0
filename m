Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBB034214A
	for <loongarch@lists.linux.dev>; Wed,  1 Apr 2026 07:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775027544; cv=none; b=aEShGzXL2+FrQAufAQiq8MSD/Uri4RikzFECYyPZpU//avVJYmIuW9ipSW0p3jw4bY5cBL7vnlr6pocLf1VqkXSjwAmmJz27OW8YUO3+mCzJBKbkXSHclrt4EK/09T3YkA0dqmgiXD+7m+W9t2gmDZ4Fe7Ddzl2p0kOzc2Y5dSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775027544; c=relaxed/simple;
	bh=tkMXePbxW3t2lmJKsAOcCLJIvAzmR7LVYYvr5wdsMxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XzosRBwLWGCYvpaGf530JQI101qEFBX58a+TmDwIOnVTBMnTjUGh0H4hAycAojX3pcAnWGaIoHCaVaeDPyMIFrHsWAmHMOULbRApKUBFX50UKfspo1HzYxHppDKwiANnfTBEwyF9YaFu8/TvPxEwVIxodDjPbRWZF6VDQu1sL4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxXcNJxcxpFbYgAA--.27087S3;
	Wed, 01 Apr 2026 15:12:09 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxHMJHxcxppFpiAA--.55591S2;
	Wed, 01 Apr 2026 15:12:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] LoongArch: BPF: Support more atomic instructions
Date: Wed,  1 Apr 2026 15:12:01 +0800
Message-ID: <20260401071206.5506-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxHMJHxcxppFpiAA--.55591S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jr48uFWrJr45Wr18tF1UArc_yoW7uFWfpr
	s29an8JF1kA3429asFyFy8uFyv93Z3Xr43Gw1Fkr1fAF1rGF1qyrW7WFnFvFW5ta1kJw4F
	qw1jvw1UXr98ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==

This series is based on 7.0-rc6, the aim is to support more instructions:
(1) 8 and 16 bit read-modify-write instructions,
(2) load-acquire and store-release instructions.

When compiling, please set CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS and
unset CONFIG_BPF_UNPRIV_DEFAULT_OFF.

All of the related testcases passed and no regressions for bpf selftests.
Here are the test results on LoongArch:

  $ sudo ./test_progs -t verifier_load_acquire
  #577/1   verifier_load_acquire/load-acquire, 8-bit:OK
  #577/2   verifier_load_acquire/load-acquire, 8-bit @unpriv:OK
  #577/3   verifier_load_acquire/load-acquire, 16-bit:OK
  #577/4   verifier_load_acquire/load-acquire, 16-bit @unpriv:OK
  #577/5   verifier_load_acquire/load-acquire, 32-bit:OK
  #577/6   verifier_load_acquire/load-acquire, 32-bit @unpriv:OK
  #577/7   verifier_load_acquire/load-acquire, 64-bit:OK
  #577/8   verifier_load_acquire/load-acquire, 64-bit @unpriv:OK
  #577/9   verifier_load_acquire/load-acquire with uninitialized src_reg:OK
  #577/10  verifier_load_acquire/load-acquire with uninitialized src_reg @unpriv:OK
  #577/11  verifier_load_acquire/load-acquire with non-pointer src_reg:OK
  #577/12  verifier_load_acquire/load-acquire with non-pointer src_reg @unpriv:OK
  #577/13  verifier_load_acquire/misaligned load-acquire:OK
  #577/14  verifier_load_acquire/misaligned load-acquire @unpriv:OK
  #577/15  verifier_load_acquire/load-acquire from ctx pointer:OK
  #577/16  verifier_load_acquire/load-acquire from ctx pointer @unpriv:OK
  #577/17  verifier_load_acquire/load-acquire with invalid register R15:OK
  #577/18  verifier_load_acquire/load-acquire with invalid register R15 @unpriv:OK
  #577/19  verifier_load_acquire/load-acquire from pkt pointer:OK
  #577/20  verifier_load_acquire/load-acquire from flow_keys pointer:OK
  #577/21  verifier_load_acquire/load-acquire from sock pointer:OK
  #577     verifier_load_acquire:OK
  Summary: 1/21 PASSED, 0 SKIPPED, 0 FAILED

  $ sudo ./test_progs -t verifier_store_release
  #615/1   verifier_store_release/store-release, 8-bit:OK
  #615/2   verifier_store_release/store-release, 8-bit @unpriv:OK
  #615/3   verifier_store_release/store-release, 16-bit:OK
  #615/4   verifier_store_release/store-release, 16-bit @unpriv:OK
  #615/5   verifier_store_release/store-release, 32-bit:OK
  #615/6   verifier_store_release/store-release, 32-bit @unpriv:OK
  #615/7   verifier_store_release/store-release, 64-bit:OK
  #615/8   verifier_store_release/store-release, 64-bit @unpriv:OK
  #615/9   verifier_store_release/store-release with uninitialized src_reg:OK
  #615/10  verifier_store_release/store-release with uninitialized src_reg @unpriv:OK
  #615/11  verifier_store_release/store-release with uninitialized dst_reg:OK
  #615/12  verifier_store_release/store-release with uninitialized dst_reg @unpriv:OK
  #615/13  verifier_store_release/store-release with non-pointer dst_reg:OK
  #615/14  verifier_store_release/store-release with non-pointer dst_reg @unpriv:OK
  #615/15  verifier_store_release/misaligned store-release:OK
  #615/16  verifier_store_release/misaligned store-release @unpriv:OK
  #615/17  verifier_store_release/store-release to ctx pointer:OK
  #615/18  verifier_store_release/store-release to ctx pointer @unpriv:OK
  #615/19  verifier_store_release/store-release, leak pointer to stack:OK
  #615/20  verifier_store_release/store-release, leak pointer to stack @unpriv:OK
  #615/21  verifier_store_release/store-release, leak pointer to map:OK
  #615/22  verifier_store_release/store-release, leak pointer to map @unpriv:OK
  #615/23  verifier_store_release/store-release with invalid register R15:OK
  #615/24  verifier_store_release/store-release with invalid register R15 @unpriv:OK
  #615/25  verifier_store_release/store-release to pkt pointer:OK
  #615/26  verifier_store_release/store-release to flow_keys pointer:OK
  #615/27  verifier_store_release/store-release to sock pointer:OK
  #615     verifier_store_release:OK
  Summary: 1/27 PASSED, 0 SKIPPED, 0 FAILED

  $ sudo ./test_progs -t verifier_precision/bpf_load_acquire
  #596/5   verifier_precision/bpf_load_acquire:OK
  #596     verifier_precision:OK
  Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED

  $ sudo ./test_progs -t verifier_precision/bpf_store_release
  #596/6   verifier_precision/bpf_store_release:OK
  #596     verifier_precision:OK
  Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED

  $ sudo ./test_progs -t compute_live_registers/atomic_load_acq_store_rel
  #80/7    compute_live_registers/atomic_load_acq_store_rel:OK
  #80      compute_live_registers:OK
  Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED

Tiezhu Yang (5):
  LoongArch: Define format for AM{SWAP/ADD}.{B/H}, DBAR and BSTRINS.D
  LoongArch: BPF: Add the default case in emit_atomic() and rename it
  LoongArch: BPF: Support 8 and 16 bit read-modify-write instructions
  LoongArch: BPF: Support load-acquire and store-release instructions
  selftests/bpf: Make CAN_USE_LOAD_ACQ_STORE_REL usable for LoongArch

 arch/loongarch/include/asm/cpu-features.h     |   1 +
 arch/loongarch/include/asm/cpu.h              |   2 +
 arch/loongarch/include/asm/inst.h             |  11 +
 arch/loongarch/include/uapi/asm/hwcap.h       |   1 +
 arch/loongarch/kernel/cpu-probe.c             |   4 +
 arch/loongarch/net/bpf_jit.c                  | 193 +++++++++++++++++-
 arch/loongarch/net/bpf_jit.h                  |  12 ++
 tools/testing/selftests/bpf/progs/bpf_misc.h  |   4 +-
 .../selftests/bpf/progs/verifier_precision.c  |   4 +-
 9 files changed, 217 insertions(+), 15 deletions(-)

-- 
2.42.0

