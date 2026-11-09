Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197532;
	b=aFS8PWIeCJOaZOCTfe+7pvtROKl8ju9vshv8QRFugHoz8+7t9haniZTpeEtgIwPyOY0X
	 XLiJncAsTDX39VEz1GWMe/LWabYyCocFT5J3KC+VJ0w7pB2XnIr4NXUnkd6KIpTkIfSOJ
	 ocDNFtEEUszQcP3huFVO4Q8Km5A3hwWm/8w4rNlVQihYQWw8+uq/ZB1uOuA4Mo/eSU5jH
	 +l7UCJs1YJRHKp/2cENMW5OMtHcit5NmCQ0NWQde5mqFNXqBGF75iPQgJCN3djuR1p/po
	 KkZY251nliqsf+iK/ilspDiIL9QHgX6MpTk235qnNEaqDXRQ6ArcUfRz3O5gYbFucBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197532;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=2TguHwko21fivh+UAP4XrLKQb5/lOJ8y5+dOP7L0tb8=;
	b=yxEi9UAM+lUv69iwnxbPuFkBB3TE1RYnzsXPV3rNLl3nxMuMiTkWGSxxRG33Ew913IEz
	 /AS5K2P2rmob5vfS2EOcXiLk9Fu7hqpWyDxvbQdsNMxDpgffT0q/afX41Yp81QlBe79nU
	 NgHMljhx+/o8v8spEORGZ7c87b7iMrbmRgm6zUCuDWMc/2YacI4wudlZc1jjh45hdzzVX
	 a5zZPRheA0wPGwfxI6K7+yy7zrHVJIyEh9Kyl8I9+YrJ5f1HKyYuuJ3ZsZwqV58m4GgTe
	 IkhNM8h2vCLQbLTC3+cK3ENX24sszYTAC5qnhmj6Lx1qfELgGWm5RiXrp5RT/UPMVCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6902606A321
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 04:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6902606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxdvAZSPFqmLMdAA--.19792S3;
	Mon, 09 Nov 2026 12:12:09 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxxMwXSPFqQRwzAA--.11813S3;
	Mon, 09 Nov 2026 12:12:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 1/2] selftests/bpf: Skip jit_insns_arena tests if not supported
Date: Mon,  9 Nov 2026 12:12:06 +0800
Message-ID: <20261109041207.15221-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261109041207.15221-1-yangtiezhu@loongson.cn>
References: <20261109041207.15221-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJDxxMwXSPFqQRwzAA--.11813S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ar1kKF48Jw13Aw4fWrWkKrX_yoW8Zw4DpF
	92kw4vvrySq3WSvayDXrnrXrWjkFs5GF98Gw1rtw4xJrnrXr4aqr1xKa4YgFs3WrWxZw15
	Zw1j9r9aka47AFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

When loading a BPF skeleton program via test_loader, certain test cases
such as jit_insns/cast_to_user may fail if the underlying hardware lacks
specific execution extensions required by newer features like BPF Arena.

Use libbpf_probe_bpf_map_type() in prog_tests/jit_insns.c to explicitly
check for BPF_MAP_TYPE_ARENA support before loading the jit_insns_arena
test skeleton. If the JIT backend or hardware does not support Arena,
cleanly report the subtest status as SKIPPED via test__skip().

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
 tools/testing/selftests/bpf/prog_tests/jit_insns.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/jit_insns.c b/tools/testing/selftests/bpf/prog_tests/jit_insns.c
index 0aaab23a2eef..e8a0e5ec2d6b 100644
--- a/tools/testing/selftests/bpf/prog_tests/jit_insns.c
+++ b/tools/testing/selftests/bpf/prog_tests/jit_insns.c
@@ -3688,7 +3688,14 @@ static void test_tail_call(void)
 
 void test_jit_insns(void)
 {
-	RUN_TESTS(jit_insns_arena);
+	if (libbpf_probe_bpf_map_type(BPF_MAP_TYPE_ARENA, NULL)) {
+		RUN_TESTS(jit_insns_arena);
+	} else {
+		if (test__start_subtest("arena_zero_off"))
+			test__skip();
+		if (test__start_subtest("cast_to_user"))
+			test__skip();
+	}
 	if (test__start_subtest("alu_imm"))
 		test_alu_imm();
 	if (test__start_subtest("alu_reg"))
-- 
2.42.0

