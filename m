Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8C22DF3F2
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363262; cv=none; b=JjD5T3j5JdTI5uSWBvhQ0ZbxK4/CI+bYWU5fcRF4LYv/VJY96V5Kig2Vtj9AA81gf1665Tmfqi+xHl1VBXqKQCt82+oT07p+ID354GEEETCxoD27R5jQhKaPA5IAg9doAeF+vPFWLLCSfA2mP/SxxAevj7sBCvDn7koEJr8un4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363262; c=relaxed/simple;
	bh=GdZbgUj2QRiknFpRHXo8OJb+ATv1Li/oaUZb06UqX2Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfdMgTEC0FUYRKbZAbbgfm2I24A4MeWBME3Xpwvxf8FLwljcBp2UhH8Lf02nlBjvliv8Sn0zmovW8R90jTMt4pQmKFyDFjEKhFLpX7lf3isHk1WDGpn9iZbN2XiLFbPhqkOFrQEzKq9l0lh7opOWnMqyii/YGQJuczTs2zwc3SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxsOo7afBpFK0EAA--.15979S3;
	Tue, 28 Apr 2026 16:00:59 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAx38I1afBpmWt2AA--.27930S5;
	Tue, 28 Apr 2026 16:00:59 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC bpf-next 3/3] selftests/bpf: Test jited inline of bpf_get_smp_processor_id()
Date: Tue, 28 Apr 2026 16:00:51 +0800
Message-ID: <20260428080051.20938-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260428080051.20938-1-yangtiezhu@loongson.cn>
References: <20260428080051.20938-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx38I1afBpmWt2AA--.27930S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFWrAr1fZFW7XFWkKFW5twc_yoW8Xw13pF
	Wku3sxtry8GFy2gayxCF4rXFy5XFn5Z3yrAr1Fk3yDCF18Jr1DJr93Kr13AFy5WrZY93s5
	Z3W2gF45Ga4UXabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcsjjDUUUU

Add the testcase for the jited inline of bpf_get_smp_processor_id(),
only for LoongArch currently.

Here is the test result on LoongArch:

  $ sudo ./test_progs -t verifier_jit_inline
  #570/1   verifier_jit_inline/inline_bpf_get_current_task:OK
  #570/2   verifier_jit_inline/inline_bpf_get_smp_processor_id:OK
  #570     verifier_jit_inline:OK
  Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED

Note that this test will pass only after the JIT inline support for
bpf_get_smp_processor_id is merged. While the JIT inlining is still
in the pipeline, adding the changes now will not introduce any build
regressions. It serves to define the expected JIT output for future
validation.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 .../testing/selftests/bpf/progs/verifier_jit_inline.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
index 913a1699e42b..e4d683c8cb06 100644
--- a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
+++ b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
@@ -19,4 +19,15 @@ int inline_bpf_get_current_task(void)
 	return 0;
 }
 
+SEC("fentry/bpf_fentry_test2")
+__success __retval(0)
+__arch_loongarch
+__jited("	ld.w	$a5, $tp, 8")
+int inline_bpf_get_smp_processor_id(void)
+{
+	bpf_get_smp_processor_id();
+
+	return 0;
+}
+
 char _license[] SEC("license") = "GPL";
-- 
2.42.0

