Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409415;
	b=HSb8yyZj67TtRv2zGkLfHiZ65tpz+LVaFds8S7ol087Yim6/8CvM97vz1KjFkMTBzte9
	 taj2q4hWdAIxLcr6JUY7WCvlSDzJ/tQzwdLe/TsalxKAPdZKNM+HeYRGvLWey3tgUtuuL
	 mkSiCaLRGHwqdf+69+n8uk6Foy0qTywXR3YydVBjBFP5Yc3kygrWJpL36nwmN5YYWjQeW
	 pl1EFA5KXugqfMEE1HRbJmikXTi/f/w5+SEauDj6VkoLXbJPOqEjs80uTkSwcon0HJ2g9
	 I0zWh87vWNqohWE1HIU5y48KEBYLzVazvz+61m5Vx5fidaHXwxx4ElDL4q4HZR9mE6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409415;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=YyXLF78KCettZXiSKq1HR6wyzPidcEExzxdLrgHUJkw=;
	b=Jtr4cGklM1Q4YPt4jni6p6Ntvp7RkSlN5I/SI+/ovwg3hMJQZ4JzDBL0kilCfcQC7K0R
	 Rl/0NxaueszES+lm4LgL5nNHSpEAJM3vq/YdjnbR6K8uDXoHxwnqWKoxQGF1qCWkhaKxU
	 fjjsOgu0x92N8mAu1issINDqcKncxDAjnz2wPEHqjy8szDUwySmU+FXV0dXeNwr18vIIZ
	 MuKFZDbCsQa2/PXhA15p+mEDlBApCyTFNn3ZhyF9y3ruelRYYbXqZBqPosrgZBnt5O4bE
	 tqyhb96Vi/G3QGe2nnhpwNMM30xyjIV70/FUeRnxocBaBJgCiCeqnVaN3C8YXxoGEwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDF060A261E
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 04:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDF060A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxztICxgNr7B0iAA--.31209S3;
	Mon, 23 Nov 2026 12:50:10 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxX88AxgNrIsw2AA--.43924S3;
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
Subject: [PATCH bpf-next v1 1/3] selftests/bpf: Enable instruction array test for LoongArch
Date: Mon, 23 Nov 2026 12:50:06 +0800
Message-ID: <20261123045008.23691-2-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJAxX88AxgNrIsw2AA--.43924S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtr1fWw17CFykCFWftr43Jwc_yoWkXFX_Ka
	12qrs7ZFWkCFyqq3W8uFySgFW8ur4rurs7Crn8Wry7J3WYgay5WFs5C3s8Aas8W39xJFW3
	tF4kX3y3Cr4rCosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

As the LoongArch JIT supports instruction array (gotox jump tables),
enable the corresponding BPF selftest for LoongArch.

With this patch:
  $ sudo ./test_progs -t bpf_insn_array | tail -1
  Summary: 1/20 PASSED, 0 SKIPPED, 0/0 FAILED

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c b/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c
index 4ffe4fe6b78e..6b1a426aa4cd 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c
@@ -5,7 +5,7 @@
 #include <test_progs.h>
 
 #if defined(__x86_64__) || defined(__powerpc__) || defined(__aarch64__) || \
-	(defined(__riscv) && __riscv_xlen == 64)
+	(defined(__riscv) && __riscv_xlen == 64) || defined(__loongarch__)
 static int map_create(__u32 map_type, __u32 max_entries)
 {
 	const char *map_name = "insn_array";
-- 
2.42.0

