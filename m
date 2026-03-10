Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8952C0268
	for <loongarch@lists.linux.dev>; Tue, 10 Mar 2026 06:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773125128; cv=none; b=Ris4ve8JC79f+ga6nz/Dq/zZX2hIhn5rOIEQ4CsI8HvF5e3HBhMVkGZN+zk5gjyE6X9ivcIk9EbZj0LjOzZqu+v8SIFldxvp1BmCt87VK+VtnNhAr+/uckoOvQaGKtN8u1hh/jV4AUwfYZopnAHM07FQePeJYvEdaAeg+8mnCUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773125128; c=relaxed/simple;
	bh=L7yUsAXBQukTf4riI0ud3QV9+JjBI45f38a8XFQUDY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTpGwZECnhsLc9K9mEKbTU3AClpBtvEykMsFtWk118+gR6X2/942YKgX6nB07cISpDmYnusu6huFOiJrYfgim64fOkM0a2JzBGZvA3hmYxv1mx7OTaSFGpU6AeRbBVLosuT51cU2incGHGB1x08XZVlyu+saxpkoz5nTxgELzJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxL6r9va9pj2oZAA--.15584S3;
	Tue, 10 Mar 2026 14:45:17 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxOMHzva9p8edRAA--.11000S3;
	Tue, 10 Mar 2026 14:45:16 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1 1/2] selftests/bpf: Check alignment flag if expected result is REJECT
Date: Tue, 10 Mar 2026 14:45:06 +0800
Message-ID: <20260310064507.4228-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260310064507.4228-1-yangtiezhu@loongson.cn>
References: <20260310064507.4228-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMHzva9p8edRAA--.11000S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr4DAry7tryrZFW8AFyDCFX_yoW8Wry3pa
	yxtFyq9F4ktF17Gry7C3yDuFW0qr1vqry3ZF10y34UJFn5Aryxtry0gFy8XF9IgFWFqa1S
	v34S9w1Y9F13XagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==

CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is set unconditionally for the
most archs such as x86_64, aarch64, ppc64el and s390x, but this config
may be not set by users for riscv64 and loongarch64.

If CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set, the BPF verifier
detects if a program has unaligned access and then rejects them. So it
should also check the flag F_NEEDS_EFFICIENT_UNALIGNED_ACCESS if the
expected result is REJECT and set alignment_prevented_execution as 1,
then the message "(NOTE: not executed due to unknown alignment)" can
be printed for some testcases of test_verifier to reflect the reality.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/test_verifier.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
index a8ae03c57bba..a1ae2f044e96 100644
--- a/tools/testing/selftests/bpf/test_verifier.c
+++ b/tools/testing/selftests/bpf/test_verifier.c
@@ -1640,6 +1640,11 @@ static void do_test_single(struct bpf_test *test, bool unpriv,
 			printf("FAIL\nUnexpected success to load!\n");
 			goto fail_log;
 		}
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+		if (fd_prog < 0 &&
+		    (test->flags & F_NEEDS_EFFICIENT_UNALIGNED_ACCESS))
+			alignment_prevented_execution = 1;
+#endif
 		if (!expected_err || !cmp_str_seq(bpf_vlog, expected_err)) {
 			printf("FAIL\nUnexpected error message!\n\tEXP: %s\n\tRES: %s\n",
 			      expected_err, bpf_vlog);
-- 
2.42.0

