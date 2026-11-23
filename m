Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409413;
	b=a001HoWnlB+ycj58xGlcN0QoghwwFSrCyuBrKfa13tPBrEJCtQvb+JXKJzBKBqjXflAn
	 ynfhvLq+IpDM+g1m+W104CuXMUeBDE2XUIccgXCmtsS0VHsEntUt5uLMbz+KgIABnBQRQ
	 ghdMwf+X+ZV377a83kbBP4Pxu+1tUA78nEprPmiknRn38K/sH+fc538nBRIdUNGpT9Y76
	 HNMF2Qw5gHGi0CAK+nOV/lb2wnW1YoVlZR4j41LNd6oVgsR86fUkoRsfFcRuZoFvlN1nR
	 prVh0zEVS29qFiDnrBSjkQsbEVQKRWCW4yScApXp1fA2FLz4P7plo2AOc8Wysugjhwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409413;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=r/+cSEXj3IwI++X6dcNtFJlJAe4ePfWeqb2U+jEzRlE=;
	b=QdJ7qUYLH5RJSJxFYRdvHEDVMzdlcx6US745sFgXXAIjN/IWkPckZGSTrGJhTyNyKrkq
	 VhnpqlmYBYp1mC046cuKIBj55E4WD8M6imj/E9RURyrmGECE9izqa2RmzvDercR6dI7Rf
	 sY8/+2VSRyemie1HtxWobhMFKP1XBW6w1i7v6qK1UN0IkeAK7hNC5p/DJdB7fWbssXKsj
	 h3twO5c/lI9zC1OtaHXNFkJJYRx2TfHHvTLHl8lRZTvzxrKJg14BgvlgwjNgVi+lSPMg9
	 ipNSWuV+lbGnlgVCic6/xtarDv4TK+9hqKR4eFikRbSpSWrBDVbUwkWdhWMambnmpPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3840606AE3B
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 04:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3840606AE3B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxC9IDxgNr8B0iAA--.31814S3;
	Mon, 23 Nov 2026 12:50:11 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxX88AxgNrIsw2AA--.43924S4;
	Mon, 23 Nov 2026 12:50:10 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1 2/3] selftests/bpf: Allow unaligned access in callx_rodata_misaligned_read
Date: Mon, 23 Nov 2026 12:50:07 +0800
Message-ID: <20261123045008.23691-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261123045008.23691-1-yangtiezhu@loongson.cn>
References: <20261123045008.23691-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJAxX88AxgNrIsw2AA--.43924S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KrWxCF47AF45Aw4rWFy3trc_yoW8Cr18pr
	Z7ZasI9ryFyr1fuF4xAay7GFyrWrWqvay5Cw4xtr1YkFsrJFn7Xry8KF1kKryFgr4kXw1S
	va4Iqry8uw1kZabCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUoxR6UUUUU

On architectures that may lack CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
(such as RISC-V and LoongArch), the verifier rejects unaligned 8-byte
loads at offset +4 in callx_rodata_misaligned_read with a "misaligned
value access" error before reaching the intended function pointer
overlap check.

As this test focuses on verifying function pointer overlap rejection
rather than alignment enforcement, add `__flag(BPF_F_ANY_ALIGNMENT)`
to the test case to bypass strict alignment checks on architectures
lacking efficient unaligned access.

Before:
  $ sudo ./test_progs -t verifier_callx_rodata/callx_rodata_misaligned_read
  ...
  5: (79) r0 = *(u64 *)(r6 +4)
  misaligned value access off 352+4 size 8
  ...
  Summary: 0/0 PASSED, 0 SKIPPED, 1/1 FAILED

After:
  $ sudo ./test_progs -t verifier_callx_rodata/callx_rodata_misaligned_read
  ...
  Summary: 1/1 PASSED, 0 SKIPPED, 0/0 FAILED

Fixes: b018e998e645 ("selftests/bpf: Add tests for callx through pointers in read-only data")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/progs/verifier_callx_rodata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c b/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c
index 0389df720db2..8034e736d03a 100644
--- a/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c
+++ b/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c
@@ -770,6 +770,7 @@ __naked void callx_rodata_partial_read(void)
 }
 
 SEC("socket")
+__flag(BPF_F_ANY_ALIGNMENT)
 __failure __msg("read of 8 bytes at offset")
 __msg("overlaps with a pointer to a function")
 __naked void callx_rodata_misaligned_read(void)
-- 
2.42.0

