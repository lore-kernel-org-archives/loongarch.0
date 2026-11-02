Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604503;
	b=W76EGJ0D/A0NeqJ0GqgiwsPPuLx7Ycb51aH8n78FopcCjviHROsHPxWfZPGjvdJy+ibo
	 CW7IOQA8+eZjgNL397I+E3sVSpZnBcdV4r/P241Ni77cppmhy6Fp4GuMmshiDVCTB3GRg
	 gvB+/vk5hupjOldZAynu1goNzGuG4f4p49Og46J6RxK7ZIcCNifX4gDVLCqIrRv1aVgHy
	 ej9GzhOSAaIVWHDVP38L+ruAB2FGpmkQqztoUPEXC8vjnPauyxKZKIBoxBMiYYGhKr8Cp
	 xwZ+teT1AYZ6sckb95nOYjxNKeIuFhG9RVzmF4LqIElM7Jkw7NFFmxiHYkAs22Fcl4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604503;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=Wse2F7+6oVnMsdu7FIZpEZRqYn9z5X/pz8aI/U0NR/M=;
	b=kWtTdhFDFrjxYidglvSfdhgmqEsBEnxKPs3jKT8MzLwgW9kQYxi7MEIO6lK+wQ+h0qRE
	 sge2Eq+DaIR1EhW48KKVdUHJAP3Ufkc6vX5/DsTFP8Rgv1hOa4Fn1Y0i2aF3pOxCA3vbm
	 Gm3uwd6IzK47ieVemB9zsUPKxVJKRg27B8RBMPSqvkgcMtqXm3gU4JBG//yosJ/y22lzM
	 9C7l/RGH70XnzfTIaqIPLhjJNom8r6/5v4u41O4JOhab0YsqWrqR9FaS3UMnVwIKLIEEY
	 FohdezRGG76dqC+WtJ+2m7/P7bxd48dApfoLhF45hxWtbId6uFfiBtJreK22JOiJLng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F05F606A329
	for <loongarch@lists.linux.dev>; Mon,  2 Nov 2026 07:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F05F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxytGNO+hqWHQbAA--.13476S3;
	Mon, 02 Nov 2026 15:28:13 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx2c2KO+hqSsoxAA--.37951S3;
	Mon, 02 Nov 2026 15:28:13 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] LoongArch: BPF: Make arena support depend on SCQ extension
Date: Mon,  2 Nov 2026 15:28:07 +0800
Message-ID: <20261102072808.23080-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261102072808.23080-1-yangtiezhu@loongson.cn>
References: <20261102072808.23080-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJAx2c2KO+hqSsoxAA--.37951S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw4DWryruw1ruFW3JF1kZwc_yoW5WryrpF
	W3CF4kKr4qqw1Sv3y7Aw1kG3W5CFWrKF15G3WrCrWrArs8Xw17Xry8Kas09Fs8JrWrZ3WY
	ga4jyrW293Z3CagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8niSPUUUUU==

When testing bpf selftest "jit_insns/cast_to_user", there are different
behaviors on different Loongson machines.

(1) Loongson-3A6000
  $ sudo ./test_progs -a jit_insns/cast_to_user
  #193/2   jit_insns/cast_to_user:OK
  #193     jit_insns:OK
  Summary: 1/1 PASSED, 0 SKIPPED, 0/0 FAILED

(2) Loongson-3A5000
  $ sudo ./test_progs -a jit_insns/cast_to_user
  ...
  libbpf: map 'arena': failed to create: -ENOMEM
  run_subtest:FAIL:unexpected_load_failure unexpected error: -12 (errno 12)
  ...
  #193/2   jit_insns/cast_to_user:FAIL
  #193     jit_insns:FAIL
  Summary: 0/0 PASSED, 0 SKIPPED, 1/1 FAILED

This is because the arena range tree uses kmalloc_nolock(), which requires
128-bit atomic cmpxchg support, provided by SCQ extension on LoongArch. On
CPUs without the SCQ extension, arena map creation fails with a misleading
-ENOMEM error.

Make bpf_jit_supports_arena() return system_has_cmpxchg128() where it is
defined, so arena map creation fails with -EOPNOTSUPP on CPUs without SCQ
extension.

Furthermore, given that the macro system_has_cmpxchg128() is only defined
when CONFIG_AS_HAS_SCQ_EXTENSION is enabled, guard it with an #ifdef to
preserve compile-time robustness and reject arena otherwise.

With this patch, here is the test result on Loongson-3A5000 without SCQ
extension:

  $ sudo ./test_progs -a jit_insns/cast_to_user
  ...
  libbpf: map 'arena': failed to create: -EOPNOTSUPP
  run_subtest:FAIL:unexpected_load_failure unexpected error: -95 (errno 95)
  ...
  #193/2   jit_insns/cast_to_user:FAIL
  #193     jit_insns:FAIL
  Summary: 0/0 PASSED, 0 SKIPPED, 1/1 FAILED

It is better to mark the test status as SKIPPED rather than logging a
false-alarm failure if the feature is not supported, but this belongs
to a separate bpf selftest patch.

This is similar to commit 536b523b4073 ("bpf, riscv: Make arena support
depend on ZACAS").

Fixes: 4fdb5dd8aeba ("LoongArch: BPF: Implement bpf_addr_space_cast instruction")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 3ab039d0afb6..01c12da168ee 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -2489,7 +2489,15 @@ bool bpf_jit_bypass_spec_v4(void)
 
 bool bpf_jit_supports_arena(void)
 {
-	return true;
+	/*
+	 * The arena range tree uses kmalloc_nolock(), which requires 128-bit
+	 * atomic cmpxchg support, provided by SCQ extension on LoongArch.
+	 */
+#ifdef system_has_cmpxchg128
+	return system_has_cmpxchg128();
+#else
+	return false;
+#endif
 }
 
 bool bpf_jit_supports_fsession(void)
-- 
2.42.0

