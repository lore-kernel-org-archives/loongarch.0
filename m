Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801553;
	b=gaKylIQiy1AAewmd4ZGPfeP7lEuP3fmshv3sNOZgbJFhF0KzzwVZhnuXjPywlpuMhs4O
	 jjellgEefS2E4SAY5RvCFgGhb/JzQpXX83S1sUATyucDPoA5Eu2v/20IUJFn3nr698LzO
	 gjDsSq8ky2gVEEaOCnYAQRdlk98U7qnHAdn+HO5497s68AgIAE+nHyDaqWm0msJKflUcz
	 OCFbPIxurpsGlE4oGEymoCLwXDjMolY0FFMzxHl/ksGe2KRniOdrCSIm1P64p2qIMv8Ek
	 edaC+mNf+RA1jjEiOrl3Sc2qiZffISXQdc7CoVjR8OtteZHgW8DpSqlSJQa0JPUGuaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801553;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=QKL1PfMWl48y+cokHvC06JvN8TNyTmGSQuhTvZ3WXjs=;
	b=SzOVnN1ZNBJPjyn+RLM1E6UjgRmQSf1eTpl1E3Fu2IefvwaNW9MttMR+7kCDUJ7DTwz/
	 XYUqBkBJDoYfXOuSPfjOlg/yrl3l/Nfxu7Q7RMm8pqCl/aMcuCWWXgQ8slciZxUHHX8yO
	 dq+H9/jW5foZHgCOeCgbIYe8/96oZvydQCk6CtyX7GmH1yEb2BZCLye62Yx8ENb3QiBRo
	 4Z4PS7PqH9T9iSY16dDyJYhUiIz9D6EN9mA8nrTzXLDUrhIcsMPMGfH+73OcfAF8jhT0a
	 ceL2oKvseGLil07raLDKXcl+lHtinBNHhL/c8Editfkerq6Ww/jFGjqaRWt4rwBmgcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D921C606A32A
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 03:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D921C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxPNKOf_pqPgAgAA--.27053S3;
	Mon, 16 Nov 2026 11:59:10 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBxJs2Mf_pqKNE0AA--.64529S3;
	Mon, 16 Nov 2026 11:59:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 1/4] selftests/bpf: Add SKIP_TESTS() helper for test_loader
Date: Mon, 16 Nov 2026 11:59:04 +0800
Message-ID: <20261116035907.4215-2-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJBxJs2Mf_pqKNE0AA--.64529S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr48tr45CrW3WrW7Xw4rCrX_yoW8Kr1Upa
	y8Ja1UKr9rJ3W3Xw1UJayUWFWftr1kJ3WfAr10qr1vvr13XryUtr1fK3WxtFnxW3yFqw1f
	Zas29w4a9r1UJFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8niSPUUUUU==

When running BPF selftests on underlying hardware that lacks specific
execution extensions (such as BPF Arena support), loading certain test
skeletons failed, logging unexpected failures instead of declaring them
as skipped.

Manually hardcoding a skip list of subtest names inside the prog_tests
runner files is fragile and prone to silent omission when new subtests
are appended to the skeleton.

Add a `skip` field to `struct test_loader` along with a `SKIP_TESTS()`
macro (mirroring `RUN_TESTS()`) so test runners can iterate through
and mark all subtests in a skeleton as skipped.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/test_loader.c | 5 +++++
 tools/testing/selftests/bpf/test_progs.h  | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/tools/testing/selftests/bpf/test_loader.c b/tools/testing/selftests/bpf/test_loader.c
index d24e4fedae46..b5e85bb627d3 100644
--- a/tools/testing/selftests/bpf/test_loader.c
+++ b/tools/testing/selftests/bpf/test_loader.c
@@ -1374,6 +1374,11 @@ void run_subtest(struct test_loader *tester,
 	if (!test__start_subtest_with_desc(subspec->name, subspec->description))
 		return;
 
+	if (tester->skip) {
+		test__skip();
+		return;
+	}
+
 	if (spec->skip_reason) {
 		printf("%s:SKIP: %s\n", __func__, spec->skip_reason);
 		test__skip();
diff --git a/tools/testing/selftests/bpf/test_progs.h b/tools/testing/selftests/bpf/test_progs.h
index adc18f5eceb6..89572c762b57 100644
--- a/tools/testing/selftests/bpf/test_progs.h
+++ b/tools/testing/selftests/bpf/test_progs.h
@@ -530,6 +530,7 @@ struct test_loader {
 	pre_execution_cb pre_execution_cb;
 
 	struct bpf_object *obj;
+	bool skip;
 };
 
 static inline void test_loader__set_pre_execution_cb(struct test_loader *tester,
@@ -553,6 +554,13 @@ extern void test_loader_fini(struct test_loader *tester);
 	test_loader_fini(&tester);					       \
 })
 
+#define SKIP_TESTS(skel) ({							\
+	struct test_loader tester = { .skip = true };				\
+										\
+	test_loader__run_subtests(&tester, #skel, skel##__elf_bytes);		\
+	test_loader_fini(&tester);						\
+})
+
 struct expect_msg {
 	const char *substr; /* substring match */
 	regex_t regex;
-- 
2.42.0

