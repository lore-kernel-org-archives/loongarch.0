Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801553;
	b=sky31Tk+b5u1K6VW9jLDRZEfQx7kzP9Mprz+S0pG2KkBxvukPpZai0fsmodQTN70zdsB
	 LWeTcaaSmgNZKCWpcNL7mj4KEjHhmLv9swNPLyO+8J67IFTYUjc9sokDPjuCu+pn3NShe
	 VF6kMDrhXg/lLx4+xIjOC08QZDsi75SOyDi5ev/3JoH7jk8nJO34UQeEHjp6kzHA6cSgH
	 6Q5F0bzR411OJt6t4HN5CB54NAPLSNXPoWjWnY5YuaCnyFYXG7QFdXevQXog/XzZhgYbQ
	 LgArXBbdKCoLEAPQGyFVWesld/j4+aP4LQuI1zOJxmOpr20+aE6HUzROhW2VbFEULHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801553;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=gAtJiO5K2fmnWxGzxYN4gQDwpjSMMgPlhXq1rkQgr+M=;
	b=c7pfEt0ry33YrHrRc7ipt2LaCmwEEStVwyFBqkqB2US6DrXmIY+SB/JQMTvpXNjqhxm4
	 1h87PM950YT0sAfL2/SuP97XFe6qm0e7VjWf/VvpUWlZzWviJbYenE6aXyMi7Hw2LeNes
	 iakG5oTqGIhzVZ/xIeieMlYDx1pjLvrsA1tgB6+wnfVTqC+UWBYQ/HQz4QKrIjkWO9Pst
	 DvrdYfPOtug9bu6o4DWClgWvbNbsrkZ7/tP7S+XASdcPd7VDrsqyMD96Bh3+N6nv8/Mqj
	 8CMfvn6uMiSe7yFjG/ibPGA2s/qkb24FFq/ghSLVkFl76vhnTYcfEXUgcQPJuMXbV1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B28D606A31C
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 03:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B28D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxXdKOf_pqQgAgAA--.27102S3;
	Mon, 16 Nov 2026 11:59:10 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBxJs2Mf_pqKNE0AA--.64529S4;
	Mon, 16 Nov 2026 11:59:10 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 2/4] selftests/bpf: Skip jit_insns_arena tests if not supported
Date: Mon, 16 Nov 2026 11:59:05 +0800
Message-ID: <20261116035907.4215-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261116035907.4215-1-yangtiezhu@loongson.cn>
References: <20261116035907.4215-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJBxJs2Mf_pqKNE0AA--.64529S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ar1kKF1DuFyfXF4ruFW8Xwc_yoW8Zry7pF
	ykCw1vyryfX3WSv34UXrZrZ3yjkF4kGF98Cr1rJw4xJrnrXr1aqr1xKa4YgFs3WrWxZw15
	Zwn2kr9a93W7AFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=

When loading a BPF skeleton program via test_loader, certain test cases
such as jit_insns/cast_to_user may fail if the underlying hardware lacks
specific execution extensions required by newer features like BPF Arena.

Use libbpf_probe_bpf_map_type() in prog_tests/jit_insns.c to explicitly
check for BPF_MAP_TYPE_ARENA support before loading the jit_insns_arena
test skeleton. If the JIT backend or hardware does not support Arena,
use SKIP_TESTS() to cleanly report all subtests within the skeleton as
skipped.

This prevents false-alarm test failures on unsupported hardware while
preserving the core verification coverage for the rest of the standard
JIT instruction tests (such as alu_imm, alu_reg).

Before:
  $ sudo ./test_progs -a jit_insns/cast_to_user
  ...
  libbpf: map 'arena': failed to create: -EOPNOTSUPP
  run_subtest:FAIL:unexpected_load_failure unexpected error: -95 (errno 95)
  ...
  Summary: 0/0 PASSED, 0 SKIPPED, 1/1 FAILED

After:
  $ sudo ./test_progs -a jit_insns/cast_to_user
  ...
  Summary: 1/0 PASSED, 1 SKIPPED, 0/0 FAILED

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/prog_tests/jit_insns.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/jit_insns.c b/tools/testing/selftests/bpf/prog_tests/jit_insns.c
index 0aaab23a2eef..4110b1ff6ff8 100644
--- a/tools/testing/selftests/bpf/prog_tests/jit_insns.c
+++ b/tools/testing/selftests/bpf/prog_tests/jit_insns.c
@@ -3688,7 +3688,11 @@ static void test_tail_call(void)
 
 void test_jit_insns(void)
 {
-	RUN_TESTS(jit_insns_arena);
+	if (libbpf_probe_bpf_map_type(BPF_MAP_TYPE_ARENA, NULL))
+		RUN_TESTS(jit_insns_arena);
+	else
+		SKIP_TESTS(jit_insns_arena);
+
 	if (test__start_subtest("alu_imm"))
 		test_alu_imm();
 	if (test__start_subtest("alu_reg"))
-- 
2.42.0

