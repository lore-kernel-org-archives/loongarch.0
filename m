Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074593;
	b=Ra9aWsm5/Zn6fHyoocGWM1kdlFX+wsgfRxmY273S9S/yc9Rh7jwLFhugpGTzxDjN13JI
	 Yd9P0+GsDYg6pMqQmaC2u91j2mj0okcvA+tis6MRwftUW+Z1+bQ7fNYaLcvc4ouufXwf2
	 1/ktzeOebs1m/zP7O/Nj4npaWqgRl6cVZmqgo2RQZuDGx0ttgwzx7vLcc4ptgZKMIKzNp
	 Rs5u86LFrn68AZijreDv/pfFfads6gNstI+eHGbOh0XdvSfOAYBt59WULMMLzaDHNZoj1
	 DDXwMO1z0AaLBSm0JrKXI/BTdMSgHW2IASgPfulcADCannurH4Zp7HM346y+6W+k0QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074593;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=OKh7RMy4z39rK+91H91FMymRIBmqD8DV3FbJDx+waE4=;
	b=ZC3mVqOGcvMuxw6dRlWF4WPpFH12l/bObNwgff/1jHBjj0Wvkm78m2d9oSrQe9PnfZfv
	 zM3H1jMSW/y7kHpV0RGJ+ETZ/jEpaEP04G2RW+5Eo883EnDhSJ28tgGRmHNOcsn3Hyqcj
	 PReqrcsOY7+a16S4gtVOOkLq1nKSZLpGNO3LbirFsfuTBODfwVGPaxiYbSVcytYulaf0A
	 F6A5j+UX0bAhfJ4f+Qcc4fpmHmvzBDjKuO2WTd3kMHii1k/HsO4VEOiVNpzZ7SdNgk58Q
	 +vO3n7XvDvMOfEKtXnwj0v1sTF8aAurFINi0ZOZM8wh9WWYxbQRs2n3+GLSfXy47vrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3952A606A330
	for <loongarch@lists.linux.dev>; Tue, 27 Oct 2026 04:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3952A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxvtKdJeBq67IZAA--.8986S3;
	Tue, 27 Oct 2026 12:16:29 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx1cycJeBqcY4wAA--.7654S2;
	Tue, 27 Oct 2026 12:16:29 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] selftests/bpf: Enable signed division and modulo overflow tests for LoongArch
Date: Tue, 27 Oct 2026 12:16:27 +0800
Message-ID: <20261027041627.20792-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
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
X-CM-TRANSID:qMiowJAx1cycJeBqcY4wAA--.7654S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAw47XFyfXr1xKFyruryUurX_yoWrXw1fpF
	WUuFZIgrs7Xw17uFWYvF4UJFs0q3WkuayrWF1rAw1Iy3s8JFnIq34Igws5Ca1rtFn5uw1F
	vF17ZasFv3Wjg3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8wNVDUUUUU==

The LoongArch hardware divider handles signed overflow boundaries (such
as INT_MIN/-1 or LLONG_MIN/-1) natively and perfectly well on physical
silicon: (1)for division operations, it naturally returns the dividend
itself; (2)for modulo operations, it returns 0. Thus enable the signed
division and modulo overflow tests for LoongArch in verifier_sdiv.c.

Before:

  $ sudo ./test_progs -t verifier_sdiv | grep "MIN/-1"
  #731/121 verifier_sdiv/SDIV64, overflow r/r, LLONG_MIN/-1:SKIP
  #731/123 verifier_sdiv/SDIV64, overflow r/i, LLONG_MIN/-1:SKIP
  #731/125 verifier_sdiv/SDIV32, overflow r/r, INT_MIN/-1:SKIP
  #731/127 verifier_sdiv/SDIV32, overflow r/i, INT_MIN/-1:SKIP
  #731/129 verifier_sdiv/SMOD64, overflow r/r, LLONG_MIN/-1:SKIP
  #731/131 verifier_sdiv/SMOD64, overflow r/i, LLONG_MIN/-1:SKIP
  #731/133 verifier_sdiv/SMOD32, overflow r/r, INT_MIN/-1:SKIP
  #731/135 verifier_sdiv/SMOD32, overflow r/i, INT_MIN/-1:SKIP

After:

  $ sudo ./test_progs -t verifier_sdiv | grep "MIN/-1"
  #731/121 verifier_sdiv/SDIV64, overflow r/r, LLONG_MIN/-1:OK
  #731/123 verifier_sdiv/SDIV64, overflow r/i, LLONG_MIN/-1:OK
  #731/125 verifier_sdiv/SDIV32, overflow r/r, INT_MIN/-1:OK
  #731/127 verifier_sdiv/SDIV32, overflow r/i, INT_MIN/-1:OK
  #731/129 verifier_sdiv/SMOD64, overflow r/r, LLONG_MIN/-1:OK
  #731/131 verifier_sdiv/SMOD64, overflow r/i, LLONG_MIN/-1:OK
  #731/133 verifier_sdiv/SMOD32, overflow r/r, INT_MIN/-1:OK
  #731/135 verifier_sdiv/SMOD32, overflow r/i, INT_MIN/-1:OK

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/progs/verifier_sdiv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_sdiv.c b/tools/testing/selftests/bpf/progs/verifier_sdiv.c
index d6cbe1e27fd6..5e8bf781e073 100644
--- a/tools/testing/selftests/bpf/progs/verifier_sdiv.c
+++ b/tools/testing/selftests/bpf/progs/verifier_sdiv.c
@@ -775,6 +775,7 @@ SEC("socket")
 __description("SDIV64, overflow r/r, LLONG_MIN/-1")
 __success __retval(1)
 __arch_x86_64
+__arch_loongarch
 __xlated("0: r2 = 0x8000000000000000")
 __xlated("2: r3 = -1")
 __xlated("3: r4 = r2")
@@ -839,6 +840,7 @@ SEC("socket")
 __description("SDIV64, overflow r/i, LLONG_MIN/-1")
 __success __retval(1)
 __arch_x86_64
+__arch_loongarch
 __xlated("0: r2 = 0x8000000000000000")
 __xlated("2: r4 = r2")
 __xlated("3: r2 = -r2")
@@ -887,6 +889,7 @@ SEC("socket")
 __description("SDIV32, overflow r/r, INT_MIN/-1")
 __success __retval(1)
 __arch_x86_64
+__arch_loongarch
 __xlated("0: w2 = -2147483648")
 __xlated("1: w3 = -1")
 __xlated("2: w4 = w2")
@@ -953,6 +956,7 @@ SEC("socket")
 __description("SDIV32, overflow r/i, INT_MIN/-1")
 __success __retval(1)
 __arch_x86_64
+__arch_loongarch
 __xlated("0: w2 = -2147483648")
 __xlated("1: w4 = w2")
 __xlated("2: w2 = -w2")
@@ -1001,6 +1005,7 @@ SEC("socket")
 __description("SMOD64, overflow r/r, LLONG_MIN/-1")
 __success __retval(0)
 __arch_x86_64
+__arch_loongarch
 __xlated("0: r2 = 0x8000000000000000")
 __xlated("2: r3 = -1")
 __xlated("3: r4 = r2")
@@ -1061,6 +1066,7 @@ SEC("socket")
 __description("SMOD64, overflow r/i, LLONG_MIN/-1")
 __success __retval(0)
 __arch_x86_64
+__arch_loongarch
 __xlated("0: r2 = 0x8000000000000000")
 __xlated("2: r4 = r2")
 __xlated("3: w2 = 0")
@@ -1105,6 +1111,7 @@ SEC("socket")
 __description("SMOD32, overflow r/r, INT_MIN/-1")
 __success __retval(0)
 __arch_x86_64
+__arch_loongarch
 __xlated("0: w2 = -2147483648")
 __xlated("1: w3 = -1")
 __xlated("2: w4 = w2")
@@ -1169,6 +1176,7 @@ SEC("socket")
 __description("SMOD32, overflow r/i, INT_MIN/-1")
 __success __retval(0)
 __arch_x86_64
+__arch_loongarch
 __xlated("0: w2 = -2147483648")
 __xlated("1: w4 = w2")
 __xlated("2: w2 = 0")
-- 
2.42.0

